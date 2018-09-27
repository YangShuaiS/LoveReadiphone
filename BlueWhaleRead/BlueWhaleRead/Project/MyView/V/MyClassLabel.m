//
//  MyClassLabel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyClassLabel.h"

@implementation MyClassLabel

- (void)drawTextInRect:(CGRect)rect {
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(c, self.outLineWidth);
    
    CGContextSetLineJoin(c, kCGLineJoinRound);
    
    CGContextSetTextDrawingMode(c, kCGTextStroke);
    
    self.textColor = self.outLinetextColor;
    
    [super drawTextInRect:rect];
    
    self.textColor = self.labelTextColor;
    
    CGContextSetTextDrawingMode(c, kCGTextFill);
    
    [super drawTextInRect:rect];
    
}

@end
