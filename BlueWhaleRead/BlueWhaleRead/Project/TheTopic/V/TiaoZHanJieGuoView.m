//
//  TiaoZHanJieGuoView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TiaoZHanJieGuoView.h"

@implementation TiaoZHanJieGuoView{
    BaseLabel * FenZhi;
    BaseLabel * tongguo;
    
    UIView * view;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    self.backgroundColor = [UIColor clearColor];
    FenZhi = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(52) TextAlignment:NSTextAlignmentLeft Text:@"100"];
    [self addSubview:FenZhi];
    [FenZhi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(84));
    }];
    
    BaseLabel * fen = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:@"分"];
    [self addSubview:fen];
    [fen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->FenZhi.mas_top).with.offset(LENGTH(10));
        make.left.mas_equalTo(self->FenZhi.mas_right).with.offset(LENGTH(8));
    }];
    
    BaseLabel * tongguo = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"通过"];
    [self addSubview:tongguo];
    [tongguo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(0);
        make.centerX.mas_equalTo(ws.mas_centerX);
    }];
    view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    
    // 线的路径
    CGPoint viewCenter = CGPointMake(view.frame.size.width / 2.0, view.frame.size.height / 2.0); // 画弧的中心点，相对于view
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:viewCenter radius:self.frame.size.height/2 startAngle:M_PI_2*1.5 endAngle:M_PI_2 * 0.5 clockwise:YES];
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.lineWidth = 1;
    pathLayer.strokeColor = [UIColor whiteColor].CGColor;
    pathLayer.fillColor = nil; // 默认为blackColor
    pathLayer.path = path.CGPath;
    [view.layer addSublayer:pathLayer];
    float r = 100.0f;

    UIBezierPath *paths = [UIBezierPath bezierPath];
    [[UIColor blueColor] setStroke];
    [paths setLineWidth:2.0];
    [paths setLineJoinStyle:kCGLineJoinRound];
    [paths setLineCapStyle:kCGLineCapRound];
    for (int i = 0 ; i < r; i++) {
        float x   = 0;
        float y   = 0;
        double pi = (M_PI_2*1.5/(100));
        Coordinate_2(pi,LENGTH(20)*(r-i)/r, self.center.x, self.center.y,&x, &y);
        CGPoint point = CGPointMake(x, y);
        if (i == 0) {
            [paths moveToPoint:point];
        }else{
            [paths addLineToPoint:point];
        }
    }
    CAShapeLayer * animLayer = [CAShapeLayer layer];
    animLayer.path = paths.CGPath;
    //            animLayer.fillColor = [UIColor clearColor].CGColor;
    animLayer.lineWidth = 1.f;
    animLayer.strokeColor = [UIColor blueColor].CGColor;
    animLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:animLayer];

}
@end
