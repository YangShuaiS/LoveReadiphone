//
//  NBCmenuView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCmenuView.h"

@implementation NBCmenuView{
    FLAnimatedImageView * bakimage;
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
    _label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(98, 98, 98) LabelFont:TextFontCu(22) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(22));
        make.top.and.bottom.mas_equalTo(ws);
    }];
}
- (void)setStyles:(NBCmenuViewStyle)styles{
    _styles = styles;
    switch (styles) {
        case NBCmenuViewStyleimage:
            [self NBCmenuViewStyleimage];
            break;
            
        default:
            break;
    }
}
- (void)NBCmenuViewStyleimage{
    WS(ws);
    bakimage = [FLAnimatedImageView new];
    bakimage.image = UIIMAGE(@"箭头");
    [self addSubview:bakimage];
    [bakimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(22));
        make.centerY.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(20), LENGTH(20)));
    }];
    
    UIView * tab = [UIView new];
    [self addSubview:tab];
    [tab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.top.and.bottom.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(100));
    }];
    tab.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [tab addGestureRecognizer:tap];
    
}
- (void)click{
    self.block();
}
@end
