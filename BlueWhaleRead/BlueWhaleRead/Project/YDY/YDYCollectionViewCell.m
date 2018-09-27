//
//  YDYCollectionViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "YDYCollectionViewCell.h"

@implementation YDYCollectionViewCell{
    FLAnimatedImageView * imageView;
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
    WS(ws);
    self.backgroundColor = [UIColor redColor];
    imageView = [FLAnimatedImageView new];
    imageView.backgroundColor = [UIColor redColor];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setImage:(NSString *)image{
        _image = image;
        imageView.image = UIIMAGE(image);
}
@end
