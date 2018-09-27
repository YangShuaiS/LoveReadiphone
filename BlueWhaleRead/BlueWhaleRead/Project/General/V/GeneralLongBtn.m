//
//  GeneralLongBtn.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GeneralLongBtn.h"

@implementation GeneralLongBtn{
    BaseLabel * label;
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
    WS(ws);
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.masksToBounds = YES;
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@""];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.layer.cornerRadius = self.frame.size.height/2;
}
- (void)setBackcolors:(UIColor *)backcolors{
    _backcolors = backcolors;
    label.backgroundColor = backcolors;

}
- (void)setTextcolor:(UIColor *)textcolor{
    _textcolor = textcolor;
    label.textColor = textcolor;
}
- (void)setText:(NSString *)text{
    _text = text;
    label.text = text;
}
- (void)setBorderscolor:(UIColor *)borderscolor{
    _borderscolor = borderscolor;
    self.layer.borderColor = borderscolor.CGColor;

}
@end
