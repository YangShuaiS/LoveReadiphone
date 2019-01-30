//
//  GuideBookCityOneView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GuideBookCityOneView.h"

@implementation GuideBookCityOneView

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
        make.top.mas_equalTo(ws).with.offset(frames.origin.y+frames.size.height);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(40));
        make.width.mas_equalTo(LENGTH(38));
        make.height.mas_equalTo(LENGTH(56));
    }];
//    xian.transform = CGAffineTransformMakeRotation(M_PI);
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"还在为找不到书烦恼？在这里你可以直接扫面图书背后的ISBN码（条形码），系统会自动为你找到相关书籍~"];
    title.numberOfLines = 0;
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(xian.mas_bottom).with.offset(LENGTH(2));
        make.left.mas_equalTo(ws).with.offset(LENGTH(38));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(46));
    }];
    
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = title.text;
    model1.bianString = [NSString stringWithFormat:@"ISBN码（条形码）"];
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
        make.top.mas_equalTo(title.mas_bottom).with.offset(-LENGTH(5));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(50));
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
- (void)addArc {
    //中间镂空的矩形框    
    //背景
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:[UIScreen mainScreen].bounds cornerRadius:0];
    //镂空
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_frames.size.width-LENGTH(50), _frames.origin.y+_frames.size.height/2-LENGTH(20   ), LENGTH(40),LENGTH(40)) cornerRadius:LENGTH(20)];
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
