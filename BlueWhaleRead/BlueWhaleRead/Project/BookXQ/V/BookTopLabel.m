//
//  BookTopLabel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/8/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookTopLabel.h"

@implementation BookTopLabel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    _longlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:subtitleColor LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:[NSString stringWithFormat:@""]];
    _longlabel.numberOfLines = 4;
    [self addSubview:_longlabel];
    
    WS(ws);
    [_longlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
@end
