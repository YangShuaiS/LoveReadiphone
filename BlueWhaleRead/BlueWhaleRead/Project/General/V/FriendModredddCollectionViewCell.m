//
//  FriendModredddCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendModredddCollectionViewCell.h"

@implementation FriendModredddCollectionViewCell{
    BaseLabel * label;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"..."];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.center.mas_equalTo(ws);
    }];
    
}
@end
