//
//  GuideDaTiFourView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GuideDaTiFourView.h"

@implementation GuideDaTiFourView{
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
    self.backgroundColor = RGBA(0, 0, 0, 0.9);
    WS(ws);
    
    scrollView = [UIScrollView new];
    scrollView.userInteractionEnabled = YES;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    UIImageView * topimage = [UIImageView new];
    topimage.contentMode = UIViewContentModeScaleAspectFit;
    topimage.image = UIIMAGE(@"识字词4-1");
    [scrollView addSubview:topimage];
    [topimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView).with.offset(NavHeight+LENGTH(10));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(32));
        make.width.mas_equalTo(LENGTH(184));
        make.height.mas_equalTo(LENGTH(214));
    }];
    
    topview = [UIView new];
    topview.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView).with.offset(StatusBar+34);
        make.left.mas_equalTo(ws).with.offset(LENGTH(11));
        make.right.mas_equalTo(topimage.mas_left).with.offset(-LENGTH(18));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"答题成功后可以查看错题，知道自己错在哪里可以巩固自己对书的理解哦～"];
    title.numberOfLines = 0;
    [topview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->topview).with.insets(UIEdgeInsetsMake(LENGTH(20), LENGTH(10), LENGTH(20), LENGTH(10)));
    }];
    
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = title.text;
    model1.bianString = [NSString stringWithFormat:@"查看错题"];
    model1.fount = 18;
    model1.color = RGB(255,201,73);
    
    NSArray * modelarray2 = @[model1];
    NSMutableAttributedString *AttributedStr2 = [BaseObject Attributed:modelarray2];
    title.attributedText = AttributedStr2;
    
    UIImageView * xian = [UIImageView new];
    xian.contentMode = UIViewContentModeScaleAspectFit;
    xian.image = UIIMAGE(@"线");
    [scrollView addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->topview.mas_bottom).with.offset(LENGTH(2));
        make.right.mas_equalTo(topimage.mas_left).with.offset(-LENGTH(18));
        make.width.mas_equalTo(LENGTH(48));
        make.height.mas_equalTo(LENGTH(45));
    }];
    xian.transform = CGAffineTransformMakeRotation(M_PI);

    
    UIImageView * downimage = [UIImageView new];
    downimage.contentMode = UIViewContentModeScaleAspectFit;
    downimage.image = UIIMAGE(@"识字词4-2");
    [scrollView addSubview:downimage];
    [downimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topimage.mas_bottom).with.offset(LENGTH(30));
        make.left.mas_equalTo(ws).with.offset(LENGTH(30));
        make.width.mas_equalTo(LENGTH(184));
        make.height.mas_equalTo(LENGTH(214));
    }];
    
    downview = [UIView new];
    downview.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:downview];
    [downview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(downimage).with.offset(LENGTH(40));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(11));
        make.left.mas_equalTo(downimage.mas_right).with.offset(LENGTH(18));
    }];
    
    BaseLabel * subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"答题失败不要气馁，每天都会有2次答题机会哦，相信你下次一定能成功通过～"];
    subtitle.numberOfLines = 0;
    [downview addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->downview).with.insets(UIEdgeInsetsMake(LENGTH(20), LENGTH(10), LENGTH(20), LENGTH(10)));
    }];
    
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = subtitle.text;
    model2.bianString = [NSString stringWithFormat:@"2次"];
    model2.fount = 18;
    model2.color = RGB(255,201,73);
    
    NSArray * modelarray = @[model2];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    subtitle.attributedText = AttributedStr;
    
    UIImageView * xian1 = [UIImageView new];
    xian1.contentMode = UIViewContentModeScaleAspectFit;
    xian1.image = UIIMAGE(@"线");
    [scrollView addSubview:xian1];
    [xian1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(downimage.mas_top).with.offset(LENGTH(6));
        make.left.mas_equalTo(downimage.mas_right).with.offset(LENGTH(18));
        make.width.mas_equalTo(LENGTH(60));
        make.height.mas_equalTo(LENGTH(32));
    }];
    
    
    UIImageView * zdl = [UIImageView new];
    zdl.contentMode = UIViewContentModeScaleAspectFit;
    zdl.image = UIIMAGE(@"开始答题");
    [scrollView addSubview:zdl];
    [zdl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(downimage.mas_bottom).with.offset(LENGTH(20));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(139));
        make.height.mas_equalTo(LENGTH(110));
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
    [self addlayer:topview];
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
