//
//  TKPTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKPTableView.h"
#import "TKPTableViewCell.h"
@interface TKPTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation TKPTableView

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
    TKPListModel * model = _itemArray[section];
    return model.prizeList.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _itemArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        NSString * rid = @"cell";
        TKPTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[TKPTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        }
        TKPListModel * model = _itemArray[indexPath.section];
        cell.model = model.prizeList[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return
//}

//- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 0;
//}
//
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = [UIColor whiteColor];
    if (section == 0) {
        BaseLabel * dj = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,125,29) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"快来参加新手任务，赢取超级大奖吧！"];
        [v addSubview:dj];
        [dj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(v).with.offset(LENGTH(20));
            make.left.and.right.mas_equalTo(v);
        }];
        
        BaseLabel * qi = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(3,3,3) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"本期奖品"];
        [v addSubview:qi];
        [qi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(dj.mas_bottom).with.offset(LENGTH(18));
            make.left.and.right.mas_equalTo(v);
            make.bottom.mas_equalTo(-LENGTH(10));
        }];
    }else{
        TKPListModel * model = _itemArray[section];

        BaseLabel * qi = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(3,3,3) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:[NSString stringWithFormat:@"第%@期奖品",model.periodsNum]];
        [v addSubview:qi];
        [qi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(v).with.offset(LENGTH(10));
            make.left.and.right.mas_equalTo(v);
            make.bottom.mas_equalTo(-LENGTH(10));
        }];
    }
    
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}

@end
