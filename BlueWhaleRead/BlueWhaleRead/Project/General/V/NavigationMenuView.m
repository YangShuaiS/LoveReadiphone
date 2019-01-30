//
//  NavigationMenuView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NavigationMenuView.h"

@implementation NavigationMenuView{
    BaseLabel * Title;
    BaseLabel * huanyihuan;
    BaseButton * huanyibibutton;
    FLAnimatedImageView * shuaxin;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}

- (void)addView{
    WS(ws);
    BaseView * xianView = [BaseView new];
    xianView.backgroundColor = RGB(91,199,198);
    [self addSubview:xianView];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(31, 31, 31) LabelFont:TextFontCu(20) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:Title];
    
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(ws).with.offset(LENGTH(16));
        make.left.equalTo(ws).with.offset(LENGTH(18));
        make.centerY.mas_equalTo(self->Title);
        make.width.mas_equalTo(2);
        make.height.mas_equalTo(16);
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(xianView.mas_left).with.offset(LENGTH(15));
//        make.centerY.mas_equalTo(xianView.mas_centerY);
        make.top.equalTo(ws);
        make.bottom.equalTo(ws).with.offset(-LENGTH(18));
    }];
}

- (void)setStyle:(NavMenuStyle)style{
    switch (style) {
        case NavMenuStyleAll:
            [self addRightlabel];
            break;
        case NavMenuStyleMore:
            [self addRightlabel];
            [self addRightImage];
            break;
        case NavMenuStyleGeneral:
            
            break;
        default:
            break;
    }
}
- (void)addRightlabel{
    WS(ws);
        huanyihuan = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(31, 31, 31) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
        huanyihuan.userInteractionEnabled = YES;
        [self addSubview:huanyihuan];
        huanyibibutton = [BaseButton buttonWithType:UIButtonTypeCustom];
        [huanyibibutton addTarget:self action:@selector(chankanquanbu) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:huanyibibutton];
    
    
        [huanyihuan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self->Title.mas_centerY);
            make.right.equalTo(ws).with.offset(-LENGTH(15));
        }];
    
        [huanyibibutton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.left.equalTo(self->huanyihuan.mas_left).with.offset(0);
            make.bottom.equalTo(ws).with.offset(0);
        }];
}
- (void)addRightImage{
    shuaxin = [FLAnimatedImageView new];
    shuaxin.image = UIIMAGE(@"icon_刷新");
    [self addSubview:shuaxin];
    [shuaxin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->Title.mas_centerY);
        make.right.equalTo(self->huanyihuan.mas_left).with.offset(-LENGTH(7.5));
        make.height.mas_equalTo(LENGTH(12));
        make.width.mas_equalTo(LENGTH(12));
    }];
}
- (void)chankanquanbu{
    self.block();
}
- (void)setRightTitle:(NSString *)rightTitle{
    huanyihuan.text = rightTitle;
}
- (void)setLeftTitle:(NSString *)leftTitle{
    _leftTitle = leftTitle;
    Title.text = leftTitle;
}

- (void)remohyh{
    huanyihuan.hidden = YES;
    huanyibibutton.hidden = YES;
    shuaxin.hidden = YES;
}
@end
