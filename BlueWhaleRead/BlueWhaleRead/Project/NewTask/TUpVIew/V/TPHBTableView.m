//
//  TPHBTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TPHBTableView.h"
#import "TPHBTableViewCell.h"
#import "TAskForViewController.h"
@interface TPHBTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation TPHBTableView

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
    NSString * rid = @"TPHBTableViewCell";
    TPHBTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[TPHBTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.bianse = _bianse;
    cell.inter = indexPath.row;
    cell.model = _itemArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
    return 0;
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
    TFVUserModel * model = _itemArray[indexPath.row];
    if ([_bianse isEqualToString:@"1"]) {
        if (indexPath.row == 0) {
            
        }else{
            TAskForViewController * vc = [TAskForViewController new];
            vc.type = @"2";
            vc.friendid = model.ssid;
            vc.missionid = _missionid;
            vc.navtitle = model.name;
            [self.nav pushViewController:vc animated:YES];
        }
    }else{
        TAskForViewController * vc = [TAskForViewController new];
        vc.type = @"2";
        vc.friendid = model.ssid;
        vc.missionid = _missionid;
        vc.navtitle = model.name;
        [self.nav pushViewController:vc animated:YES];
    }
    self.block();
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}
@end
