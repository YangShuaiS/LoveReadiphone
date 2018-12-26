//
//  GuideTaskTwoView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GuideTaskTwoView.h"

@implementation GuideTaskTwoView{
    UIView * topview;
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
    self.backgroundColor = RGBA(0, 0, 0, 0.8);
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.userInteractionEnabled = YES;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    topview = [UIView new];
    topview.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView).with.offset(StatusBar+16);
        make.left.mas_equalTo(ws).with.offset(LENGTH(31));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(31));

    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@" 读书没有捷径，但有很多技巧，不仅能提高阅读能力，也可以获得高分，这里的高分攻略可以帮助你在任务中获得更高的分数。"];
    title.numberOfLines = 0;
    [topview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->topview).with.insets(UIEdgeInsetsMake(LENGTH(20), LENGTH(10), LENGTH(20), LENGTH(10)));
    }];
    
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = title.text;
    model1.bianString = [NSString stringWithFormat:@"高分攻略"];
    model1.fount = 18;
    model1.color = RGB(255,201,73);
    NSArray * modelarray = @[model1];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    title.attributedText = AttributedStr;
    
    UIImageView * xian = [UIImageView new];
    xian.contentMode = UIViewContentModeScaleAspectFit;
    xian.image = UIIMAGE(@"线");
    [scrollView addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->topview.mas_bottom).with.offset(LENGTH(2));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(82));
        make.width.mas_equalTo(LENGTH(32));
        make.height.mas_equalTo(LENGTH(44));
    }];
    
    UIImageView * backimage = [UIImageView new];
    backimage.contentMode = UIViewContentModeScaleAspectFit;
    backimage.image = UIIMAGE(@"任务2");
    [scrollView addSubview:backimage];
    [backimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->topview.mas_bottom).with.offset(-LENGTH(5));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(314));
        make.height.mas_equalTo(LENGTH(369));
    }];
    
    downview = [UIView new];
    downview.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:downview];
    [downview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backimage.mas_bottom).with.offset(0);
        make.left.mas_equalTo(ws).with.offset(LENGTH(31));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(31));

    }];
    
    BaseLabel * subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"每种任务都有固定的规则，仔细阅读规则，并完成它，一步步助你成为知识小博士。"];
    subtitle.numberOfLines = 0;
    [downview addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->downview).with.insets(UIEdgeInsetsMake(LENGTH(20), LENGTH(10), LENGTH(20), LENGTH(10)));
    }];
    
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = subtitle.text;
    model2.bianString = [NSString stringWithFormat:@"规则，仔细阅读"];
    model2.fount = 18;
    model2.color = RGB(255,201,73);
    NSArray * modelarray2 = @[model2];
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
    zdl.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backview)];
    //将手势添加到需要相应的view中去
    [zdl addGestureRecognizer:tapviewtap];
    //GCD延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self huadong];
    });
}
- (void)huadong{
    [self addlayer:topview];
    [self addlayer:downview];    if (self->scrollView.contentSize.height>self->scrollView.frame.size.height) {
        CGPoint offset = CGPointMake(0, self->scrollView.contentSize.height -self->scrollView.frame.size.height);
        [self->scrollView setContentOffset:offset animated:YES];
    }
}
- (void)backview{
    self.block();
    [self removeFromSuperview];
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
