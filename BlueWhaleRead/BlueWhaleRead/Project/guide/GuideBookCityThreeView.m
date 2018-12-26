//
//  GuideBookCityThreeView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GuideBookCityThreeView.h"

@implementation GuideBookCityThreeView

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
- (void)backview{
    self.block();
    [self removeFromSuperview];
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
    make.bottom.mas_equalTo(ws).with.offset(-TabBarHeight-frames.size.height-LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(76));
        make.width.mas_equalTo(LENGTH(32));
        make.height.mas_equalTo(LENGTH(60));
    }];
    xian.transform = CGAffineTransformMakeRotation(M_PI);

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
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"每周我们的院长会选一本好书，进行详细的解读，帮你你更深入了解这本书，有很多有趣的东西，等着你去发现呢！"];
    title.numberOfLines = 0;
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(xian.mas_top).with.offset(-LENGTH(4));
        make.left.mas_equalTo(ws).with.offset(LENGTH(36));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(36));
    }];
    
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = title.text;
    model1.bianString = [NSString stringWithFormat:@"一本好书"];
    model1.fount = 18;
    model1.color = RGB(255,201,73);
    
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = title.text;
    model2.bianString = [NSString stringWithFormat:@"深入了解"];
    model2.fount = 18;
    model2.color = RGB(255,201,73);
    NSArray * modelarray = @[model1,model2];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    title.attributedText = AttributedStr;
}

- (void)addArc {
    //中间镂空的矩形框
    
    //背景
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:[UIScreen mainScreen].bounds cornerRadius:0];
    //镂空
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, HEIGHT-TabBarHeight-_frames.size.height, _frames.size.width, _frames.size.height)];
    //    [circlePath stroke];
    //    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:myRect];
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
