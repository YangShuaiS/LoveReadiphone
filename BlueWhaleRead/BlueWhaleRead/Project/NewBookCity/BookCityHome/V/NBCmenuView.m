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
    
    UIView * xian = [UIView new];
    xian.backgroundColor = RGB(91,199,198);
    xian.layer.masksToBounds = YES;
    xian.layer.cornerRadius = LENGTH(1);
    [self addSubview:xian];

    
    _label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(31, 31, 31) LabelFont:TextFontCu(20) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:_label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(xian.mas_right).with.offset(LENGTH(15));
        make.top.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(15));
    }];
    
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(18));
        make.centerY.mas_equalTo(ws.label);
        make.height.mas_equalTo(LENGTH(16));
        make.width.mas_equalTo(LENGTH(2));
    }];
}
- (void)setStyles:(NBCmenuViewStyle)styles{
    _styles = styles;
    switch (styles) {
        case NBCmenuViewStyleimage:
            [self NBCmenuViewStyleimage];
            break;
        case NBCmenuViewStyleRefinish:
            [self NBCmenuViewStyleRefinish];
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
        make.centerY.mas_equalTo(ws.label);
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

- (void)NBCmenuViewStyleRefinish{
    WS(ws);
    UIView * backview = [UIView new];
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(ws);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(22));
    }];
    
    BaseLabel * label = [[BaseLabel alloc] initWithTxteColor:RGB(150, 150, 150) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"换一换"];
    [backview addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview);
        make.centerY.mas_equalTo(ws.label);
    }];
    
    bakimage = [FLAnimatedImageView new];
    bakimage.image = UIIMAGE(@"换一换-图标");
    [backview addSubview:bakimage];
    [bakimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(backview);
        make.left.mas_equalTo(label.mas_right).with.offset(LENGTH(4));
        make.centerY.mas_equalTo(ws.label);
        make.size.mas_equalTo(CGSizeMake(LENGTH(14), LENGTH(11)));
    }];
    
    backview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [backview addGestureRecognizer:tap];
    
}
@end
