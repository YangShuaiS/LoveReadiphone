//
//  BuyPackageBackView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/24.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyPackageBackView.h"

@implementation BuyPackageBackView

- (void)layoutSubviews{
    [super layoutSubviews];
    CAGradientLayer *gradientLayer0 = [[CAGradientLayer alloc] init];
    gradientLayer0.cornerRadius = 5;
    gradientLayer0.frame = self.bounds;
    gradientLayer0.colors = @[
                              (id)[UIColor colorWithRed:201.0f/255.0f green:169.0f/255.0f blue:114.0f/255.0f alpha:1.0f].CGColor,
                              (id)[UIColor colorWithRed:226.0f/255.0f green:207.0f/255.0f blue:165.0f/255.0f alpha:1.0f].CGColor];
    gradientLayer0.locations = @[@0, @1];
    [gradientLayer0 setStartPoint:CGPointMake(1, 1)];
    [gradientLayer0 setEndPoint:CGPointMake(1, 0)];
    [self.layer addSublayer:gradientLayer0];
}

@end
