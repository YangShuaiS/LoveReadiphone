//
//  UIView+GZExtend.m
//  WKWebView
//
//  Created by zzh on 16/11/2.
//  Copyright © 2016年 Gavin Zeng. All rights reserved.
//

#import "UIView+GZExtend.h"
#import <WebKit/WebKit.h>

@implementation UIView (GZExtend)
- (UIImage *)imageFromView{

    if ([self isKindOfClass:[WKWebView class]]) {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size,
                                               NO, [UIScreen mainScreen].scale);
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    }else{
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, [UIScreen mainScreen].scale);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [self.layer renderInContext:context];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    }
}
@end
