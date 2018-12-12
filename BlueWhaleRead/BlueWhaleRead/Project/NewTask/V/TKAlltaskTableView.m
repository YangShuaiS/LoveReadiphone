//
//  TKAlltaskTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKAlltaskTableView.h"
#import "TKAlltaskTableViewCell.h"
#import "TKAllraskTopTableViewCell.h"
#import "TAskForViewController.h"
#import "TKbuiltUpView.h"
#import "TaskXqViewController.h"
@interface TKAlltaskTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation TKAlltaskTableView
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
    TKTaskListModel * model = _itemArray[indexPath.row];
    if ([model.mission_type isEqualToString:@"1"]) {
        NSString * rid = @"celltop";
        TKAllraskTopTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[TKAllraskTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = model;
        return cell;
    }else{
        NSString * rid = @"cell";
        TKAlltaskTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[TKAlltaskTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
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
    TKTaskListModel * model = _itemArray[indexPath.row];
    if ([model.mission_type isEqualToString:@"4"]) {
        TKbuiltUpView * v = [TKbuiltUpView new];
        v.nav = [self viewController].navigationController;
        [[self viewController].view.window addSubview:v];
        WS(ws);
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo([ws viewController].view.window);
        }];
    }else{
        TAskForViewController * vc = [TAskForViewController new];
        vc.type = @"1";
        vc.missionid = [NSString stringWithFormat:@"%@",model.ssid];
        vc.navtitle = model.prize_name;
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }    
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}

@end
