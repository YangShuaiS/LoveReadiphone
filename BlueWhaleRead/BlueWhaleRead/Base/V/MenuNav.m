//
//  MenuNav.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/16.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MenuNav.h"

@implementation MenuNav{
    BaseLabel * Title;
}

- (void)setMenuNavStyle:(MenuNavStyle)menuNavStyle{
    _menuNavStyle = menuNavStyle;
    switch (menuNavStyle) {
        case MenuNavStyleTitle:
            [self title];
            break;
        case MenuNavStyleTitleAndMore:
            
            break;
        default:
            break;
    }
}
- (void)title{
    BaseView * xianView = [BaseView new];
    xianView.backgroundColor = RANDOMCOLOR;
    [self addSubview:xianView];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font20) TextAlignment:NSTextAlignmentLeft Text:_titles];
    [self addSubview:Title];
    
    WS(ws);
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(32));
        make.left.equalTo(ws).with.offset(LENGTH(26));
        make.width.mas_equalTo(2);
        make.height.mas_equalTo(17);
        make.bottom.equalTo(ws).with.offset(0);

    }];
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(xianView.mas_left).with.offset(LENGTH(10));
        make.centerY.mas_equalTo(xianView.mas_centerY);
    }];
}
@end
