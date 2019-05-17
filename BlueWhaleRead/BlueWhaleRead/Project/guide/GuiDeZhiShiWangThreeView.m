//
//  GuiDeZhiShiWangThreeView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/27.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "GuiDeZhiShiWangThreeView.h"
//#define itemHeight LENGTH(162)*0.610561+LENGTH(15)+LENGTH(16)+LENGTH(5)+LENGTH(16)+LENGTH(17)
#define itemHeight LENGTH(163)*0.552147+LENGTH(10)+LENGTH(14)+LENGTH(3)+LENGTH(12)

@implementation GuiDeZhiShiWangThreeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    self.backgroundColor = [UIColor clearColor];
}

- (void)setViewy:(CGFloat)viewy{
    _viewy = viewy;
    [self addArc];
    WS(ws);
    UIImageView * xian = [UIImageView new];
    xian.contentMode = UIViewContentModeScaleAspectFit;
    xian.image = UIIMAGE(@"线");
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(viewy+LENGTH(43)+itemHeight+LENGTH(14));
        make.left.mas_equalTo(ws).with.offset(LENGTH(94));
        make.width.mas_equalTo(LENGTH(35));
        make.height.mas_equalTo(LENGTH(57));
    }];
    xian.transform = CGAffineTransformMakeRotation(M_PI);
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"根据你近期的浏览，\n这里会推荐你可能感兴趣的知识图～"];
    title.numberOfLines = 0;
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xian.mas_bottom).with.offset(LENGTH(2));
        make.left.mas_equalTo(ws).with.offset(LENGTH(49));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(37));
    }];
    
    UIImageView * zdl = [UIImageView new];
    zdl.contentMode = UIViewContentModeScaleAspectFit;
    zdl.image = UIIMAGE(@"知道了");
    [self addSubview:zdl];
    [zdl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(40));
        make.width.mas_equalTo(LENGTH(84));
        make.height.mas_equalTo(LENGTH(32));
    }];
    zdl.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backview)];
    //将手势添加到需要相应的view中去
    [zdl addGestureRecognizer:tapviewtap];
}
- (void)backview{
    self.block();
    [self removeFromSuperview];
}
- (void)addArc {
    //中间镂空的矩形框
    //背景
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:[UIScreen mainScreen].bounds cornerRadius:0];
    //镂空
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, _viewy, WIDTH, LENGTH(43)+itemHeight+LENGTH(14))];
    //    [circlePath stroke];
    //    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:myRect];
    [path appendPath:circlePath];
    [path setUsesEvenOddFillRule:YES];
    
    CAShapeLayer *fillLayer = [CAShapeLayer layer];
    fillLayer.path = path.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    fillLayer.fillColor = [UIColor blackColor].CGColor;
    fillLayer.opacity = 0.7;
    [self.layer addSublayer:fillLayer];
}
@end
