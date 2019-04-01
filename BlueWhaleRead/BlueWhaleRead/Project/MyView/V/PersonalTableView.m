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

#import <PGDatePickManager.h>

@interface PersonalTableView ()<UITableViewDelegate,UITableViewDataSource,PGDatePickerDelegate>
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
    
    UserLoginModel * livemodel;
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
        NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",ALLCLASS]];
        NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
        livemodel = [UserLoginModel mj_objectWithKeyValues:dataDictionary];
    }
    return self;
}
- (void)setModel:(MyZiLiaoModel *)model{
    _model = model;
    NSString * xb;
    if (model.sex == 1) {
        xb = @"男";
    }else if (model.sex == 2){
        xb = @"女";
    }else{
        xb = @"待完善";
    }
//    NSString * phone = model.phone;
//    if (phone.length == 11) {
//        NSRange rangeone = {0,3};
//        NSRange rangetwo = {7,4};
//        NSString * str = [NSString stringWithFormat:@"%@****%@",[phone substringWithRange:rangeone],[phone substringWithRange:rangetwo]];
//        phone = str;
//    }else{
//        phone = @"";
//    }
    titleArray = @[@"姓名",@"生日",@"年级",@"等级",@"账号绑定",@"所在地区",@"学校",@"班级",@"性别"];
    NSString * area = model.area;
    NSString * true_school = model.true_school;
    NSString * true_class = model.true_class;
    NSString * schoolclass = model.true_class;

    area=[area isEqualToString:@""]?@"待完善":area;
    true_school=[true_school isEqualToString:@""]?@"待完善":true_school;
    true_class=[true_class isEqualToString:@""]?@"待完善":true_class;
    schoolclass=[true_class isEqualToString:@""]?@"待完善":schoolclass;
    
    NSString * nianji = @"";
    for (levelListModel *levemodel in livemodel.levelList) {
        if ([model.level isEqualToString:levemodel.ssid]) {
            nianji = levemodel.name;
        }
    }
    subArray = @[model.name,Me.birthday,nianji,[NSString stringWithFormat:@"Lv%@",model.level],@"",area,true_school,true_class,xb];
    [self reloadData];
}
#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = [NSString stringWithFormat:@"cell%ld",(long)indexPath.row];
    PersonalTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
//        if(indexPath.row == 0){
//            cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewTopStyle];
//
//        }else
        if (indexPath.row == 3){
            cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewDownStyle];
        }else{
            cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewDownClickStyle];
        }
    }
    cell.title = titleArray[indexPath.row];
    cell.subtitle = subArray[indexPath.row];
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
    if (indexPath.row == 0) {
        ModifyNameViewController * vc = [ModifyNameViewController new];
        [self.nav pushViewController:vc animated:YES];
        [vc setBlock:^{
            [self LoadData];
        }];
    }else if (indexPath.row == 1){
        [self shengri];
    }else if (indexPath.row == 2){
        [self nianling];
    }else if (indexPath.row == 4){
        AccountSettingsViewController * vc = [AccountSettingsViewController new];
        [self.nav pushViewController:vc animated:YES];
    }else if (indexPath.row == 5){
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
    }else if (indexPath.row == 8){
        [self xingbie];
    }
}

- (void)diqu{
    self.pickerView = [[GFAddressPicker alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
//    [self.pickerView updateAddressAtProvince:@"河南省" city:@"郑州市" town:@"金水区"];
    self.pickerView.delegate = self;
    self.pickerView.font = [UIFont boldSystemFontOfSize:18];
    [_vc.view addSubview:self.pickerView];
}
- (void)xingbie{
//    [MOFSPickerManager shareManger].addressPicker.attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:15], NSForegroundColorAttributeName : [UIColor redColor]};
    [[MOFSPickerManager shareManger] showPickerViewWithDataArray:@[@"男",@"女"] tag:1 title:@"选择性别" cancelTitle:@"取消" commitTitle:@"确定" commitBlock:^(NSString *string) {
        NSString * sex;
        if ([string isEqualToString:@"男"]) {
            sex = @"1";
        }else{
            sex = @"2";
        }
        [self xiugaixingbie:sex];
    } cancelBlock:^{
        
    }];
}

- (void)xiugaixingbie:(NSString *)sex{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_XIUGAISEX];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"sex":sex};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                NSString *filePatch = [BaseObject AddPathName:UserMe];
                NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
                NSMutableDictionary *dics = dataDictionary[UserMe];
                NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
                dics[@"sex"] = sex;
                [usersDic setObject:dics forKey:UserMe];
                [usersDic writeToFile:filePatch atomically:YES];
                Me.sex = sex;
//                Me = [[MeModel SharedModel] ADDvalue];
                [self LoadData];
            }
        }else{
            
        }
    }];
}

