//
//  UnreadBookListTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UnreadBookListTableView.h"
#import "BookTableViewCell.h"
#import "DTALLiewController.h"
#import "BookXqViewController.h"
@interface UnreadBookListTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation UnreadBookListTableView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.separatorStyle = UITableViewStylePlain;
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];
        //使tableview无数据时候无下划线
        self.tableFooterView = [[UIView alloc]init];
        self.estimatedRowHeight = 300;//估算高度
        self.rowHeight = UITableViewAutomaticDimension;
    }
    return self;
}

#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _itemarray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    BookTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[BookTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.nav = self.nav;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.bookCase = BookCaseStyleSJWD;
    cell.unreadBookModel = _itemarray[indexPath.section];
    return cell;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return LENGTH(5);
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(231,242,242);
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    BookXqViewController * vc = [BookXqViewController new];
    UnreadBookModel * model = _itemarray[indexPath.section];
    vc.loadId = model.ssid;
    [self.nav pushViewController:vc animated:YES];
    
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}

#pragma mark ------------------- 删除操作
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_itemarray removeObjectAtIndex:indexPath.section];
//        [tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 设置删除按钮
    WS(ws);
    UnreadBookModel * model = self->_itemarray[indexPath.section];
    NSString * tz;
    if (model.dayTimes>0) {
        tz = @" 答题 ";
    }else{
        tz = @" 明日 \n再来 ";
    }

    
    UITableViewRowAction *noDeleAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@" 移除 \n 书架 " handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        //事件
        [self remoCell:model Inter:indexPath];
    }];
    
    //挑战答题
    UITableViewRowAction *noLoveAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:tz handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        if (model.dayTimes>0) {
            [self bookcity:model];
        }else{
        }

    }];
    if (model.dayTimes>0) {
        noLoveAction.backgroundColor = RGBA(255,167,96,1);
    }else{
        noLoveAction.backgroundColor = RGBA(255,167,96,0.6);
    }
    noDeleAction.backgroundColor = RGB(254,127,124);
    
    return @[noDeleAction,noLoveAction];
}

- (void)bookcity:(UnreadBookModel *)model{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TZDTTIMU];
    NSDictionary * dic = @{@"bookid":model.ssid,@"studentid":Me.ssid};

    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            //事件
            if ([self.nav respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
                self.nav.interactivePopGestureRecognizer.enabled = NO;
            }
            model.dayTimes--;
            [self reloadData];
            
            TheTopPicModel *Topmodel = [TheTopPicModel mj_objectWithKeyValues:responseObject];
            if ([Topmodel.code isEqual:@200]) {
                
                WS(ws);
                GeneralUpView * genView = [GeneralUpView new];
                genView.style = PopUpViewStyleAnswer;
                [self.nav.view addSubview:genView];
                [genView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.mas_equalTo(ws.nav.view);
                }];
                NSString *str_minute = [NSString stringWithFormat:@"%02ld",(Topmodel.time%3600)/60];//分
                
                GenPopViewModel * m = [GenPopViewModel new];
                m.title = @"答题说明";
                NSMutableArray * arr = model.badgeList;
                CityBadgeListModel * citymodel = [CityBadgeListModel new];
                if (arr.count>0) {
                    citymodel = arr[0];
                }else{
                    citymodel.name = @"";
                }
                m.subtitle = [NSString stringWithFormat:@"一共%ld道题\n你必须在%@分钟之内答完所有题目\n答题成功之后可以点亮\n%@\n你准备好了吗？",Topmodel.bookProblems.count,str_minute,citymodel.name];
                genView.model = m;
                [genView setBlock:^{
                    DTALLiewController * vc = [DTALLiewController new];
                    vc.style = DTBookStyle;
                    vc.titles = @"挑战答题";
                    vc.Topmodel = Topmodel;
                    vc.bookid = model.ssid;
                    vc.bookname = model.name;
                    vc.bookfenshu = model.b_score;
                    [self.nav pushViewController:vc animated:YES];
                }];
            }
        }else{
            
        }
    }];
}


- (void)remoCell:(UnreadBookModel *)model Inter:(NSIndexPath *)indexPath{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_REMOVEBOOKCITY];
    NSDictionary * dic = @{@"bookid":model.ssid,@"studentid":Me.ssid};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TheTopPicModel *Topmodel = [TheTopPicModel mj_objectWithKeyValues:responseObject];
            if ([Topmodel.code isEqual:@200]) {
                [self tableView:self commitEditingStyle:UITableViewCellEditingStyleDelete forRowAtIndexPath:indexPath];
                [self->_itemarray removeObjectAtIndex:indexPath.section];
                [self deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
        }else{
            
        }
    }];
}
@end
