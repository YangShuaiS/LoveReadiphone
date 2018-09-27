//
//  UIView+JKUiviewExtension.m
//  CIOTimes
//
//  Created by 王冲 on 2016/12/8.
//  Copyright © 2016年 wangchao. All rights reserved.
//

#import "UIView+JKUiviewExtension.h"

@implementation UIView (JKUiviewExtension)
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}


//判断一个view是否在主窗口上
-(BOOL)isShowingOnWindow{

    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    
    
    //nil = [UIApplication sharedApplication].keyWindow
    //转换坐标系
    CGRect newFrame = [self.superview convertRect:self.frame toView:keywindow];
    
    //CGRect newFrame = [[UIApplication sharedApplication].keyWindow convertRect:subview.frame fromView:subview.superview];
    
    CGRect windowBouns = keywindow.bounds;
    
    BOOL intersects =  CGRectIntersectsRect(newFrame, windowBouns);
    
    //判断一个控件是否真正显示在窗口范围内

    return !self.isHidden && self.alpha > 0.01 && intersects && self.window == keywindow;

}


@end
