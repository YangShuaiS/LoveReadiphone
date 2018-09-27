//
//  PopUpViewStyleMedalcompleteView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PopUpViewStyleMedalcompleteView.h"

@implementation PopUpViewStyleMedalcompleteView{
    FLAnimatedImageView * centerImage;
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
    clickImage.image = UIIMAGE(@"bg_喜得勋章");
    [self addSubview:clickImage];
    [clickImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(377)*0.75);
        make.height.mas_equalTo(LENGTH(377)*0.75);
    }];
    
    centerImage = [FLAnimatedImageView new];
    [clickImage addSubview:centerImage];
    [centerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(clickImage);
        make.width.mas_equalTo(LENGTH(237)*0.75);
        make.height.mas_equalTo(LENGTH(237)*0.75);
    }];
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(quxiao)];
    [self addGestureRecognizer:tap];
}
- (void)setModel:(GenPopViewModel *)model{
    _model = model;
    [centerImage sd_setImageWithURL:URLIMAGE(model.imageurl) placeholderImage:UIIMAGE(ZHANWEITUXZ)];
}
- (void)quxiao{
    self.block(PopUpViewClickStyleTimeRemo);
}

@end
