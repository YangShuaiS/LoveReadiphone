//
//  MMviewTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MMviewTableView.h"
#import "MyClassViewController.h"
#import "PersonalViewController.h"
#import "PersonSheZhiViewController.h"
#import "BaseNavigationViewController.h"
#import "UserLoginViewController.h"
#import "MMviewTableViewCell.h"
@interface MMviewTableView ()<UITableViewDelegate,UITableViewDataSource>

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
        self.bounces = NO;
        itemarray = @[@"我的班级",@"个人资料",@"设置"];
        imagearray = @[@"我的班级",@"个人资料",@"设置"];
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
    if ([Me.is_rebot isEqualToString:@"2"]) {
        if (indexPath.row == 0) {
            MyClassViewController * vc = [MyClassViewController new];
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 1){
            PersonalViewController * vc = [PersonalViewController new];
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 2){
            PersonSheZhiViewController * vc = [PersonSheZhiViewController new];
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }
    }else{
        if (indexPath.row == 2) {
            PersonSheZhiViewController * vc = [PersonSheZhiViewController new];
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }else{
            BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:[UserLoginViewController new]];
            [[self viewController] presentViewController:homenav animated:YES completion:^{
                
            }];
        }
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.contentSize.height); 
    }];
}
@end
