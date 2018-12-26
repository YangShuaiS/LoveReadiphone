//
//  GFAddressPicker.m
//  地址选择器
//
//  Created by 1暖通商城 on 2017/5/10.
//  Copyright © 2017年 1暖通商城. All rights reserved.
//

#import "GFAddressPicker.h"


@interface GFAddressPicker ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) NSDictionary *pickerDic;
@property (strong, nonatomic) NSArray *selectedArray;
@property (strong, nonatomic) NSArray *provinceArray;
@property (strong, nonatomic) NSArray *cityArray;
@property (strong, nonatomic) NSArray *townArray;
@property (strong, nonatomic) UIPickerView *pickView;
@end
@implementation GFAddressPicker{
    UserCityModel * citymodel;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        [self getAddressInformation];
    }
    return self;
}
- (void)updata{
//    NSMutableDictionary * shengdic = [NSMutableDictionary dictionary];

//    for (UserCitySmolModel  * sheng in citymodel.areaList) {
//        NSMutableDictionary * shidic = [NSMutableDictionary dictionary];
//        NSMutableArray * quarray = [NSMutableArray array];
//        NSString * shengstr = sheng.name;
//        for (UserCitySmolModel * shi in sheng.cityList) {
//            NSMutableArray * shiarray = [NSMutableArray array];
//            NSMutableDictionary * qudic = [NSMutableDictionary dictionary];
//            NSString * shistr = shi.name;
//            for (UserCitySmolModel * qu in shi.areaList) {
//                NSString * qustr = qu.name;
//                [shiarray addObject:qustr];
//            }
//            [qudic setObject:shiarray forKey:shistr];
//            [shidic setDictionary:qudic];
//        }
//        [shengdic setDictionary:shidic];
//
//    }
    NSMutableDictionary * alldic = [NSMutableDictionary dictionary];
    for (UserCitySmolModel  * sheng in citymodel.areaList) {
        NSString * shengstr = sheng.name;
        NSMutableDictionary * shengdic = [NSMutableDictionary dictionary];
        NSMutableArray * shengarray = [NSMutableArray array];

        for (UserCitySmolModel * shi in sheng.cityList) {
            NSString * shistr = shi.name;
            NSMutableArray * shiarray = [NSMutableArray array];

            for (UserCitySmolModel * qu in shi.areaList) {
                NSString * qustr = qu.name;
                [shiarray addObject:qustr];
            }
            [shengdic setObject:shiarray forKey:shistr];
            [shengarray addObject:shengdic];
        }
        [alldic setObject:shengarray forKey:shengstr];
    }
    self.pickerDic = alldic;
    self.provinceArray = [[self.pickerDic allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    self.selectedArray = [self.pickerDic objectForKey:[self.provinceArray objectAtIndex:0]];
    if (self.selectedArray.count > 0) {
        self.cityArray = [[self.selectedArray objectAtIndex:0] allKeys];
    }
    if (self.cityArray.count > 0) {
        self.townArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:0]];
    }
    [self setBaseView];
  
}
- (void)getAddressInformation {
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_DIQU];
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:nil andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            self->citymodel = [UserCityModel mj_objectWithKeyValues:responseObject];
            if ([self->citymodel.code isEqual:@200]) {
                [self updata];
            }else if ([self->citymodel.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
        }
    }];
}

- (void)setBaseView {
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    UIColor *color = [UIColor colorWithRed:242/255.0 green:243/255.0 blue:249/255.0 alpha:1];
    
    UIColor *btnColor = RGB(92, 199, 198);
    UIView *selectView = [[UIView alloc] initWithFrame:CGRectMake(0, height - 210, width, 30)];
    selectView.backgroundColor = color;
    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancleBtn setTitle:@"取消" forState:0];
    [cancleBtn setTitleColor:btnColor forState:0];
    cancleBtn.frame = CGRectMake(0, 0, 60, 40);
    [cancleBtn addTarget:self action:@selector(dateCancleAction) forControlEvents:UIControlEventTouchUpInside];
    [selectView addSubview:cancleBtn];
    
    UIButton *ensureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [ensureBtn setTitle:@"确定" forState:0];
    [ensureBtn setTitleColor:btnColor forState:0];
    ensureBtn.frame = CGRectMake(width - 60, 0, 60, 40);
    [ensureBtn addTarget:self action:@selector(dateEnsureAction) forControlEvents:UIControlEventTouchUpInside];
    [selectView addSubview:ensureBtn];
    [self addSubview:selectView];
    
    self.pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, height - 180 , width,  180)];
    self.pickView.delegate   = self;
    self.pickView.dataSource = self;
    self.pickView.backgroundColor = color;
    [self addSubview:self.pickView];
    [self.pickView reloadAllComponents];
    [self updateAddress];
    
}

