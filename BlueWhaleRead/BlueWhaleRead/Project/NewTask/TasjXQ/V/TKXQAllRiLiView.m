//
//  TKXQAllRiLiView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "TKXQAllRiLiView.h"
#import "TKXQRLView.h"
@implementation TKXQAllRiLiView{
    TKXQRLView * rl;
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
    
    self.backgroundColor = [UIColor clearColor];
    UIView * backview = [UIView new];
    backview.backgroundColor = RGB(255, 255, 255);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(0, LENGTH(20), LENGTH(14), LENGTH(20)));
    }];
    backview.layer.shadowOpacity = 0.24;
    backview.layer.shadowColor = RGB(171, 171, 171).CGColor;
    backview.layer.shadowRadius = LENGTH(8);
    backview.layer.shadowOffset = CGSizeMake(0,4);
    backview.layer.cornerRadius = LENGTH(10);
    
    UIImageView * backviews = [UIImageView new];
    backviews.userInteractionEnabled = YES;
    backviews.contentMode = UIViewContentModeScaleAspectFill;
    backviews.image = UIIMAGE(@"组41拷贝");
    backviews.layer.masksToBounds = YES;
    backviews.layer.cornerRadius = LENGTH(10);
    [backview addSubview:backviews];
    [backviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(backview).with.insets(UIEdgeInsetsMake(0, LENGTH(0), LENGTH(0), LENGTH(0)));
    }];
    
    rl = [TKXQRLView new];
    [backviews addSubview:rl];
    [rl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(backviews).with.insets(UIEdgeInsetsMake(0, LENGTH(0), LENGTH(0), LENGTH(0)));
    }];
    
}
- (void)setModel:(TAKALLModel *)model{
    _model = model;
    rl.colorarray = _colorarray;
    rl.style = _style;
    rl.model = model;
}
@end
