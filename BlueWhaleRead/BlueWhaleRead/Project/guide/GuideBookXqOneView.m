//
//  GuideBookXqOneView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GuideBookXqOneView.h"

@implementation GuideBookXqOneView

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
        make.top.mas_equalTo(ws).with.offset(self->_frames.origin.y+LENGTH(100)+LENGTH(136)-LENGTH(16));
        make.left.mas_equalTo(ws).with.offset(ws.frames.origin.x+LENGTH(20)+LENGTH(136)+LENGTH(10));
        make.width.mas_equalTo(LENGTH(36));
        make.height.mas_equalTo(LENGTH(56));
    }];
    xian.transform = CGAffineTransformMakeRotation(M_PI);
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"每一本书标题下面的星星，代表着本书的星级，这是研究院的叔叔阿姨精心评选出来的，每一个星星不仅仅代表这本书的好坏，还是叔叔阿姨们对孩子们的一片爱心~"];
    title.numberOfLines = 0;
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xian.mas_bottom).with.offset(LENGTH(2));
        make.left.mas_equalTo(ws).with.offset(LENGTH(36));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(34));
    }];
    
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = title.text;
    model1.bianString = [NSString stringWithFormat:@"本书的星级"];
    model1.fount = 18;
    model1.color = RGB(255,201,73);
    NSArray * modelarray = @[model1];
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
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_frames.origin.x+LENGTH(20)+LENGTH(30), _frames.origin.y+LENGTH(110)*1.42+17, LENGTH(86), LENGTH(86)) cornerRadius:LENGTH(43)];
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
