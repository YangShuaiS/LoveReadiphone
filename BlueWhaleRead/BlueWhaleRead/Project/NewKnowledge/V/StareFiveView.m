//
//  StareFiveView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/8.
//  Copyright © 2019 YS. All rights reserved.
//

#import "StareFiveView.h"

@implementation StareFiveView{
    NSMutableArray * viewarray;
}

- (instancetype)initWithImage:(UIImage *)image
                        Count:(NSInteger)count{
    self = [super init];
    if (self) {
        [self addviewWithImage:image Count:count];
    }
    return self;
}
- (void)addviewWithImage:(UIImage *)image
                   Count:(NSInteger)count{
    WS(ws);
    viewarray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        UIImageView * imageview = [UIImageView new];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.image = image;
        [self addSubview:imageview];
        [viewarray addObject:imageview];
    }
    
    UIImageView * lastimageview;
    for (int i = 0 ; i < viewarray.count; i++) {
        UIImageView * imageview = viewarray[i];
        if (i == 0) {
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(ws);
            }];
        }else{
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(lastimageview.mas_right).with.offset(LENGTH(2));
            }];
        }
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(LENGTH(10), LENGTH(10)));
            make.top.and.bottom.mas_equalTo(ws);
        }];
//        if (i == viewarray.count-1) {
//            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.right.mas_equalTo(ws);
//            }];
//        }
        lastimageview = imageview;
    }
}
@end
