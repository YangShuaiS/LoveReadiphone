//
//  ZhiShiShurightNriRongView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/25.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ZhiShiShurightNriRongView.h"
#import "ZSSRightNRView.h"
@implementation ZhiShiShurightNriRongView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{

}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    WS(ws);
    for (ZhiShiShuClickModel * modes in itemarray) {
        if ([modes.arrow_type isEqualToString:@"2"]) {
            ZSSRightNRView * view = [ZSSRightNRView new];
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
}
@end
