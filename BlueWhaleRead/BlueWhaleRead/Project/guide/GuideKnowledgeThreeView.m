//
//  GuideKnowledgeThreeView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/21.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "GuideKnowledgeThreeView.h"

@implementation GuideKnowledgeThreeView{
    UIScrollView * scrollView;
    UIView * xianview;

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
    //    self.opaque = NO;
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.userInteractionEnabled = YES;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    UIImageView* backimage = [UIImageView new];
    backimage.contentMode = UIViewContentModeScaleAspectFit;
    backimage.image = UIIMAGE(@"简介");
    [scrollView addSubview:backimage];
    [backimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView).with.offset(StatusBar+34);
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(260));
        make.height.mas_equalTo(LENGTH(400));
    }];
    
    
    UIImageView* shouzhi = [UIImageView new];
    shouzhi.contentMode = UIViewContentModeScaleAspectFit;
    shouzhi.image = UIIMAGE(@"手指");
    [scrollView addSubview:shouzhi];
    [shouzhi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.bottom.mas_equalTo(backimage.mas_bottom).with.offset(-LENGTH(10));
        make.width.mas_equalTo(LENGTH(193));
        make.height.mas_equalTo(LENGTH(120));
    }];
    
    xianview = [UIView new];
    xianview.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:xianview];
    [xianview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backimage.mas_bottom).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(31));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(31));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"每个人物或事件都有相应的知识介绍卡片，其中包括简介、故事、行走、阅读等，左右滑动查看对应卡片哦～"];
    title.numberOfLines = 0;
    [xianview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->xianview).with.insets(UIEdgeInsetsMake(LENGTH(20), LENGTH(10), LENGTH(20), LENGTH(10)));
    }];
    //
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = title.text;
    model1.bianString = [NSString stringWithFormat:@"知识介绍卡片"];
    model1.fount = 18;
    model1.color = RGB(255,201,73);
    
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = title.text;
    model2.bianString = [NSString stringWithFormat:@"简介、故事、行走、阅读"];
    model2.fount = 18;
    model2.color = RGB(255,201,73);
    NSArray * modelarray = @[model1,model2];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    title.attributedText = AttributedStr;
    
    UIImageView * zdl = [UIImageView new];
    zdl.contentMode = UIViewContentModeScaleAspectFit;
    zdl.image = UIIMAGE(@"知道了");
    [scrollView addSubview:zdl];
    
    UIImageView * xt = [UIImageView new];
    xt.contentMode = UIViewContentModeScaleAspectFit;
    xt.image = UIIMAGE(@"小天右");
    [scrollView addSubview:xt];
    [xt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->xianview.mas_bottom).with.offset(-LENGTH(10));
        make.right.mas_equalTo(ws).with.offset(LENGTH(19));
        make.width.mas_equalTo(LENGTH(124));
        make.height.mas_equalTo(LENGTH(80));
    }];
    
    [zdl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xt.mas_bottom);
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
    [self addlayer:xianview];
    if (self->scrollView.contentSize.height>self->scrollView.frame.size.height) {
        CGPoint offset = CGPointMake(0, self->scrollView.contentSize.height -self->scrollView.frame.size.height);
        [self->scrollView setContentOffset:offset animated:YES];
    }
}
- (void)backview{
    self.block();
    [self removeFromSuperview];
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