- (void)nianling{
    NSMutableArray * titlearray = [NSMutableArray array];
    for (levelListModel *levemodel in livemodel.levelList) {
        [titlearray addObject:levemodel.name];
    }
    [[MOFSPickerManager shareManger] showPickerViewWithDataArray:titlearray tag:1 title:@"选择年级" cancelTitle:@"取消" commitTitle:@"确定" commitBlock:^(NSString *string) {
        for (levelListModel *levemodel in self->livemodel.levelList) {
            if ([levemodel.name isEqualToString:string]) {
                [self genggaunianji:levemodel.ssid];
            }
        }
    } cancelBlock:^{
        
    }];
}

- (void)genggaunianji:(NSString *)string{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_XIUGAILEVEL];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"level":string};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                NSString *filePatch = [BaseObject AddPathName:UserMe];
                NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
                NSMutableDictionary *dics = dataDictionary[UserMe];
                NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
                dics[@"level"] = string;
                [usersDic setObject:dics forKey:UserMe];
                [usersDic writeToFile:filePatch atomically:YES];
                Me.level = string;
//                Me = [[MeModel SharedModel] ADDvalue];
                [self LoadData];
            }
        }else{
            
        }
    }];
    
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
                [self reloadData];
            }else if ([self->mo.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}



- (void)shengri{
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.datePickerMode = PGDatePickerModeDate;
    datePicker.delegate = self;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:Me.birthday];//上次设置的日期
    if (!Me.birthday) {
        date = [NSDate date];
    }
    [datePicker setDate:date];
    
    [_vc presentViewController:datePickManager animated:false completion:nil];
    
    datePickManager.titleLabel.text = @"选择生日";
    //设置半透明的背景颜色
    datePickManager.isShadeBackgroud = true;
    //    //设置头部的背景颜色
    //    datePickManager.headerViewBackgroundColor = [UIColor blueColor];
    //    //设置线条的颜色
    //    datePicker.lineBackgroundColor = [UIColor cyanColor];
    //    //设置选中行的字体颜色
    //    datePicker.textColorOfSelectedRow = [UIColor redColor];
    //    //设置未选中行的字体颜色
    //    datePicker.textColorOfOtherRow = [UIColor blackColor];
    //设置取消按钮的字体颜色
    //    datePickManager.cancelButtonTextColor = [UIColor blackColor];
    //设置取消按钮的字
    datePickManager.cancelButtonText = @"取消";
    //设置取消按钮的字体大小
    datePickManager.cancelButtonFont = [UIFont boldSystemFontOfSize:17];
    
    //设置确定按钮的字体颜色
    //    datePickManager.confirmButtonTextColor = [UIColor redColor];
    //设置确定按钮的字
    datePickManager.confirmButtonText = @"确定";
    //设置确定按钮的字体大小
    datePickManager.confirmButtonFont = [UIFont boldSystemFontOfSize:17];
}
- (void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents {
    NSString * day = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)dateComponents.year,(long)dateComponents.month,(long)dateComponents.day];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_XGBirsty];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"birthday":day};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                NSString *filePatch = [BaseObject AddPathName:UserMe];
                NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
                NSMutableDictionary *dics = dataDictionary[UserMe];
                NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
                dics[@"birthday"] = day;
                [usersDic setObject:dics forKey:UserMe];
                [usersDic writeToFile:filePatch atomically:YES];
                Me.birthday = day;
//                Me = [[MeModel SharedModel] ADDvalue];
                [self LoadData];
            }
        }else{
            
        }
    }];
}
@end
