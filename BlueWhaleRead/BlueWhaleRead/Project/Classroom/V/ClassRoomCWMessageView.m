//
//  ClassRoomCWMessageView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/11.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ClassRoomCWMessageView.h"

@implementation ClassRoomCWMessageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}

- (void)addview{
    self.backgroundColor = RGBA(0, 0, 0, 0.4);
    WS(ws);
    UIView * backview = [UIView new];
    backview.backgroundColor = RGB(255, 255, 255);
    backview.layer.cornerRadius = LENGTH(10);
    backview.layer.masksToBounds = YES;
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
    }];
    
    UIImageView * imageview = [UIImageView new];
    imageview.image = UIIMAGE(@"弹框背景");
    [backview addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(backview);
        make.size.mas_equalTo(CGSizeMake(LENGTH(270), LENGTH(188)));
    }];
    
    BaseLabel * label = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"密码错误，如您忘记密码，请联系您的班主任。"];
    label.numberOfLines = 0;
    [backview addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backview).with.offset(LENGTH(60));
        make.left.mas_equalTo(backview).with.offset(LENGTH(24));
        make.right.mas_equalTo(backview).with.offset(-LENGTH(24));
    }];
    
    BaseLabel * zdl = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"知道了"];
    zdl.backgroundColor = RGB(82,199,198);
    zdl.layer.masksToBounds = YES;
    zdl.layer.cornerRadius = LENGTH(18);
    [backview addSubview:zdl];
    [zdl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).with.offset(LENGTH(30));
        make.left.mas_equalTo(backview).with.offset(LENGTH(23));
        make.right.mas_equalTo(backview).with.offset(-LENGTH(23));
        make.height.mas_equalTo(LENGTH(36));
    }];
    zdl.userInteractionEnabled = YES;
    UITapGestureRecognizer *zdltap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zdl)];
    //将手势添加到需要相应的view中去
    [zdl addGestureRecognizer:zdltap];
}

- (void)zdl{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
