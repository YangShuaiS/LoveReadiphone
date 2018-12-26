//
//  TKIssueTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKIssueTableView.h"
#import "TKIssueTableViewCell.h"
@interface TKIssueTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation TKIssueTableView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.separatorStyle = UITableViewStylePlain;
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = RGB(238, 238, 238);
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
    TKPWQModel * model = _itemArray[section];
    return model.pastLottery1Info.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _itemArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = [NSString stringWithFormat:@"cell%ld",indexPath.row];
    TKIssueTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[TKIssueTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    TKPWQModel * model = _itemArray[indexPath.section];

    cell.nav = self.nav;
    cell.model = model.pastLottery1Info[indexPath.row];
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
    v.backgroundColor =  RGB(238, 238, 238);
    TKPWQModel * model = _itemArray[section];
        BaseLabel * dj = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(3,3,3) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:[NSString stringWithFormat:@"第%@期",model.periodsNum]];
        [v addSubview:dj];
        [dj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(v).with.offset(LENGTH(9));
            make.bottom.mas_equalTo(v).with.offset(-LENGTH(9));
            make.left.mas_equalTo(v).with.offset(LENGTH(34));
        }];

        BaseLabel * qi = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(3,3,3) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:[NSString stringWithFormat:@"开奖日期 %@",model.create_time]];
        [v addSubview:qi];
        [qi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(dj.mas_right).with.offset(LENGTH(24));
             make.centerY.mas_equalTo(v);
        }];
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
- (void)setModel:(TKPrizeModel *)model{
    _model = model;
    _itemArray = model.pastLotteryList;
    [self reloadData];
}

@end
