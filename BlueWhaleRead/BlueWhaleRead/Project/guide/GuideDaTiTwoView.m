//
//  GuideDaTiTwoView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GuideDaTiTwoView.h"

@implementation GuideDaTiTwoView{
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
    backimage.image = UIIMAGE(@"答题2");
    [scrollView addSubview:backimage];
    [backimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView).with.offset(NavHeight);
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(292));
        make.height.mas_equalTo(LENGTH(250));
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
    
    BaseLabel * subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@" 答题时间一共十分钟\n可以左右滑动反复检查，如遇困难也可以翻看书本，但是一定要注意合理分配时间哦~"];
    subtitle.numberOfLines = 0;
    [downview addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->downview).with.insets(UIEdgeInsetsMake(LENGTH(20), LENGTH(10), LENGTH(20), LENGTH(10)));
    }];
    
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = subtitle.text;
    model1.bianString = [NSString stringWithFormat:@"十分钟"];
    model1.fount = 18;
    model1.color = RGB(255,201,73);
    
    NSArray * modelarray2 = @[model1];
    
    NSMutableAttributedString *AttributedStr2 = [BaseObject Attributed:modelarray2];
    subtitle.attributedText = AttributedStr2;
    
    UIImageView * zdl = [UIImageView new];
    zdl.contentMode = UIViewContentModeScaleAspectFit;
    zdl.image = UIIMAGE(@"下一步");
    [scrollView addSubview:zdl];
    [zdl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->downview.mas_bottom).with.offset(LENGTH(75));
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
    [self addlayer:downview];
    if (self->scrollView.contentSize.height>self->scrollView.frame.size.height) {
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
