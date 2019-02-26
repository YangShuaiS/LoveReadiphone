//
//  ZhiShiShuSanJIaoView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ZhiShiShuSanJIaoView.h"

@implementation ZhiShiShuSanJIaoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setPoint:(ZhiSHiShuXianModel *)point{
    _point = point;
    UIBezierPath *circlePath = [UIBezierPath bezierPath];
    CGPoint circlePathone = CGPointMake(0, 4);
    CGPoint circlePathtwo = CGPointMake(12, 8);
    CGPoint circlePaththree = CGPointMake(12, 0);
    
    [circlePath moveToPoint:circlePathone];
    [circlePath addLineToPoint:circlePathtwo];
    [circlePath addLineToPoint:circlePaththree];
    
    CAShapeLayer *fillLayer = [CAShapeLayer layer];
    fillLayer.path = circlePath.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    fillLayer.fillColor = [BaseObject colorWithHexString:point.color].CGColor;
    fillLayer.opacity = 1;
    [self.layer addSublayer:fillLayer];
}

- (void)setPointwo:(ZhiSHiShuXianModel *)pointwo{
    _pointwo = pointwo;
    
    UIBezierPath *circlePath = [UIBezierPath bezierPath];
    CGPoint circlePathone = CGPointMake(12, 4);
    CGPoint circlePathtwo = CGPointMake(0, 8);
    CGPoint circlePaththree = CGPointMake(0, 0);
    
    [circlePath moveToPoint:circlePathone];
    [circlePath addLineToPoint:circlePathtwo];
    [circlePath addLineToPoint:circlePaththree];
    
    CAShapeLayer *fillLayer = [CAShapeLayer layer];
    fillLayer.path = circlePath.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    fillLayer.fillColor = [BaseObject colorWithHexString:pointwo.color].CGColor;
    fillLayer.opacity = 1;
    [self.layer addSublayer:fillLayer];
}
@end
