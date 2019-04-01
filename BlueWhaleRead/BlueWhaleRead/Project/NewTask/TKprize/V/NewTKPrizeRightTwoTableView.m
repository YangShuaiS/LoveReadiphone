//
//  NewTKPrizeRightTwoTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/28.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NewTKPrizeRightTwoTableView.h"
#import "TKPTableViewCell.h"
@interface NewTKPrizeRightTwoTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation NewTKPrizeRightTwoTableView

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
        self.scrollEnabled = NO;
    }
    return self;
}

#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    TKPListModel * model = _itemArray[section];
    return _model.prizeList.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    TKPTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[TKPTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.model = _model.prizeList[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return LENGTH(155);
//}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return LENGTH(52);
}

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
    v.backgroundColor = RGB(238,238,238);
    BaseLabel * qi = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(3,3,3) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:[NSString stringWithFormat:@"第%@期奖品",_model.periodsNum]];
    [v addSubview:qi];
    [qi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(v);
    }];
    UIView * xian = [UIView new];
    xian.backgroundColor = RGB(220,220,220);
    [v addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(v).with.offset(LENGTH(14));
        make.right.mas_equalTo(v).with.offset(-LENGTH(14));
        make.bottom.mas_equalTo(v).with.offset(-LENGTH(1));
        make.height.mas_equalTo(1);
    }];
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

- (void)setModel:(TKPListModel *)model{
    _model = model;
    [self reloadData];

}
@end
