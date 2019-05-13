//
//  BuyInvitationFriendView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/25.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyInvitationFriendView.h"
#import "BuyShareWindowView.h"
#import "UserLoginViewController.h"
#import "BaseNavigationViewController.h"
@implementation BuyInvitationFriendView{
    BaseLabel * label;
    CAGradientLayer *gradientLayer0;
    UIView * style;
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
    WS(ws);
    self.backgroundColor = [UIColor whiteColor];
    BaseLabel * hytc = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"邀请好友可获得季度会员专享折扣"];
    [self addSubview:hytc];
    [hytc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws).with.offset(LENGTH(30));
    }];
    
    UIImageView * lefthg = [UIImageView new];
    lefthg.contentMode = UIViewContentModeScaleAspectFit;
    lefthg.image = UIIMAGE(@"皇冠");
    [self addSubview:lefthg];
    [lefthg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(hytc);
        make.right.mas_equalTo(hytc.mas_left).with.offset(-LENGTH(6));
        make.size.mas_equalTo(CGSizeMake(LENGTH(21), LENGTH(13)));
    }];
    
    UIImageView * righthg = [UIImageView new];
    righthg.contentMode = UIViewContentModeScaleAspectFit;
    righthg.image = UIIMAGE(@"皇冠");
    [self addSubview:righthg];
    [righthg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(hytc);
        make.left.mas_equalTo(hytc.mas_right).with.offset(LENGTH(6));
        make.size.mas_equalTo(CGSizeMake(LENGTH(21), LENGTH(13)));
    }];
    
    label = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"邀请规则：\n1: 成功邀请2位好友注册可享购买季度会员5折优惠。\n2: 成功邀请5位好友注册即可免费获得季度会员。\n3: 被邀请好友可获得5折购买季度会员权限。"];
    label.numberOfLines = 0;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(hytc).with.offset(LENGTH(30));
        make.left.mas_equalTo(ws).with.offset(LENGTH(27));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(27));
    }];
    
    style = [UIView new];
    style.layer.masksToBounds = YES;
    style.layer.cornerRadius = LENGTH(19);
    style.layer.borderColor = [[UIColor colorWithRed:201.0f/255.0f green:170.0f/255.0f blue:113.0f/255.0f alpha:1.0f] CGColor];
    style.layer.borderWidth = 1;
    style.layer.backgroundColor = [[UIColor colorWithRed:225.0f/255.0f green:159.0f/255.0f blue:159.0f/255.0f alpha:1.0f] CGColor];
    style.alpha = 1;
    [self addSubview:style];
    [style mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->label.mas_bottom).with.offset(LENGTH(30));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(25));
        make.left.mas_equalTo(ws).with.offset(LENGTH(85));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(85));
        make.height.mas_equalTo(LENGTH(38));
    }];
    
    //Gradient 0 fill for 圆角矩形 3
    gradientLayer0 = [[CAGradientLayer alloc] init];
    gradientLayer0.cornerRadius = LENGTH(19);
    gradientLayer0.colors = @[
                              (id)[UIColor colorWithRed:201.0f/255.0f green:169.0f/255.0f blue:114.0f/255.0f alpha:1.0f].CGColor,
                              (id)[UIColor colorWithRed:226.0f/255.0f green:207.0f/255.0f blue:165.0f/255.0f alpha:1.0f].CGColor];
    gradientLayer0.locations = @[@0, @1];
    [gradientLayer0 setStartPoint:CGPointMake(1, 1)];
    [gradientLayer0 setEndPoint:CGPointMake(1, 0)];
    
    
    BaseLabel * clickLabel = [[BaseLabel alloc] initWithTxteColor:RGB(132,106,62) LabelFont:TextFontCu(20) TextAlignment:NSTextAlignmentCenter Text:@"立即邀请"];
    [self addSubview:clickLabel];
    [clickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self->style);
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->label.mas_bottom).with.offset(LENGTH(30));
        make.left.mas_equalTo(ws).with.offset(LENGTH(85));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(85));
        make.height.mas_equalTo(LENGTH(38));
    }];

    style.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [style addGestureRecognizer:tap];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    gradientLayer0.frame = style.bounds;
    [style.layer addSublayer:gradientLayer0];

}

- (void)click{
    if ([Me.is_rebot isEqualToString:@"2"]) {
        BuyShareWindowView * view = [BuyShareWindowView new];
        view.zstid = @"";
        [[self viewController].navigationController.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo([self viewController].navigationController.view);
        }];
    }else{
        BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:[UserLoginViewController new]];
        [[self viewController] presentViewController:homenav animated:YES completion:^{
            
        }];
    }

}
@end
