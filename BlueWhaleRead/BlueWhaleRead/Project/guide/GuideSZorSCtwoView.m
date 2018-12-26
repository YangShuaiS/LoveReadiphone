//
//  GuideSZorSCtwoView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GuideSZorSCtwoView.h"

@implementation GuideSZorSCtwoView{
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
    backimage.image = UIIMAGE(@"识字词2");
    [scrollView addSubview:backimage];
    [backimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView).with.offset(NavHeight);
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(325));
        make.height.mas_equalTo(LENGTH(367));
    }];
    
    downview = [UIView new];
    downview.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:downview];
    [downview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backimage.mas_bottom).with.offset(LENGTH(20));
        make.left.mas_equalTo(ws).with.offset(LENGTH(31));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(31));
    }];
    
    UIImageView * xt = [UIImageView new];
    xt.contentMode = UIViewContentModeScaleAspectFit;
    xt.image = UIIMAGE(@"小天左");
    [scrollView addSubview:xt];
    [xt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->downview.mas_top).with.offset(LENGTH(5));
        make.left.mas_equalTo(ws).with.offset(LENGTH(36));
        make.width.mas_equalTo(LENGTH(124));
        make.height.mas_equalTo(LENGTH(80));
    }];
    
    BaseLabel * subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"识字/识词量检测使用两种形式，看图与文字解释，仔细领悟再选择正确答案，每次检测数量为50个字/词，没有时间限制，也不计入积分成绩。"];
    subtitle.numberOfLines = 0;
    [downview addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->downview).with.insets(UIEdgeInsetsMake(LENGTH(20), LENGTH(10), LENGTH(20), LENGTH(10)));
    }];
    
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = subtitle.text;
    model1.bianString = [NSString stringWithFormat:@"识字/识词量"];
    model1.fount = 18;
    model1.color = RGB(255,201,73);
    
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = subtitle.text;
    model2.bianString = [NSString stringWithFormat:@"看图"];
    model2.fount = 18;
    model2.color = RGB(255,201,73);
    
    AttributedStringModel * model3 = [AttributedStringModel new];
    model3.textString = subtitle.text;
    model3.bianString = [NSString stringWithFormat:@"文字解释"];
    model3.fount = 18;
    model3.color = RGB(255,201,73);
    
    AttributedStringModel * model4 = [AttributedStringModel new];
    model4.textString = subtitle.text;
    model4.bianString = [NSString stringWithFormat:@"50个字/词"];
    model4.fount = 18;
    model4.color = RGB(255,201,73);
    
    NSArray * modelarray2 = @[model1,model2,model3,model4];
    
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
- (void)layoutIfNeeded{
    [super layoutIfNeeded];
    
}
- (void)huadong{
    [self addlayer:downview];

    if (self->scrollView.contentSize.height>self->scrollView.frame.size.height) {
        CGPoint offset = CGPointMake(0, self->scrollView.contentSize.height -self->scrollView.frame.size.height);
        [self->scrollView setContentOffset:offset animated:YES];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
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
