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


#import "AccountSettingsViewController.h"
#import "WanShanXinXiViewController.h"
#import "ModifyNameViewController.h"

#import <MOFSPickerManager.h>
@interface PersonalTableView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *provinces;
@property(nonatomic,assign)NSInteger provinceIndex;
@property(nonatomic,assign)NSInteger provinceIndextwo;

@end
@implementation PersonalTableView{
    NSArray * titleArray;
    NSArray * subArray;
    UserCityModel * citymodel;
    
    NSArray * arr;
    
    MyDeModel * mo;
    MyZiLiaoModel * newModel;
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
    NSString * xb;
    if (model.sex == 1) {
        xb = @"男";
    }else{
        xb = @"女";
    }
    NSString * phone = model.phone;
    if (phone.length == 11) {
        NSRange rangeone = {0,3};
        NSRange rangetwo = {7,4};
        NSString * str = [NSString stringWithFormat:@"%@****%@",[phone substringWithRange:rangeone],[phone substringWithRange:rangetwo]];
        phone = str;
    }else{
        phone = @"";
    }
    if ([_model.source isEqualToString:@"2"]) {
        titleArray = @[@"昵称",@"生日",@"等级",@"账号/绑定设置",@"所在地区",@"学校",@"班级",@"性别"];
        NSString * area = model.area;
        NSString * true_school = model.true_school;
        NSString * true_class = model.true_class;
        area=[area isEqualToString:@""]?@"待完善":area;
        true_school=[true_school isEqualToString:@""]?@"待完善":true_school;
        true_class=[true_class isEqualToString:@""]?@"待完善":true_class;
        subArray = @[model.name,model.birthday,[NSString stringWithFormat:@"Lv%@",model.level],phone,area,true_school,true_class,xb];
    }else{
        titleArray = @[@"昵称",@"等级",@"修改预留手机号",@"学校",@"班级",@"性别"];
        subArray = @[model.name,[NSString stringWithFormat:@"Lv%@",model.level],phone,model.school,model.clazz,xb];

    }
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
        if ([_model.source isEqualToString:@"2"]) {
            if(indexPath.row == 0){
                cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewTopStyle];
                cell.model = _model;
                cell.baseview = self.baseview;
            }else if (indexPath.row == 4){
                cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewDownClickStyle];
                cell.title = titleArray[indexPath.row-1];
                cell.subtitle = subArray[indexPath.row - 1];
            }else if (indexPath.row == 1||indexPath.row == 5||indexPath.row == 6||indexPath.row ==7){
                cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewDownClickStyle];
                cell.title = titleArray[indexPath.row-1];
                cell.subtitle = subArray[indexPath.row - 1];
            }else{
                cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewDownStyle];
                cell.title = titleArray[indexPath.row-1];
                cell.subtitle = subArray[indexPath.row - 1];
            }
        }else{
            if(indexPath.row == 0){
                cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewTopStyle];
                cell.model = _model;
                cell.baseview = self.baseview;
            }else if (indexPath.row == 3){
                cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewDownClickStyle];
                cell.title = titleArray[indexPath.row-1];
                cell.subtitle = subArray[indexPath.row - 1];
            }else{
                cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewDownStyle];
                cell.title = titleArray[indexPath.row-1];
                cell.subtitle = subArray[indexPath.row - 1];
            }
        }
    }
    if ([_model.source isEqualToString:@"2"]) {
        if (indexPath.row == 1||indexPath.row == 5||indexPath.row == 6||indexPath.row ==7){
            cell.title = titleArray[indexPath.row-1];
            cell.subtitle = subArray[indexPath.row - 1];
        }
    }else{
        
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
    if ([_model.source isEqualToString:@"2"]) {
        if (indexPath.row == 1) {
            ModifyNameViewController * vc = [ModifyNameViewController new];
            [self.nav pushViewController:vc animated:YES];
            [vc setBlock:^{
                [self LoadData];
            }];
        }else if (indexPath.row == 4) {
        AccountSettingsViewController * vc = [AccountSettingsViewController new];
        vc.phonetext = subArray[indexPath.row - 1];
        [self.nav pushViewController:vc animated:YES];
    }else if (indexPath.row ==5){
        [self diqu];
    }else if (indexPath.row == 6){
        WanShanXinXiViewController * vc = [WanShanXinXiViewController new];
        vc.style = WanShanXinXiStyleScholl;
        [self.nav pushViewController:vc animated:YES];
        [vc setBlock:^{
            [self LoadData];
        }];
    }else if (indexPath.row == 7){
        WanShanXinXiViewController * vc = [WanShanXinXiViewController new];
        vc.style = WanShanXinXiStyleClass;
        [self.nav pushViewController:vc animated:YES];
        [vc setBlock:^{
            [self LoadData];
        }];
    }
    }else{
        if (indexPath.row == 3) {
            AccountSettingsViewController * vc = [AccountSettingsViewController new];
            vc.phonetext = subArray[indexPath.row - 1];
            [self.nav pushViewController:vc animated:YES];
        }
    }
}

- (void)diqu{
    self.pickerView = [[GFAddressPicker alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
//    [self.pickerView updateAddressAtProvince:@"河南省" city:@"郑州市" town:@"金水区"];
    self.pickerView.delegate = self;
    self.pickerView.font = [UIFont boldSystemFontOfSize:18];
    [_vc.view addSubview:self.pickerView];
    
}

- (void)GFAddressPickerCancleAction
{
    [self.pickerView removeFromSuperview];
}
- (void)GFAddressPickerWithProvince:(UserCitySmolModel *)province city:(UserCitySmolModel *)city area:(UserCitySmolModel *)area{
    [self.pickerView removeFromSuperview];
    NSString * str = [NSString stringWithFormat:@"%@,%@,%@",province.ssid,city.ssid,area.ssid];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_WSXX];
    NSDictionary * dic = @{@"tag":@"2",@"studentid":Me.ssid,@"area":str,@"school":@"",@"clazz":@""};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            self->mo = [MyDeModel mj_objectWithKeyValues:responseObject];
            if ([self->mo.code isEqual:@200]) {
                [self LoadData];
            }else if ([self->mo.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}

- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_MYDEXINXI];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            self->mo = [MyDeModel mj_objectWithKeyValues:responseObject];
            if ([self->mo.code isEqual:@200]) {
                self->newModel = [MyZiLiaoModel mj_objectWithKeyValues:responseObject[@"user"]];
                self.model = self->newModel;
            }else if ([self->mo.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}


@end
