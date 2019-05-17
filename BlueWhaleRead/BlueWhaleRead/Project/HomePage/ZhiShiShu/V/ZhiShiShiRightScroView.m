//
//  ZhiShiShiRightScroView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/25.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ZhiShiShiRightScroView.h"
#import "ZhiShiShuRightTableView.h"
@implementation ZhiShiShiRightScroView{
    UIView * jianbian;
    CAGradientLayer * gradient;
    ZhiShiShuRightTableView * tableView;

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
    self.backgroundColor = RGBA(0, 0, 0, 0.4);
    WS(ws);
    jianbian = [UIView new];
    [self addSubview:jianbian];
    [jianbian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.and.left.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(31));
    }];
    gradient = [CAGradientLayer layer];

    tableView = [ZhiShiShuRightTableView new];
    [self addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    tableView.itemarray = itemarray;
}
- (void)setBackcolor:(UIColor *)backcolor{
    _backcolor = backcolor;
    tableView.backcolor = backcolor;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    gradient.frame = jianbian.bounds;
    gradient.colors = @[(id)[UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.5].CGColor,(id)[UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0].CGColor];
    gradient.locations = @[@0, @1];
    [gradient setStartPoint:CGPointMake(0, 1)];
    [gradient setEndPoint:CGPointMake(1, 1)];
    [jianbian.layer addSublayer:gradient];
}
@end
