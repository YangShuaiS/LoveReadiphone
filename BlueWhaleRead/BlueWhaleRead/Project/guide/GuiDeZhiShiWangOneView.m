//
//  GuiDeZhiShiWangOneView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/27.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "GuiDeZhiShiWangOneView.h"

@implementation GuiDeZhiShiWangOneView{
    UIScrollView * scrollView;
    UIImageView * zdl;
}

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
- (void)setFrames:(CGRect)frames{
    _frames = frames;
    [self addArc];
    WS(ws);
    
    scrollView = [UIScrollView new];
    scrollView.userInteractionEnabled = YES;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    UIImageView * xian = [UIImageView new];
    xian.contentMode = UIViewContentModeScaleAspectFit;
    xian.image = UIIMAGE(@"线");
    [scrollView addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView).with.offset(ws.frames.origin.y+ws.frames.size.height+LENGTH(2));
        make.left.mas_equalTo(ws).with.offset(LENGTH(94));
        make.width.mas_equalTo(LENGTH(35));
        make.height.mas_equalTo(LENGTH(57));
    }];
    xian.transform = CGAffineTransformMakeRotation(M_PI);
    
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"我们的知识体系分为六大类，分别是文学、文明、历史、自然、美学、科学，每个分类都按照严格的知识系统梳理，轻松帮你掌握知识的精髓～"];
    title.numberOfLines = 0;
    [scrollView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xian.mas_bottom).with.offset(LENGTH(2));
        make.left.mas_equalTo(ws).with.offset(LENGTH(49));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(37));
    }];
    
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = title.text;
    model1.bianString = [NSString stringWithFormat:@"文学、文明、历史、自然、美学、科学"];
    model1.fount = 18;
    model1.color = RGB(255,201,73);
    NSArray * modelarray = @[model1];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    title.attributedText = AttributedStr;
    
    zdl = [UIImageView new];
    zdl.contentMode = UIViewContentModeScaleAspectFit;
    zdl.image = UIIMAGE(@"知道了");
    [scrollView addSubview:zdl];
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
    
    [scrollView.superview layoutIfNeeded];
    if (zdl.frame.origin.y+zdl.frame.size.height > HEIGHT) {
        [zdl mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self->scrollView).with.offset(-TabBarHeight);
        }];
        [scrollView setContentOffset:CGPointMake(0, zdl.frame.origin.y+zdl.frame.size.height+TabBarHeight) animated:YES];
    }
}
- (void)backview{
    self.block();
    [self removeFromSuperview];
}
- (void)addArc {
    //中间镂空的矩形框
    CGRect myRect =_frames;
    
    //背景
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:[UIScreen mainScreen].bounds cornerRadius:0];
    //镂空
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRect:myRect];
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
