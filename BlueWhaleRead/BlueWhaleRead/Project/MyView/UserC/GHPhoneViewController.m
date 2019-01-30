//
//  GHPhoneViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/2.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "GHPhoneViewController.h"
#import "UserYZMDLVViewController.h"
@interface GHPhoneViewController ()<NavDelegate,UITextFieldDelegate>

@end

@implementation GHPhoneViewController{
    BaseLabel * title;
    UITextField * textfield;
    BaseLabel * yzm;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self AddNavtion];
    WS(ws);
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(91,100,99) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(20));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(30));
    }];
    
    if (Me.phone.length == 11) {
        NSString * phone = Me.phone;
        NSRange rangeone = {0,3};
        NSRange rangetwo = {7,4};
        NSString * str = [NSString stringWithFormat:@"+86%@****%@",[phone substringWithRange:rangeone],[phone substringWithRange:rangetwo]];
        title.text = [NSString stringWithFormat:@"%@%@",@"当前手机号",str];
        AttributedStringModel * model1 = [AttributedStringModel new];
        model1.textString = title.text;
        model1.bianString = str;
        model1.fount = 20;
        model1.color = RGB(105,105,105);
        NSArray * modelarray = @[model1];
        NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
        title.attributedText = AttributedStr;
    }
    
    BaseLabel * titles = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"输入新的手机号"];
    [self.view addSubview:titles];
    [titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(50));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    BaseView * bacview = [BaseView new];
    bacview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bacview];
    [bacview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(35));
        make.top.mas_equalTo(titles.mas_bottom).with.offset(LENGTH(33));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(35));
    }];
    bacview.userInteractionEnabled = YES;
    
    BaseLabel * phoneleft = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(43,62,62) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@"+86"];
    [bacview addSubview:phoneleft];
    [phoneleft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(bacview);
        make.top.mas_equalTo(bacview);
    }];
    
    textfield = [UITextField new];
    textfield.delegate = self;
    textfield.keyboardType = UIKeyboardTypeNumberPad;
    textfield.textAlignment = NSTextAlignmentLeft;
    [bacview addSubview:textfield];
    [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(phoneleft.mas_right).with.offset(LENGTH(5));
        //        make.right.mas_equalTo(bacview);
        make.centerY.mas_equalTo(phoneleft);
        make.height.mas_equalTo(LENGTH(35));
        make.width.mas_equalTo(LENGTH(250));
        make.bottom.mas_equalTo(bacview);
    }];
    [textfield addTarget:self action:@selector(phoneNum_tfChange:) forControlEvents:UIControlEventEditingChanged];
    UIColor * color = RGB(113,132,132);
    textfield.textColor = RGB(43,67,66);
    textfield.font = TextFont(18);
    textfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请填写手机号" attributes:@{NSForegroundColorAttributeName: color,NSFontAttributeName:TextFont(16)}];
    
    UIView * xian = [UIView new];
    xian.backgroundColor = RGB(204,204,204);
    [self.view addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(bacview);
        make.top.mas_equalTo(bacview.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
    yzm = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(167,167,167) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"获取验证码"];
    yzm.backgroundColor = RGB(246,247,250);
    [self.view addSubview:yzm];
    yzm.layer.masksToBounds = YES;
    yzm.layer.cornerRadius = LENGTH(24);
    [yzm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xian.mas_bottom).with.offset(LENGTH(30));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(48));
    }];
    yzm.userInteractionEnabled = NO;
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(push)];
    //将手势添加到需要相应的view中去
    [yzm addGestureRecognizer:tapGesture];
    
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [self.view addGestureRecognizer:tapGesture2];
}

- (void)tapGesture2{
    [textfield resignFirstResponder];
}
- (void)phoneNum_tfChange:(UITextField *)textField
{
    BOOL phone = [BaseObject valiMobile:textField.text];
    if (phone == YES) {
        yzm.userInteractionEnabled = YES;
        yzm.backgroundColor = RGB(82,199,198);
        yzm.textColor = RGB(255, 255, 255);
    }else{
        yzm.userInteractionEnabled = NO;
        yzm.backgroundColor = RGB(246,247,250);
        yzm.textColor = RGB(167, 167, 167);
    }
}
- (void)push{
    UserYZMDLVViewController * vc = [UserYZMDLVViewController new];
    vc.laiyuan = @"phone";
    vc.phone = textfield.text;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"更换手机号" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.titcolor = RGB(0, 0, 0);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.downlayer = YES;
}
- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
