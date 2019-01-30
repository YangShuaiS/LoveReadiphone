//
//  UserPhoneDlViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserPhoneDlViewController.h"
#import "UserYZMDLVViewController.h"
@interface UserPhoneDlViewController ()<UITextFieldDelegate>

@end

@implementation UserPhoneDlViewController{
    BaseLabel * yzm;
    UITextField * textfield;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addnav];
    WS(ws);
    UIImageView * caidai = [UIImageView new];
    caidai.contentMode = UIViewContentModeScaleAspectFit;
    caidai.image = UIIMAGE(@"领奖信息-彩带");
    [self.view addSubview:caidai];
    [caidai mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(NavHeight);
        make.centerX.mas_equalTo(ws.view);
        make.width.mas_equalTo(LENGTH(300));
        make.height.mas_equalTo(LENGTH(209));
    }];
    
    UIImageView* jpimageview = [UIImageView new];
    jpimageview.contentMode = UIViewContentModeScaleAspectFit;
    jpimageview.image = UIIMAGE(@"车");
    [self.view addSubview:jpimageview];
    [jpimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(caidai.mas_top).with.offset(LENGTH(20));
        make.centerX.mas_equalTo(ws.view);
        //        make.size.mas_equalTo(jpimageview.image.size);
        make.width.mas_equalTo(LENGTH(133));
        make.height.mas_equalTo(LENGTH(143));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"填写手机，领取新手大奖"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jpimageview.mas_bottom).with.offset(LENGTH(20));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    BaseView * bacview = [BaseView new];
    bacview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bacview];
    [bacview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(35));
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(33));
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
    vc.phone = textfield.text;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark ----------- 返回
- (void)addnav{
    WS(ws);
    UIImageView * back = [UIImageView new];
    back.image = UIIMAGE(@"backhei");
    [self.view addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+14);
        make.left.mas_equalTo(ws.view).with.offset(19);
        make.height.mas_equalTo(24);
        make.width.mas_equalTo(back.image.size.width);
    }];
    BaseButton * backbutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [backbutton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backbutton];
    [backbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar);
        make.left.mas_equalTo(ws.view);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(50);
    }];
}
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
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
