//
//  MuBuyMembersView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/25.
//  Copyright © 2019 YS. All rights reserved.
//

#import "MuBuyMembersView.h"
#import "BuyMembersViewController.h"

@implementation MuBuyMembersView{
    BaseLabel * oneLabel;
    BaseLabel * twoLabel;
    BaseLabel * threeLabel;
    
    CAGradientLayer *gradientLayer0;
    UIView * style;
    BaseLabel *clickLabel;
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
    UIImageView *topview = [UIImageView new];
    topview.image = UIIMAGE(@"开通会员-栏");
    topview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(10));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(10));
        make.centerX.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(topview.image.size.width), LENGTH(topview.image.size.height)));
    }];
    
    oneLabel = [[BaseLabel alloc] initWithTxteColor:RGB(212, 183, 134) LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentLeft Text:@"博万卷知识会员"];
    [topview addSubview:oneLabel];
    [oneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topview).with.offset(LENGTH(14));
        make.left.mas_equalTo(topview).with.offset(LENGTH(19));
        make.height.mas_equalTo(LENGTH(13));
    }];
    oneLabel.hidden = YES;
    
    twoLabel = [[BaseLabel alloc] initWithTxteColor:RGB(183,161,122) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"到期时间：2019-09-09"];
    [topview addSubview:twoLabel];
    [twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->oneLabel.mas_bottom).with.offset(LENGTH(6));
        make.left.mas_equalTo(topview).with.offset(LENGTH(19));
        make.height.mas_equalTo(LENGTH(11));
    }];
    twoLabel.hidden = YES;
    
    threeLabel = [[BaseLabel alloc] initWithTxteColor:RGB(183,161,122) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"加入知识会员,获得更多会员权益"];
    [topview addSubview:threeLabel];
    [threeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(topview);
        make.left.mas_equalTo(topview).with.offset(LENGTH(19));
        make.height.mas_equalTo(LENGTH(11));
    }];
    style = [UIView new];
    style.layer.cornerRadius = LENGTH(8);
    [self addSubview:style];
    [style mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(topview);
        make.right.mas_equalTo(topview).with.offset(-LENGTH(15));
        make.height.mas_equalTo(LENGTH(22));
    }];
    
    //Gradient 0 fill for 圆角矩形 3
    gradientLayer0 = [[CAGradientLayer alloc] init];
    gradientLayer0.cornerRadius = LENGTH(11);
    gradientLayer0.colors = @[
                              (id)[UIColor colorWithRed:201.0f/255.0f green:169.0f/255.0f blue:113.0f/255.0f alpha:1.0f].CGColor,
                              (id)[UIColor colorWithRed:226.0f/255.0f green:207.0f/255.0f blue:165.0f/255.0f alpha:1.0f].CGColor];
    gradientLayer0.locations = @[@0, @1];
    [gradientLayer0 setStartPoint:CGPointMake(1, 1)];
    [gradientLayer0 setEndPoint:CGPointMake(1, 0)];
    
    clickLabel = [[BaseLabel alloc] initWithTxteColor:RGB(32,33,34) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"立即续费"];
    [self addSubview:clickLabel];
    [clickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->style).with.insets(UIEdgeInsetsMake(0, LENGTH(7), 0, LENGTH(7)));
    }];
    clickLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [clickLabel addGestureRecognizer:tap1];
    
    topview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [topview addGestureRecognizer:tap];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    gradientLayer0.frame = style.bounds;
    [style.layer addSublayer:gradientLayer0];
    
}

- (void)click{
    BuyMembersViewController * vc = [BuyMembersViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)setModel:(MyUserInfo *)model{
    _model = model;
    if (model.is_member == 0) {
        oneLabel.hidden = YES;
        twoLabel.hidden = YES;
        threeLabel.hidden = NO;
        clickLabel.text = @"立即开通";
    }else{
        oneLabel.hidden = NO;
        twoLabel.hidden = NO;
        threeLabel.hidden = YES;
        clickLabel.text = @"立即续费";
        NSString * time = [BaseObject TiemArray:model.member_end_time String:@" "][0];
        twoLabel.text = [NSString stringWithFormat:@"到期时间：%@",time];
    }
}
@end
