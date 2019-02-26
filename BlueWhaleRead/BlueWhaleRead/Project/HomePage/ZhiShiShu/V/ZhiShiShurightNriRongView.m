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
    WS(ws);
    BaseLabel * label = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"全部知识图"];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(StatusBar);
        make.left.mas_equalTo(ws).with.offset(LENGTH(23));
        make.height.mas_equalTo(NavHeight-StatusBar);
    }];
    
    UIView * xian = [UIView new];
    xian.backgroundColor = [UIColor whiteColor];
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom);
        make.left.mas_equalTo(label);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.height.mas_equalTo(1);
    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    WS(ws);
    for (ZhiShiShuClickModel * modes in itemarray) {
        ZSSRightNRView * view = [ZSSRightNRView new];
        view.model = modes;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws).with.offset(LENGTH(14));
            make.right.mas_equalTo(ws).with.offset(-LENGTH(14));
            make.top.mas_equalTo(ws).with.offset(modes.y_axis*poinw+NavHeight+ws.topheight);
        }];
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
