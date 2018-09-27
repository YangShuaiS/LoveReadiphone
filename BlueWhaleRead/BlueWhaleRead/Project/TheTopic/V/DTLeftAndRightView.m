//
//  DTLeftAndRightView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTLeftAndRightView.h"

@implementation DTLeftAndRightView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.backgroundColor = [UIColor clearColor];
//    //Base style for 矩形 14 拷贝
//    UIView *style = [[UIView alloc] initWithFrame:CGRectMake(737, 258, 15, 437)];
//    style.layer.backgroundColor = [[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f] CGColor];
//    style.alpha = 1;
//
//    //Gradient 0 fill for 矩形 14 拷贝
//    CAGradientLayer *gradientLayer0 = [[CAGradientLayer alloc] init];
//    gradientLayer0.frame = style.bounds;
//    gradientLayer0.colors = @[
//                              (id)[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f].CGColor,
//                              (id)[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.6f].CGColor,
//                              (id)[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f].CGColor];
//    gradientLayer0.locations = @[@0, @0, @1];
//    [gradientLayer0 setStartPoint:CGPointMake(1, 1)];
//    [gradientLayer0 setEndPoint:CGPointMake(1, 0)];
//    [style.layer addSublayer:gradientLayer0];
//
//    [self addSubview:style];
//    WS(ws);
//    [style mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(ws);
//    }];
}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self addnewBody];

}
- (void)layoutSubviews{
    [super layoutSubviews];
}
- (void)addnewBody{
    CGPoint point1 = CGPointMake(0, 0);
    CGPoint point2 = CGPointMake(1, self.frame.size.height/2-LENGTH(10));
    CGPoint point3 = CGPointMake(self.frame.size.width, self.frame.size.height/2);
    CGPoint point4 = CGPointMake(1, self.frame.size.height/2+LENGTH(10));
    CGPoint point5 = CGPointMake(0, self.frame.size.height);
    CGPoint point6 = CGPointMake(0, self.frame.size.height/2+LENGTH(10));
    CGPoint point7 = CGPointMake(self.frame.size.width-1, self.frame.size.height/2);
    CGPoint point8 = CGPointMake(0, self.frame.size.height/2-LENGTH(10));
    CGPoint point9 = CGPointMake(0, 0);

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addLineToPoint:point5];
    [path addLineToPoint:point6];
    [path addLineToPoint:point7];
    [path addLineToPoint:point8];
    [path addLineToPoint:point9];

    
    CAShapeLayer * animLayer = [CAShapeLayer layer];
    animLayer.path = path.CGPath;
    animLayer.lineWidth = 0.1f;
    animLayer.strokeColor = [UIColor clearColor].CGColor;
    animLayer.fillColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:animLayer];
}
@end
