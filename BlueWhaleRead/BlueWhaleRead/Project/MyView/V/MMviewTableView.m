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
#import "MyAccountViewController.h"
#import "FeedbackViewController.h"
#import "BuyInvitationXQViewController.h"
#import "AgreementViewController.h"
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
//        itemarray = @[@"我的班级",@"个人资料",@"设置"];
//        imagearray = @[@"我的班级",@"个人资料",@"设置"];
        itemarray = @[@"我的班级",@"邀请有礼",@"我的账户",@"常见问题",@"意见反馈",@"检查更新",@"设置"];
        imagearray =@[@"我的班级",@"邀请有礼",@"我的账户",@"常见问题",@"意见反馈",@"检查更新",@"设置"];
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
    cell.inter = indexPath.row;
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
        MyClassViewController * vc = [MyClassViewController new];
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        if ([Me.is_rebot isEqualToString:@"2"]) {
            BuyInvitationXQViewController * vc = [BuyInvitationXQViewController new];
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }else{
            BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:[UserLoginViewController new]];
            [[self viewController] presentViewController:homenav animated:YES completion:^{
                
            }];
        }
    }else if (indexPath.row == 2){
        if ([Me.is_rebot isEqualToString:@"2"]) {
            MyAccountViewController * vc =[MyAccountViewController new];
            [[self viewController].navigationController pushViewController:vc animated:YES];
        }else{
            BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:[UserLoginViewController new]];
            [[self viewController] presentViewController:homenav animated:YES completion:^{
                
            }];
        }

    }else if (indexPath.row == 3){
        AgreementViewController * vc = [AgreementViewController new];
        vc.titl = @"常见问题";
        vc.url = @"http://tiantianaidu.com/app_help/member_help.html";
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        FeedbackViewController * vc = [FeedbackViewController new];
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 5){
        NSInteger iosVersionCodes = [APP_BUILD integerValue];
        if (iosVersionCode > iosVersionCodes) {
            NSString * url ;
            url = [[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/博万卷-学生中文课外阅读app/id1434054632?mt=8"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        }
    }
    else if (indexPath.row == 6){
        PersonSheZhiViewController * vc = [PersonSheZhiViewController new];
        [[self viewController].navigationController pushViewController:vc animated:YES];
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
