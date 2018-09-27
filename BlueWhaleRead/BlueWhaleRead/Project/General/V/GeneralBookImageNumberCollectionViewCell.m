//
//  GeneralBookImageNumberCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GeneralBookImageNumberCollectionViewCell.h"

@implementation GeneralBookImageNumberCollectionViewCell{
    FLAnimatedImageView * imageView;
    
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
    imageView = [FLAnimatedImageView new];
    imageView.backgroundColor = RANDOMCOLOR;
    imageView.layer.masksToBounds = YES;
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(ws.mas_width).with.offset(0);
    }];
}

@end
