//
//  BaseButton.m
//  ZYlive
//
//  Created by 杨帅 on 2017/5/26.
//  Copyright © 2017年 杨帅. All rights reserved.
//

#import "BaseButton.h"

@implementation BaseButton
- (instancetype)initWithFrame:(CGRect)frame ImageView:(UIImage *)image{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:image forState:UIControlStateNormal];
    }
    return self;
}

@end
