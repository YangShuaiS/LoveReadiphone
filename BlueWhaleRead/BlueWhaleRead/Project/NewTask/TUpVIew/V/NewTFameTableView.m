//
//  NewTFameTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/28.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NewTFameTableView.h"
#import "NewTFameViewTableViewCell.h"
#import "TAskForViewController.h"
@interface NewTFameTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation NewTFameTableView{
    NSMutableArray * itemarray;
}
- (void)setType:(NSString *)type{
    _type = type;
    [self LoadData];
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_MRT];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"type":_type,@"missionid":_missionid};
    //    NSDictionary * dic = @{@"studentid":@"12"};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TFameViewModel * model = [TFameViewModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}
- (void)UpData:(TFameViewModel *)model{
    itemarray = model.studentRankList;
    if (model.student.myRank.length == 0 || ![model.student.myRank isEqualToString:@"0"]) {
        [itemarray insertObject:model.student atIndex:0];
    }
    [self reloadData];
}
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
    return itemarray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    NewTFameViewTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[NewTFameViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.type = _type;
    cell.inter = indexPath.row;
    cell.model = itemarray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return LENGTH(1000);
//}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return LENGTH(30);
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
    v.backgroundColor = [UIColor whiteColor];
    BaseLabel * leftlabel = [[BaseLabel alloc] initWithTxteColor:RGB(150,150,150)LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"排名"];
    [v addSubview:leftlabel];
    [leftlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(v);
        make.left.mas_equalTo(v).with.offset(LENGTH(27));
    }];
    
    BaseLabel * centerlabel = [[BaseLabel alloc] initWithTxteColor:RGB(150,150,150)LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"用户名"];
    [v addSubview:centerlabel];
    [centerlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(v);
        make.left.mas_equalTo(v).with.offset(LENGTH(113));
    }];
    
    BaseLabel * rightlabel = [[BaseLabel alloc] initWithTxteColor:RGB(150,150,150)LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"分数"];
    [v addSubview:rightlabel];
    [rightlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(v);
        make.left.mas_equalTo(v).with.offset(LENGTH(297));
    }];
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TFVUserModel * model = itemarray[indexPath.row];
    if ([_type isEqualToString:@"1"]) {
        if (indexPath.row == 0) {
            
        }else{
            TAskForViewController * vc = [TAskForViewController new];
            vc.type = @"2";
            vc.friendid = model.ssid;
            vc.missionid = _missionid;
            vc.navtitle = model.name;
            [[self viewController].navigationController  pushViewController:vc animated:YES];
        }
    }else{
        TAskForViewController * vc = [TAskForViewController new];
        vc.type = @"2";
        vc.friendid = model.ssid;
        vc.missionid = _missionid;
        vc.navtitle = model.name;
        [[self viewController].navigationController  pushViewController:vc animated:YES];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.blocks(scrollView.contentOffset.y);
}
@end
