//
//  GuideSZorSConeView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GuideSZorSConeView.h"

@implementation GuideSZorSConeView{
    UIView * downview;
    UIScrollView * scrollView;

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
    self.backgroundColor = RGBA(0, 0, 0, 0.9);
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.userInteractionEnabled = YES;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    UIImageView * backimage = [UIImageView new];
    backimage.contentMode = UIViewContentModeScaleAspectFit;
    backimage.image = UIIMAGE(@"识字词1");
    [scrollView addSubview:backimage];
    [backimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView).with.offset(NavHeight);
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(293));
        make.height.mas_equalTo(LENGTH(287));
    }];
    
    downview = [UIView new];
    downview.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:downview];
    [downview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backimage.mas_bottom).with.offset(0);
        make.left.mas_equalTo(ws).with.offset(LENGTH(31));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(31));
    }];
    
    BaseLabel * subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"能力测试包含识字量测试和识词量测试，识字/词作为阅读的基础，掌握更多的识字词量可以更好的在阅读时去理解图书。\n成人识字量在5000~7000左右，识词量在25万~60万左右，快快测试一下你的识字量是多少吧！"];
    subtitle.numberOfLines = 0;
    [downview addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->downview).with.insets(UIEdgeInsetsMake(LENGTH(20), LENGTH(10), LENGTH(20), LENGTH(10)));
    }];
    
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = subtitle.text;
    model1.bianString = [NSString stringWithFormat:@"识字量测试"];
    model1.fount = 18;
    model1.color = RGB(255,201,73);
    
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = subtitle.text;
    model2.bianString = [NSString stringWithFormat:@"识词量测试"];
    model2.fount = 18;
    model2.color = RGB(255,201,73);
    
    AttributedStringModel * model3 = [AttributedStringModel new];
    model3.textString = subtitle.text;
    model3.bianString = [NSString stringWithFormat:@"阅读的基础"];
    model3.fount = 18;
    model3.color = RGB(255,201,73);
    
    AttributedStringModel * model4 = [AttributedStringModel new];
    model4.textString = subtitle.text;
    model4.bianString = [NSString stringWithFormat:@"5000~7000"];
    model4.fount = 18;
    model4.color = RGB(255,201,73);
    
    AttributedStringModel * model5 = [AttributedStringModel new];
    model5.textString = subtitle.text;
    model5.bianString = [NSString stringWithFormat:@"25万~60万"];
    model5.fount = 18;
    model5.color = RGB(255,201,73);
    
    NSArray * modelarray2 = @[model1,model2,model3,model4,model5];
    
    NSMutableAttributedString *AttributedStr2 = [BaseObject Attributed:modelarray2];
    subtitle.attributedText = AttributedStr2;
    
    UIImageView * zdl = [UIImageView new];
    zdl.contentMode = UIViewContentModeScaleAspectFit;
    zdl.image = UIIMAGE(@"下一步");
    [scrollView addSubview:zdl];
    [zdl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->downview.mas_bottom).with.offset(LENGTH(30));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(40));
        make.width.mas_equalTo(LENGTH(84));
        make.height.mas_equalTo(LENGTH(32));
        make.bottom.mas_equalTo(self->scrollView).with.offset(-LENGTH(20));

    }];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backview)];
    //将手势添加到需要相应的view中去
    [self addGestureRecognizer:tapviewtap];
    
    //GCD延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self huadong];
    });
}
- (void)backview{
    self.block();
    [self removeFromSuperview];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
}
- (void)huadong{
    [self addlayer:downview];
    
    if (self->scrollView.contentSize.height>self->scrollView.frame.size.height) {
        CGPoint offset = CGPointMake(0, self->scrollView.contentSize.height -self->scrollView.frame.size.height);
        [self->scrollView setContentOffset:offset animated:YES];
    }
}

- (void)addlayer:(UIView *)view{
    CAShapeLayer *border = [CAShapeLayer layer];
    border.cornerRadius = LENGTH(32);
    //虚线的颜色
    border.strokeColor = [UIColor whiteColor].CGColor;
    //填充的颜色
    border.fillColor = [UIColor clearColor].CGColor;
    
    //设置路径
    //    border.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    border.path = [UIBezierPath bezierPathWithRoundedRect:view.bounds cornerRadius:LENGTH(20)].CGPath;
    
    border.frame = view.bounds;
    //虚线的宽度
    border.lineWidth = 1.f;
    
    //设置线条的样式
    //    border.lineCap = @"square";
    //虚线的间隔
    border.lineDashPattern = @[@4, @2];
    
    [view.layer addSublayer:border];
    
}
@end
