 //
//  HomeNewMedakTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeNewMedakTableView.h"
#import "HomeNewMedalTableViewCell.h"

#import "MedalListXQViewController.h"
@interface HomeNewMedakTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation HomeNewMedakTableView{
    BaseView * xian;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.separatorStyle = UITableViewStyleGrouped;
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
    return _itemarray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    HomeNewMedalTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[HomeNewMedalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
//        xian = [BaseView new];
//        xian.backgroundColor = RGB(211,223,223);
//        [cell.contentView addSubview:xian];
//        [xian mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(cell.contentView.mas_left).with.offset(LENGTH(25));
//            make.right.mas_equalTo(cell.contentView.mas_right).with.offset(LENGTH(25));
//            make.top.mas_equalTo(cell.contentView.mas_top).with.offset(1);
//            make.height.mas_equalTo(1);
//        }];
    }
    cell.nav = self.nav;
    cell.model = _itemarray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
    
}
//设置分割线上下去边线，顶头缩进15
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIEdgeInsets UIEgde = UIEdgeInsetsMake(0, 25, 0, 25);
    
    
    if (indexPath.row == _itemarray.count-1) {
        cell.preservesSuperviewLayoutMargins = NO;
        cell.layoutMargins = UIEdgeInsetsZero;
        cell.separatorInset = UIEdgeInsetsMake(0, WIDTH, 0, 0);
    }else{
        [cell setSeparatorInset:UIEgde];
        
    }
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return
//}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
-(NSArray *)cellsForTableView:(UITableView *)tableView
{
    NSInteger sections = tableView.numberOfSections;
    NSMutableArray *cells = [[NSMutableArray alloc]  init];
    for (int section = 0; section < sections; section++) {
        NSInteger rows =  [tableView numberOfRowsInSection:section];
        for (int row = 0; row < rows; row++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            [cells addObject:[tableView cellForRowAtIndexPath:indexPath]];
        }
    }
    return cells;
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
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
    MedalListXQViewController * vc = [MedalListXQViewController new];
    BadgeListModel * model = _itemarray[indexPath.row];
    vc.itemid = model.ssid;
    [self.nav pushViewController:vc animated:YES];
    
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self uptableview];
//    });
}
- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.contentSize.height);
    }];
}
- (void)uptableview{
    WS(ws);
    CGFloat tabheight = 0;
    NSArray * cellarray = [self cellsForTableView:self
                           ];
    for (HomeNewMedalTableViewCell * cell in cellarray) {
        tabheight = tabheight + cell.frame.size.height;
    }
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(tabheight);
    }];
}
@end
