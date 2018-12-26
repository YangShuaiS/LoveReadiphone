//
//  GuideBookXqThreeView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GuideBookXqThreeView.h"

@implementation GuideBookXqThreeView

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
        make.bottom.mas_equalTo(ws).with.offset(-(HEIGHT - ws.frames.origin.y+LENGTH(20)));
        make.left.mas_equalTo(ws).with.offset(LENGTH(105));
        make.width.mas_equalTo(LENGTH(24));
        make.height.mas_equalTo(LENGTH(64));
    }];
    xian.transform = CGAffineTransformMakeRotation(M_PI*1);
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"还为写读后感抓耳挠腮吗？这里是各校同学们精选的读后感，有些是续写的故事，也有可能是给猪八戒（书中人物）写封信，你希望你写的作文放在这里吗？请联系我们！"];
    title.numberOfLines = 0;
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(xian.mas_top).with.offset(LENGTH(2));
        make.left.mas_equalTo(ws).with.offset(LENGTH(36));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(34));
    }];
    
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = title.text;
    model1.bianString = [NSString stringWithFormat:@"精选"];
    model1.fount = 18;
    model1.color = RGB(255,201,73);
    
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = title.text;
    model2.bianString = [NSString stringWithFormat:@"读后感"];
    model2.fount = 18;
    model2.color = RGB(255,201,73);
    
    AttributedStringModel * model3 = [AttributedStringModel new];
    model3.textString = title.text;
    model3.bianString = [NSString stringWithFormat:@"请联系我们！"];
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
        make.centerY.mas_equalTo(xian);
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
    [self removeFromSuperview];
}
- (void)addArc{

    //背景
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:[UIScreen mainScreen].bounds cornerRadius:0];
    //镂空
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.frames.origin.x + self.frames.size.width/2 -LENGTH(68), _frames.origin.y-LENGTH(30), LENGTH(136), LENGTH(136)) cornerRadius:LENGTH(68)];
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
