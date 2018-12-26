//
//  TakTaskJSView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TakTaskJSView.h"

@implementation TakTaskJSView{
    BaseLabel * title;
    BaseLabel * subtitle;
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
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(23,84,80) LabelFont:TextFont(21) TextAlignment:NSTextAlignmentLeft Text:@"任务介绍"];
    [ws addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(LENGTH(15));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(15));
    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(23,84,80) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    subtitle.numberOfLines = 0;
    [ws addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(22));
        make.left.mas_equalTo(ws).with.offset(LENGTH(15));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(15));
        make.bottom.mas_equalTo(ws);
    }];

}
- (void)setModel:(TAKALLModel *)model{
    _model = model;
    subtitle.text = model.mission.mission_info;
}
@end
