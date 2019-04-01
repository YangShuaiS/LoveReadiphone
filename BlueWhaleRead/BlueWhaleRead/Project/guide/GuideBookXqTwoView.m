//
//  GuideBookXqTwoView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GuideBookXqTwoView.h"

@implementation GuideBookXqTwoView

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
    //    self.opaque = NO;
}
- (void)setFrames:(CGRect)frames{
    _frames = frames;
    [self addArc];
    
    WS(ws);
    UIImageView * xian = [UIImageView new];
    xian.contentMode = UIViewContentModeScaleAspectFit;
    xian.image = UIIMAGE(@"线");
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(ws.frames.origin.y+17+LENGTH(6)+LENGTH(28)+LENGTH(21)+NavHeight+LENGTH(70));
        make.left.mas_equalTo(ws).with.offset(ws.frames.origin.x+LENGTH(105));
        make.width.mas_equalTo(LENGTH(36));
        make.height.mas_equalTo(LENGTH(56));
    }];
    xian.transform = CGAffineTransformMakeRotation(M_PI*1.4);
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"书的等级对应着你的年级，选书时可以根据自己的级别，选择自己喜欢的书来看。\n\n\n能力分值代表这本书的难度，分值越高，答题成功所获得的得分也越高~"];
    title.numberOfLines = 0;
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xian.mas_bottom).with.offset(LENGTH(2));
        make.left.mas_equalTo(ws).with.offset(LENGTH(36));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(34));
    }];
    
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = title.text;
    model1.bianString = [NSString stringWithFormat:@"等级"];
    model1.fount = 18;
    model1.color = RGB(255,201,73);
    
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = title.text;
    model2.bianString = [NSString stringWithFormat:@"年级"];
    model2.fount = 18;
    model2.color = RGB(255,201,73);
    
    AttributedStringModel * model3 = [AttributedStringModel new];
    model3.textString = title.text;
    model3.bianString = [NSString stringWithFormat:@"能力分值"];
    model3.fount = 18;
    model3.color = RGB(255,201,73);
    
    NSArray * modelarray = @[model1,model2,model3];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    title.attributedText = AttributedStr;
    
    
    UIImageView * zdl = [UIImageView new];
    zdl.contentMode = UIViewContentModeScaleAspectFit;
    zdl.image = UIIMAGE(@"知道了");
    [self addSubview:zdl];
    [zdl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(10));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(52));
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
- (void)addArc{
    //中间镂空的矩形框
    //背景
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:[UIScreen mainScreen].bounds cornerRadius:0];
    //镂空
    //    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRect:myRect];
    //    [circlePath stroke];
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(_frames.origin.x+LENGTH(110)+LENGTH(20), _frames.origin.y+17+LENGTH(6)+LENGTH(28)+LENGTH(21)+NavHeight, LENGTH(242), LENGTH(50))];
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
