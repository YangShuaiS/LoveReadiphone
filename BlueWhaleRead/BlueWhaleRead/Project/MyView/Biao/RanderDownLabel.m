//
//  RanderDownLabel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "RanderDownLabel.h"

@implementation RanderDownLabel{
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
}
- (void)setElement:(ElementItem *)element{
    _element = element;
    WS(ws);
    BaseView * view = [BaseView new];
    view.backgroundColor = element.itemColor;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = LENGTH(5);
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(5));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(5));
        make.left.mas_equalTo(ws).with.offset(LENGTH(5));
        make.width.mas_equalTo(ws).multipliedBy(0.4);
    }];
    
    BaseLabel * label = [BaseLabel new];
    label.text = element.itemName;
    label.adjustsFontSizeToFitWidth = YES;
    label.textColor = RGB(0x33, 0x33, 0x33);
//    BaseLabel * label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(0x33, 0x33, 0x33) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentCenter Text:element.itemName];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
        make.left.mas_equalTo(view.mas_right).with.offset(LENGTH(5));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(5));
    }];
}
@end
