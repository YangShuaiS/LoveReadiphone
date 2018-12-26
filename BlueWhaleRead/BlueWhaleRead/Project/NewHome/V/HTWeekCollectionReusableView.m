//
//  HTWeekCollectionReusableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HTWeekCollectionReusableView.h"

@implementation HTWeekCollectionReusableView{
    BaseLabel * title;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFontCu(16) TextAlignment:NSTextAlignmentLeft Text:@"本周任务完成情况"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(ws).with.offset(LENGTH(12));
        make.left.mas_equalTo(ws).with.offset(LENGTH(16));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(5));
    }];
}
- (void)setSecond:(NSInteger)second{
    if (second == 0) {
        title.font = TextFont(19);
        title.text = @"总任务";
    }else{
        title.font = TextFont(16);
        title.text = _name;
    }
}
@end
