//
//  UserLoginTextFileView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef NS_ENUM(NSInteger, UserLoginTextFile) {
    UserLoginTextFilePhone = 0,//
    UserLoginTextFilePhoneAndYZM = 1,//验证码
    UserLoginTextFileYZM = 2,
    UserLoginTextFileMM = 3,
    UserLoginTextFileYHM = 4,//用户名
    UserLoginTextFileClick = 5,//点击事件
    UserLoginTextFileWjMM = 6,//忘记密码
    UserLoginTextFileClickDQ = 7,//点击事件
    UserLoginTextFileNR = 8,//内容，不限长度

};

typedef void(^ClickBlock)(void);
#import <PGDatePickManager.h>
#import "GFAddressPicker.h"

@interface UserLoginTextFileView : BaseView<UITextFieldDelegate,PGDatePickerDelegate,GFAddressPickerDelegate>
- (instancetype)initWithStyle:(UserLoginTextFile)style;
@property (strong, nonatomic) UITextField *textField;
@property(nonatomic,strong)BaseLabel * djshj;//点击事件
@property(nonatomic,strong) NSString * titles;
@property(nonatomic,copy)ClickBlock block;
@property(nonatomic,strong)UIViewController * vc;
@property (nonatomic, strong) GFAddressPicker *pickerView;

@property(nonatomic,strong)NSString * dqid;
- (void)returnKeyboard;
@end
