//
//  HotFire.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HotFire.h"

@implementation HotFire{
    NSMutableArray * array;
}

- (void)setInter:(NSInteger)inter{
    _inter = inter;
    
    for (FLAnimatedImageView * imageView in array) {
        [imageView removeFromSuperview];
    }
    
    array = [NSMutableArray array];
    //    [self removeFromSuperview];
    for (int i = 0; i < inter; i++) {
        FLAnimatedImageView * image = [FLAnimatedImageView new];
        image.image = UIIMAGE(@"huo");
        [array addObject:image];
    }
    
    WS(ws);
    FLAnimatedImageView * lastimageview;
    for (int i = 0; i < inter; i++) {
        FLAnimatedImageView * view = array[i];
        [self addSubview:view];
        
        if (!lastimageview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.equalTo(ws).with.offset(0);
                make.bottom.equalTo(ws).with.offset(0);
                make.right.equalTo(ws).with.offset(0);
                make.width.mas_equalTo(LENGTH(18));
                make.height.mas_equalTo(LENGTH(18));
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(lastimageview.mas_left).with.offset(-LENGTH(5));
                make.centerY.mas_equalTo(lastimageview.mas_centerY);
                make.width.mas_equalTo(LENGTH(18));
                make.height.mas_equalTo(LENGTH(18));
            }];
        }
        if (i == inter-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws).with.offset(0);
            }];
        }
        lastimageview = view;
    }
}
@end
