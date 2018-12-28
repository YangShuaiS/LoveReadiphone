//
//  UserSZageCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserSZageCollectionViewCell.h"

@implementation UserSZageCollectionViewCell{
    FLAnimatedImageView * imageView;
    BaseLabel * label;
    BaseLabel * sublabel;
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
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor blackColor];
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = LENGTH(5);
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255)LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"一年级"];
    [imageView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView).with.offset(LENGTH(9));
        make.centerX.mas_equalTo(self->imageView);
    }];
    
    sublabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(9) TextAlignment:NSTextAlignmentCenter Text:@"童话绘本"];
    [imageView addSubview:sublabel];
    [sublabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->label.mas_bottom).with.offset(LENGTH(3));
        make.centerX.mas_equalTo(self->imageView);
    }];
}
@end
