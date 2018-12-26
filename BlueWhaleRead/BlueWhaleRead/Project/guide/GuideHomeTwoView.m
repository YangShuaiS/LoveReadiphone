//
//  GuideHomeTwoView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GuideHomeTwoView.h"

@implementation GuideHomeTwoView

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
        make.bottom.mas_equalTo(ws).with.offset(-TabBarHeight-(HEIGHT-self->_frames.origin.y-TabBarHeight)-LENGTH(2));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(76));
        make.width.mas_equalTo(LENGTH(55));
        make.height.mas_equalTo(LENGTH(78));
    }];
    
    UIImageView * zdl = [UIImageView new];
    zdl.contentMode = UIViewContentModeScaleAspectFit;
    zdl.image = UIIMAGE(@"知道了");
    [self addSubview:zdl];
    [zdl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xian);
        make.right.mas_equalTo(xian.mas_left).with.offset(-LENGTH(74));
        make.width.mas_equalTo(LENGTH(84));
        make.height.mas_equalTo(LENGTH(32));
    }];
    zdl.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backview)];
    //将手势添加到需要相应的view中去
    [zdl addGestureRecognizer:tapviewtap];
    
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"这里是任务模块，还未领取任务时可以在这里点击领取任务，领取任务后你的任务进度信息会显示在这里～"];
    title.numberOfLines = 3;
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(xian.mas_top).with.offset(LENGTH(1));
        make.left.mas_equalTo(ws).with.offset(LENGTH(48));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(51));
    }];
    
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = title.text;
    model1.bianString = [NSString stringWithFormat:@"点击领取任务"];
    model1.fount = 18;
    model1.color = RGB(255,201,73);
    
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = title.text;
    model2.bianString = [NSString stringWithFormat:@"进度信息"];
    model2.fount = 18;
    model2.color = RGB(255,201,73);
    
    NSArray * modelarray = @[model1,model2];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    title.attributedText = AttributedStr;
}
- (void)backview{
    [self removeFromSuperview];
}
- (void)addArc {
    //中间镂空的矩形框
//    CGRect myRect =_frames;
    
    //背景
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:[UIScreen mainScreen].bounds cornerRadius:0];
    //镂空
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRect:CGRectMake(_frames.origin.x, _frames.origin.y, _frames.size.width, HEIGHT-_frames.origin.y-TabBarHeight)];
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
