//
//  ZhiShiShurightNriRongView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/25.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ZhiShiShurightNriRongView.h"
#import "ZSSRightNRView.h"
@implementation ZhiShiShurightNriRongView{
    UIView * jianbian;
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
    jianbian = [UIView new];
    [self addSubview:jianbian];
    [jianbian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.and.left.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(31));
    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    WS(ws);
    for (ZhiShiShuClickModel * modes in itemarray) {
        if ([modes.arrow_type isEqualToString:@"2"]) {
            ZSSRightNRView * view = [ZSSRightNRView new];
            view.backcolor = _backcolor;
            view.model = modes;
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(ws).with.offset(LENGTH(14));
                make.right.mas_equalTo(ws).with.offset(-LENGTH(14));
                make.top.mas_equalTo(ws).with.offset(modes.y_axis*poinw);
            }];
        }
    }
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(HEIGHT);
    }];
}

- (void)setAllheight:(CGFloat)allheight{
    _allheight = allheight;
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(allheight);
    }];
    [self.superview layoutIfNeeded];
    CAGradientLayer * gradient = [CAGradientLayer layer];
    gradient.frame = jianbian.bounds;
    gradient.colors = @[(id)[UIColor colorWithRed:3/255.0f green:0/255.0f blue:0/255.0f alpha:0.5].CGColor,(id)[UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0].CGColor];
    gradient.locations = @[@0, @1];
    [gradient setStartPoint:CGPointMake(0, 1)];
    [gradient setEndPoint:CGPointMake(1, 1)];
    [jianbian.layer addSublayer:gradient];
}

@end
