//
//  BuyPackageCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/24.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyPackageCollectionViewCell.h"
#import "BuyPackageBackView.h"
@implementation BuyPackageCollectionViewCell{
    BuyPackageBackView * backView;
    BaseLabel * title;
    BaseLabel * YuanJia;
    BaseLabel * NowJia;
    BaseLabel * ZheKou;
    BaseLabel * DownLabel;
    BaseLabel * qian;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = LENGTH(5);
    self.layer.borderWidth = 1;
    self.layer.borderColor = RGB(209,181,130).CGColor;
    
    backView = [BuyPackageBackView new];
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    backView.hidden = YES;
    
    title = [[BaseLabel alloc] initWithTxteColor:RGB(31,31,31) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"会员"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws).with.offset(LENGTH(16));
    }];

    YuanJia = [[BaseLabel alloc] initWithTxteColor:RGB(182,182,182) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"原价￥"];
    //中划线
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:YuanJia.text attributes:attribtDic];
    // 赋值
    YuanJia.attributedText = attribtStr;
    [self addSubview:YuanJia];
    [YuanJia mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(10));
        make.centerX.mas_equalTo(ws);
    }];
    
    NowJia = [[BaseLabel alloc] initWithTxteColor:RGB(0,0,0) LabelFont:TextFontCu(45) TextAlignment:NSTextAlignmentCenter Text:@"0"];
    [self addSubview:NowJia];
    [NowJia mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(48));
        make.centerX.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(34));
    }];
    
    qian = [[BaseLabel alloc] initWithTxteColor:RGB(0,0,0) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"￥"];
    [self addSubview:qian];
    [qian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->NowJia.mas_left).with.offset(-LENGTH(4));
        make.bottom.mas_equalTo(self->NowJia);
    }];

    ZheKou = [[BaseLabel alloc] initWithTxteColor:RGB(132,106,62) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"0折"];
    ZheKou.layer.cornerRadius = LENGTH(7);
    ZheKou.layer.masksToBounds = YES;
    ZheKou.backgroundColor = RGB(237,217,175);
    [self addSubview:ZheKou];
    [ZheKou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->NowJia.mas_bottom).with.offset(LENGTH(8));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(45));
    }];
    
    UIView * downView = [UIView new];
    [self addSubview:downView];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.mas_equalTo(ws);
        make.top.mas_equalTo(self->ZheKou.mas_bottom);
    }];
    
    DownLabel = [[BaseLabel alloc] initWithTxteColor:RGB(31,31,31) LabelFont:[UIFont fontWithName:@"PingFang-SC-Semibold" size:FontSize(LENGTH(12))] TextAlignment:NSTextAlignmentCenter Text:@"当前可享10.0折优惠"];
    DownLabel.numberOfLines = 0;
    [downView addSubview:DownLabel];
    [DownLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(downView);
        make.left.mas_equalTo(downView).with.offset(LENGTH(10));
        make.right.mas_equalTo(downView).with.offset(-LENGTH(10));
    }];
}
- (void)setModel:(BuyPackage *)model{
    _model = model;
    title.text = model.name;
    if (model.click == 1) {
        backView.hidden = NO;
        [self ClickYes];
    }else{
        backView.hidden = YES;
        [self ClickNo];
    }
    if (model.discount == 10.0) {
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:@"" attributes:attribtDic];
        YuanJia.attributedText = attribtStr;
        NowJia.text = [NSString stringWithFormat:@"%ld",model.yj];
        ZheKou.text = @"原价";
        DownLabel.text = @"邀请两人，可享受5折优惠";
    }else{
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"原价￥%ld",model.yj] attributes:attribtDic];
        YuanJia.attributedText = attribtStr;
        NowJia.text = [NSString stringWithFormat:@"%ld",model.discount_price];
        if (model.discount_price == 0) {
            ZheKou.text = @"免费";
            DownLabel.text = @"当前可免费领取";
        }else{
            ZheKou.text = [NSString stringWithFormat:@"%.1f折",model.discount];
            DownLabel.text = [NSString stringWithFormat:@"当前可享%.1f折优惠",model.discount];
        }
    }
    if (model.price_times == 12) {
        DownLabel.text =@"超值年度会员\n限时优惠中";
    }
}

- (void)ClickYes{
    title.textColor = RGB(132,106,62);
    YuanJia.textColor = RGB(176,152,111);
    NowJia.textColor = RGB(132,106,62);
    qian.textColor = RGB(132,106,62);
    DownLabel.textColor = RGB(132,106,62);
//    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"超值年度会员，限时优惠中"];
//    NSRange range1 = [[str string] rangeOfString:@"选择自动续费"];
//    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFang-SC-Regular" size:LENGTH(12)] range:range1];
//    NSRange range2 = [[str string] rangeOfString:@"可享7.5折优惠"];
//    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFang-SC-Semibold" size:LENGTH(12)] range:range2];
//    DownLabel.text = @"超值年度会员\n限时优惠中";
}
- (void)ClickNo{
    title.textColor = RGB(31, 31, 31);
    YuanJia.textColor = RGB(182,182,182);
    NowJia.textColor = RGB(0,0,0);
    qian.textColor = RGB(0, 0, 0);
    DownLabel.textColor = RGB(31, 31, 31);
//    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"当前可享10.0折优惠"];
//    NSRange range1 = [[str string] rangeOfString:@"当前可享10.0折优惠"];
//    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFang-SC-Semibold" size:LENGTH(12)] range:range1];
//    DownLabel.text = @"当前可享10.0折优惠";
}
@end
