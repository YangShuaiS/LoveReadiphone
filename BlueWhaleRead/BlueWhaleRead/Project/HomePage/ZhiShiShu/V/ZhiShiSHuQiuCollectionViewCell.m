//
//  ZhiShiSHuQiuCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiSHuQiuCollectionViewCell.h"

@implementation ZhiShiSHuQiuCollectionViewCell{
    UIImageView * imageview;
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
    imageview = [UIImageView new];
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setImagestring:(NSString *)imagestring{
    _imagestring = imagestring;
    imageview.image = UIIMAGE(imagestring);
}
@end
