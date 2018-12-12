//
//  MMviewTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MMviewTableView.h"
#import "MMviewTableViewCell.h"
#import "MMyViewTopView.h"

#import "BookListViewController.h"
#import "MyClassViewController.h"
#import "HomeMilestoneViewController.h"
#import "AchievementReportViewController.h"
#import "PersonalViewController.h"
#import "PersonSheZhiViewController.h"
#import "TKMytaskViewController.h"


#import "TKAlltaskViewController.h"
#import "TKAwardViewController.h"
#import "TKPrizeViewController.h"
#import "TKIssueViewController.h"
#import "TFameViewController.h"
#import "TUpView.h"
#import "TKJUpView.h"
#import "TCompleteView.h"
@interface MMviewTableView ()<UITableViewDelegate,UITableViewDataSource>{
    MMyViewTopView * v;
}

@end
@implementation MMviewTableView{
    NSArray * itemarray;
    NSArray * imagearray;

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
        
        itemarray = @[@"能力测试",@"我的书架",@"我的任务",@"我的班级",@"我的里程碑",@"我的成就",@"个人资料",@"设置"];
        imagearray = @[@"能力测试",@"我的书架",@"我的任务",@"我的班级",@"我的里程碑",@"我的成就",@"组 302-1",@"组 303-1"];
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
    MMviewTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[MMviewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.nav = self.nav;
    cell.namestring = itemarray[indexPath.row];
    cell.imagestring = imagearray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [UIView new];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        self.block(0);
    }else if (indexPath.row == 1){
        BookListViewController * vc = [BookListViewController new];
        [self.nav pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
//        WS(ws);
//        TCompleteView * topview = [TCompleteView new];
//        [self.window addSubview:topview];
//        [topview mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(ws.window);
//        }];
        TKMytaskViewController * vc = [TKMytaskViewController new];
        [self.nav pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        MyClassViewController * vc = [MyClassViewController new];
        [self.nav pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        HomeMilestoneViewController * vc = [HomeMilestoneViewController new];
        [self.nav pushViewController:vc animated:YES];
    }else if (indexPath.row == 5){
        AchievementReportViewController * vc = [AchievementReportViewController new];
        [self.nav pushViewController:vc animated:YES];
    }else if (indexPath.row == 6){
        PersonalViewController * vc = [PersonalViewController new];
        [self.nav pushViewController:vc animated:YES];
    }else if (indexPath.row == 7){
        PersonSheZhiViewController * vc = [PersonSheZhiViewController new];
        [self.nav pushViewController:vc animated:YES];
    }
}

@end