- (void)updateAddressAtProvince:(NSString *)province city:(NSString *)city town:(NSString *)town {
    self.province = province;
    self.city = city;
    self.area = town;
    if (self.province) {
        for (NSInteger i = 0; i < self.provinceArray.count; i++) {
            NSString *city = self.provinceArray[i];
            NSInteger select = 0;
            if ([city isEqualToString:self.province]) {
                select = i;
                [self.pickView selectRow:i inComponent:0 animated:YES];
                break;
            }
        }
        self.cityArray = [self.pickerDic[self.province][0] allKeys];
        for (NSInteger i = 0; i < self.cityArray.count; i++) {
            NSString *city = self.cityArray[i];
            if ([city isEqualToString:self.city]) {
                [self.pickView selectRow:i inComponent:1 animated:YES];
                break;
            }
        }
        self.townArray = self.pickerDic[self.province][0][self.city];
        for (NSInteger i = 0; i < self.townArray.count; i++) {
            NSString *town = self.townArray[i];
            if ([town isEqualToString:self.area]) {
                [self.pickView selectRow:i inComponent:2 animated:YES];
                break;
            }
        }
    }
    [self.pickView reloadAllComponents];
    [self updateAddress];
}

- (void)dateCancleAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(GFAddressPickerCancleAction)]) {
        [self.delegate GFAddressPickerCancleAction];
    }
}

- (void)dateEnsureAction {
    UserCitySmolModel * shengid;
    UserCitySmolModel * shiid;
    UserCitySmolModel * quid;
    for (UserCitySmolModel  * sheng in citymodel.areaList) {
        if ([sheng.name isEqualToString:self.province]) {
            shengid = sheng;;
            for (UserCitySmolModel * shi in sheng.cityList) {
                if ([shi.name isEqualToString:self.city]) {
                    shiid = shi;
                    for (UserCitySmolModel * qu in shi.areaList) {
                        if ([qu.name isEqualToString:self.area]) {
                            quid = qu;
                        }
                    }
                }
             
            }
        }
       
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(GFAddressPickerWithProvince:city:area:)]) {
        [self.delegate GFAddressPickerWithProvince:shengid city:shiid area:quid];
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:self.font?:[UIFont boldSystemFontOfSize:14]];
    }
    pickerLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.provinceArray.count;
    } else if (component == 1) {
        return self.cityArray.count;
    } else {
        return self.townArray.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [self.provinceArray objectAtIndex:row];
    } else if (component == 1) {
        return [self.cityArray objectAtIndex:row];
    } else {
        return [self.townArray objectAtIndex:row];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return self.frame.size.width / 3;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return LENGTH(50);
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.selectedArray = [self.pickerDic objectForKey:[self.provinceArray objectAtIndex:row]];
        if (self.selectedArray.count > 0) {
            self.cityArray = [[self.selectedArray objectAtIndex:0] allKeys];
        } else {
            self.cityArray = @[];
        }
        if (self.cityArray.count > 0) {
            self.townArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:0]];
        } else {
            self.townArray = @[];
        }
        [pickerView reloadComponent:1];
        [pickerView selectedRowInComponent:1];
        [pickerView reloadComponent:2];
        [pickerView selectedRowInComponent:2];
    }
    if (component == 1) {
        self.selectedArray = [self.pickerDic objectForKey:[self.provinceArray objectAtIndex:[self.pickView selectedRowInComponent:0]]];
        NSDictionary *dic = self.selectedArray.firstObject;
        NSString *stirng = self.cityArray[row];
        for (NSString *string in dic.allKeys) {
            if ([stirng isEqualToString:string]) {
                self.townArray = dic[string];
            }
        }
        [pickerView reloadComponent:2];
        [pickerView selectedRowInComponent:2];
    }
    if (component == 2) {
        [pickerView reloadComponent:2];
        [pickerView selectedRowInComponent:2];
    }
    [self updateAddress];
}

- (void)updateAddress {
    self.province = [self.provinceArray objectAtIndex:[self.pickView selectedRowInComponent:0]];
    self.city  = [self.cityArray objectAtIndex:[self.pickView selectedRowInComponent:1]];
    self.area  = [self.townArray objectAtIndex:[self.pickView selectedRowInComponent:2]];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
