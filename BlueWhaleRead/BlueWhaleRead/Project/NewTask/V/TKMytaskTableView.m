//
//  TKMytaskTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "TKMytaskTableView.h"
#import "TTKMytaskXinShouableViewCell.h"
#import "TKMytaskOtherTableViewCell.h"
#import "TAskForViewController.h"
@interface TKMytaskTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation TKMytaskTableView

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
    return _itemArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TKMyListModel * model = _itemArray[indexPath.row];
    if ([model.mission.mission_type isEqualToString:@"1"]) {
        NSString * rid = @"celltop";
        TTKMytaskXinShouableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[TTKMytaskXinShouableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = model;
        return cell;
    }else{
        NSString * rid = @"cell";
        TKMytaskOtherTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[TKMytaskOtherTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = model;
        return cell;
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

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return TabBarHeight+50;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = [UIColor clearColor];
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TKMyListModel * model = _itemArray[indexPath.row];
    TAskForViewController * vc = [TAskForViewController new];
    vc.weizhi = @"1";
    vc.type = @"1";
    vc.studentMissionid = [NSString stringWithFormat:@"%@",model.studentMission.ssid];
    vc.missionid = [NSString stringWithFormat:@"%@",model.mission.ssid];
    vc.navtitle = model.mission.mission_name;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}

@end
