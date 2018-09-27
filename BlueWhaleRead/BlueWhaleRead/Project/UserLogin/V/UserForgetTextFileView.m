//
//  UserForgetTextFileView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserForgetTextFileView.h"

@implementation UserForgetTextFileView

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
    self.textField = [UITextField new];
    _textField.delegate = self;
    _textField.borderStyle = UITextBorderStyleNone;
    _textField.textColor = RGB(4,51,50);
    [_textField addTarget:self action:@selector(phoneNum_tfChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(10));
        make.top.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
        make.left.mas_equalTo(ws);
    }];
}
- (void)setTitle:(NSString *)title{
    _title = title;
    UIColor * color = RGB(137,159,159);
    _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName: color}];
    
}
- (void)phoneNum_tfChange:(UITextField *)textField
{
    self.block(textField.text);
}
- (void)returnKeyboard{
    [_textField resignFirstResponder];
}
- (void)setKeyboardType:(UIKeyboardType)keyboardType{
    _keyboardType = keyboardType;
    _textField.keyboardType = keyboardType;

}
- (void)setSecureTextEntry:(BOOL)secureTextEntry{
    _secureTextEntry = secureTextEntry;
    _textField.secureTextEntry = secureTextEntry;

}
@end
