//
//  PersonalTableView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonalTableView.h"
#import "PersonalTableViewCell.h"
#import "PersonXGphoneViewController.h"
@interface PersonalTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation PersonalTableView{
    NSArray * titleArray;
    NSArray * subArray;
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
    }
    return self;
}
- (void)setModel:(MyZiLiaoModel *)model{
    _model = model;
    titleArray = @[@"姓名",@"账号",@"等级",@"修改预留手机号",@"学校",@"班级",@"性别"];
    NSString * xb;
    if (model.sex == 1) {
        xb = @"男";
    }else{
        xb = @"女";
    }
    subArray = @[model.name,model.code,model.level,model.phone,model.school,model.clazz,xb];
    [self reloadData];
}
#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArray.count+1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = [NSString stringWithFormat:@"cell%ld",(long)indexPath.row];
    PersonalTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        if(indexPath.row == 0){
            cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewTopStyle];
            cell.model = _model;
            cell.baseview = self.baseview;
        }else if (indexPath.row == 4){
            cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewDownClickStyle];
            cell.title = titleArray[indexPath.row-1];
            cell.subtitle = subArray[indexPath.row - 1];

        }else{
            cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewDownStyle];
            cell.title = titleArray[indexPath.row-1];
            cell.subtitle = subArray[indexPath.row - 1];
        }
    }
    cell.nav = self.nav;
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
-(NSArray *)cellsForTableView:(UITableView *)tableView
{
    NSInteger sections = tableView.numberOfSections;
    NSMutableArray *cells = [[NSMutableArray alloc]  init];
    for (int section = 0; section < sections; section++) {
        NSInteger rows =  [tableView numberOfRowsInSection:section];
        for (int row = 0; row < rows; row++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            [cells addObject:[tableView cellForRowAtIndexPath:indexPath]];
        }
    }
    return cells;
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(231,242,242);
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4) {
        PersonXGphoneViewController * vc = [PersonXGphoneViewController new];
        [self.nav pushViewController:vc animated:YES];
    }
    
}
@end
