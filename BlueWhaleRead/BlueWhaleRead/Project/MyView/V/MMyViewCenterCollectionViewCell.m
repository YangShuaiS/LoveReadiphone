//
//  MMyViewCenterCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/16.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "MMyViewCenterCollectionViewCell.h"

@implementation MMyViewCenterCollectionViewCell{
    UIImageView * imageview;
    BaseLabel * titles;
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
    imageview = [FLAnimatedImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(16));
        make.width.and.height.mas_equalTo(LENGTH(50));
        make.centerX.mas_equalTo(ws);
    }];
    
    titles = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51, 51, 51) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:titles];
    [titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageview.mas_bottom).with.offset(LENGTH(10));
        make.centerX.mas_equalTo(ws);
    }];
    
}
- (void)setTitle:(NSString *)title{
    _title = title;
    titles.text = title;
    imageview.image = UIIMAGE(title);
}
@end
