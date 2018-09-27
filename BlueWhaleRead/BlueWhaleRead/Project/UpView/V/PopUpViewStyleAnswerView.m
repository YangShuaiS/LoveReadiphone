//
//  PopUpViewStyleAnswerView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PopUpViewStyleAnswerView.h"

@implementation PopUpViewStyleAnswerView{
    BaseLabel * title;
    BaseLabel * subTitle;
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
    FLAnimatedImageView * clickImage = [FLAnimatedImageView new];
    clickImage.image = UIIMAGE(@"icon_弹窗_关闭");
    [self addSubview:clickImage];
    [clickImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(27));
        make.top.mas_equalTo(ws).with.offset(NavHeight+LENGTH(1));
        make.width.mas_equalTo(LENGTH(26));
        make.height.mas_equalTo(LENGTH(26));
    }];
    
    BaseButton * clickButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [clickButton addTarget:self action:@selector(quxiao) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:clickButton];
    [clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(27-15));
        make.top.mas_equalTo(ws).with.offset(NavHeight+LENGTH(0));
        make.width.mas_equalTo(LENGTH(60));
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    BaseView * backView = [BaseView new];
    backView.backgroundColor =RGB(189,225,223);
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = LENGTH(10);
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(34));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(34));
        make.top.mas_equalTo(ws).with.offset(LENGTH(100));
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(35,100,96) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@""];
    title.backgroundColor = RGBA(255, 255, 255, 0.7);
    [backView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backView);
        make.top.mas_equalTo(backView);
        make.right.mas_equalTo(backView);
        make.height.mas_equalTo(LENGTH(45));
    }];
    
    subTitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(35,100,96) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@""];
    subTitle.numberOfLines = 0;
    [backView addSubview:subTitle];
    [subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backView);
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(18));
        make.right.mas_equalTo(backView);
    }];
    
    FLAnimatedImageView * KS = [FLAnimatedImageView new];
    KS.image = [UIImage imageNamed:@"bt_弹窗"];
    [backView addSubview:KS];
    [KS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(backView);
        make.top.mas_equalTo(self->subTitle.mas_bottom).with.offset(LENGTH(30));
        make.bottom.mas_equalTo(backView.mas_bottom).with.offset(-LENGTH(30));
        make.width.mas_equalTo(LENGTH(150));
        make.height.mas_equalTo(LENGTH(38));
    }];
    
    BaseLabel * KSLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(57,54,57) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"开始"];
    [KS addSubview:KSLabel];
    [KSLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(KS);
    }];
    KS.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [KS addGestureRecognizer:tap];
}
- (void)setModel:(GenPopViewModel *)model{
    _model = model;
    title.text = model.title;
    subTitle.text = model.subtitle;

}
- (void)tap{
    self.block(PopUpViewClickStylePush);
}
- (void)quxiao{
    self.block(PopUpViewClickStyleRemo);
}
@end
