//
//  MyAccountCashcouponView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/26.
//  Copyright © 2019 YS. All rights reserved.
//

#import "MyAccountCashcouponView.h"

@implementation MyAccountCashcouponView{
    UIView * backView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}

- (void)addview{
    WS(ws);
    self.backgroundColor = RGBA(0, 0, 0, 0.4);

    
    backView = [UIView new];
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.cornerRadius = LENGTH(5);
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-WIDTH/2-LENGTH(20));
        make.width.mas_equalTo(LENGTH(341));
    }];
    backView.userInteractionEnabled = YES;
    
    BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(38, 38, 38) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"获得了兑换码，走向了人生巅峰"];
    [backView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->backView).with.offset(LENGTH(24));
        make.centerX.mas_equalTo(self->backView);
    }];
    UIView * v = [UIView new];
    v.backgroundColor = RGB(245,245,245);
    v.layer.cornerRadius = LENGTH(4);
    [backView addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(20));
        make.left.mas_equalTo(self->backView).with.offset(LENGTH(20));
        make.right.mas_equalTo(self->backView).with.offset(-LENGTH(20));
        make.height.mas_equalTo(LENGTH(45));
    }];
    v.userInteractionEnabled = YES;

    self.textField = [UITextField new];
    UIColor * color = RGB(171,171,171);
    _textField.textColor = RGB(38,38,38);
    _textField.font = TextFont(12);
    _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入兑换码" attributes:@{NSForegroundColorAttributeName: color,NSFontAttributeName:TextFont(12)}];
    _textField.delegate = self;
    _textField.borderStyle = UITextBorderStyleNone;
//    [_textField addTarget:self action:@selector(phoneNum_tfChange:) forControlEvents:UIControlEventEditingChanged];
    [v addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(v);
        make.left.mas_equalTo(v).with.offset(LENGTH(10));
        make.right.mas_equalTo(v).with.offset(-LENGTH(10));
        make.bottom.mas_equalTo(v);
    }];
    
    BaseLabel * dh = [[BaseLabel alloc] initWithTxteColor:RGB(255,255,255) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"兑  换"];
    dh.backgroundColor = RGB(82,199,198);
    dh.layer.masksToBounds = YES;
    dh.layer.cornerRadius = LENGTH(20);
    [backView addSubview:dh];
    [dh mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.textField.mas_bottom).with.offset(LENGTH(28));
        make.left.mas_equalTo(self->backView).with.offset(LENGTH(20));
        make.right.mas_equalTo(self->backView).with.offset(-LENGTH(20));
        make.height.mas_equalTo(LENGTH(40));
        make.bottom.mas_equalTo(self->backView).with.offset(-LENGTH(26));
    }];
    dh.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(LoadData)];
    [dh addGestureRecognizer:tap1];
    
    UIImageView * imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = UIIMAGE(@"icon_弹窗_关闭");
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->backView.mas_top).with.offset(-LENGTH(34));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(40));
        make.size.mas_equalTo(CGSizeMake(LENGTH(18), LENGTH(18)));
    }];
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [imageView addGestureRecognizer:tap];
    // 添加通知监听见键盘弹出/退出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAction:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAction:) name:UIKeyboardWillHideNotification object:nil];
    
    
}
- (void)keyboardAction:(NSNotification*)sender{
    // 通过通知对象获取键盘frame: [value CGRectValue]
    NSDictionary *useInfo = [sender userInfo];
    NSValue *value = [useInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyheigh = [value CGRectValue].size.height;
    // <注意>具有约束的控件通过改变约束值进行frame的改变处理
    if([sender.name isEqualToString:UIKeyboardWillShowNotification]){
        
    }else{
    }
    WS(ws);
    if (keyheigh == 0) {
        [backView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(ws).with.offset(-(WIDTH)/2-LENGTH(20));
        }];
    }else{
        [backView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(ws).with.offset(-keyheigh);
        }];
    }

}
- (void)click{
    [self removeFromSuperview];
}

- (void)tijiao{
    YSGmBouncedView * view = [[YSGmBouncedView alloc] initWithMessage:@"请输入正确的验证码" ImageView:@"icon_弹窗_关闭"];
    [view AddWindowRemo:YES];
}

- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_exchangeProduct];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"code":_textField.text};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            BuyorderModel * model = [BuyorderModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
//                [self UpData:model];
                NSLog(@"123");
            }else if ([model.code isEqual:@300]){
                [self tijiao];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
            [self removeFromSuperview];
        }else{
        }
    }];
}
@end
