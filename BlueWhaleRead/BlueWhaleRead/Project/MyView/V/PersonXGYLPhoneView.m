//
//  PersonXGYLPhoneView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonXGYLPhoneView.h"
#import "UserForgetTextFileView.h"

@implementation PersonXGYLPhoneView

{
    UserForgetTextFileView * zhanghao;
    UserForgetTextFileView * mima;
    BaseLabel * yzm;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)addView{
    self.backgroundColor = RGB(255, 255, 255);
    WS(ws);
    zhanghao = [UserForgetTextFileView new];
    zhanghao.title = @"请输入预留手机号";
    zhanghao.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:zhanghao];
    [zhanghao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(66));
    }];
    [zhanghao setBlock:^(NSString *text) {
        [ws phone:text];
        [ws next];
    }];
    
    BaseView * xian = [BaseView new];
    xian.backgroundColor = RGB(164,163,163);
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(self->zhanghao.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
    mima = [UserForgetTextFileView new];
    mima.title = @"请确认新密码";
    mima.secureTextEntry = YES;
    [self addSubview:mima];
    [mima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->zhanghao.mas_bottom);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(66));
    }];
    [mima setBlock:^(NSString *text) {
        [ws phone:text];
        [ws next];
    }];
    
    yzm = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"获取验证码"];
    //    yzm.backgroundColor = RGB(255,154,73);
    yzm.backgroundColor = RGB(254,216,186);
    yzm.layer.masksToBounds = YES;
    yzm.layer.cornerRadius = LENGTH(45)/2;
    [mima addSubview:yzm];
    [yzm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->mima.mas_centerY);
        make.right.mas_equalTo(self->mima.mas_right).with.offset(-LENGTH(17));
        make.width.mas_equalTo(LENGTH(132));
        make.height.mas_equalTo(LENGTH(45));
    }];
    yzm.userInteractionEnabled = NO;
    
    BaseView * xian1 = [BaseView new];
    xian1.backgroundColor = RGB(164,163,163);
    [self addSubview:xian1];
    [xian1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(self->mima.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [yzm addGestureRecognizer:tapGesture2];
}
- (void)returnKeyboard{
    [zhanghao returnKeyboard];
    [mima returnKeyboard];
}
- (void)tapGesture2{
    [self HQYZM];
}
- (void)HQYZM{
    //    [self.delegate ClickModel:nil Style:ClickancFSYZM
    //     ];
    __block NSInteger time = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                self->yzm.text = @"重新获取";
                self->yzm.textColor = RGB(255,255,255);
                self->yzm.backgroundColor = RGB(255,154,73);
                self->yzm.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮的样式
                self->yzm.text = [NSString stringWithFormat:@"%.2ds", seconds];
                self->yzm.textColor = RGB(253,114,2);
                self->yzm.backgroundColor = RGB(254,216,186);
                self->yzm.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}

- (void)phone:(NSString *)str{
    BOOL phone = [BaseObject valiMobile:str];
    if (phone == YES) {
        yzm.backgroundColor = RGB(255,154,73);
        yzm.userInteractionEnabled = YES;
    }else{
        
        yzm.userInteractionEnabled = NO;
        
    }
}
- (void)next{
    BOOL phone = [BaseObject valiMobile:zhanghao.textField.text];
    if (phone == YES && mima.textField.text.length>0) {
        self.blocks(YES);
    }else{
        self.blocks(NO);
    }
}
@end
