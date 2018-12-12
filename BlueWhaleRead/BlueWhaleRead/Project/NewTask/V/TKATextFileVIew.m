//
//  TKATextFileVIew.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKATextFileVIew.h"

@implementation TKATextFileVIew
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
    
    UIView * backview = [UIView new];
    backview.backgroundColor = RGB(255,251,232);
    backview.layer.cornerRadius = LENGTH(15);
    backview.layer.masksToBounds = YES;
    backview.layer.borderWidth = LENGTH(5);
    backview.layer.borderColor = RGB(255,214,98).CGColor;
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(5), LENGTH(5), LENGTH(5), LENGTH(5)));
    }];
    
    _titlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(241,150,52) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@""];
    [backview addSubview:_titlabel];
    [_titlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview.mas_left).with.offset(LENGTH(15));
        make.top.and.bottom.mas_equalTo(backview);
        make.width.mas_equalTo(LENGTH(42));
    }];
    
    self.textField = [UITextField new];
    _textField.delegate = self;
    _textField.borderStyle = UITextBorderStyleNone;
    [self addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.titlabel.mas_right).with.offset(LENGTH(18));
        make.top.and.bottom.mas_equalTo(backview);
        make.right.mas_equalTo(backview).with.offset(-LENGTH(15));
        make.height.mas_equalTo(LENGTH(58));
    }];
}
@end
