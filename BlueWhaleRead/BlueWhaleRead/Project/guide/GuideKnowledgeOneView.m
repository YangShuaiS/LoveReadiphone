//
//  GuideKnowledgeOneView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/21.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "GuideKnowledgeOneView.h"

@implementation GuideKnowledgeOneView{
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
    WS(ws);
    UIImageView* backimage = [UIImageView new];
    backimage.contentMode = UIViewContentModeScaleAspectFit;
    backimage.image = UIIMAGE(@"手指");
    [self addSubview:backimage];
    [backimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(193));
        make.height.mas_equalTo(LENGTH(120));
    }];
    xianview = [UIView new];
    xianview.backgroundColor = [UIColor clearColor];
    [self addSubview:xianview];
    [xianview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backimage.mas_bottom).with.offset(LENGTH(50));
        make.left.mas_equalTo(ws).with.offset(LENGTH(31));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(31));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"知识体系有多个类别，左右滑动可查看更多类别~"];
    title.numberOfLines = 0;
    [xianview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->xianview).with.insets(UIEdgeInsetsMake(LENGTH(20), LENGTH(10), LENGTH(20), LENGTH(10)));
    }];
    //
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = title.text;
    model1.bianString = [NSString stringWithFormat:@"知识体系"];
    model1.fount = 18;
    model1.color = RGB(255,201,73);
    NSArray * modelarray = @[model1];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    title.attributedText = AttributedStr;
    
    UIImageView * zdl = [UIImageView new];
    zdl.contentMode = UIViewContentModeScaleAspectFit;
    zdl.image = UIIMAGE(@"下一步");
    [self addSubview:zdl];
    [zdl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->xianview.mas_bottom).with.offset(LENGTH(30));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(40));
        make.width.mas_equalTo(LENGTH(84));
        make.height.mas_equalTo(LENGTH(32));
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
