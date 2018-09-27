//
//  UserLoginShruView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserLoginShruView.h"

@implementation UserLoginShruView

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
    [_textField addTarget:self action:@selector(phoneNum_tfChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setTitle:(NSString *)title{
    _title = title;
    UIColor * color = RGB(136,134,134);
    _textField.textColor = RGB(4,51,50);
    _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName: color}];
    
}

- (void)setImage:(UIImage *)image{
    _image = image;

    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(LENGTH(20), LENGTH(18), LENGTH(20+16), LENGTH(18))];
    img.image = image;
    img.contentMode = UIViewContentModeScaleAspectFit;
    _textField.leftView = img;
    _textField.leftViewMode = UITextFieldViewModeAlways;
}

- (void)phoneNum_tfChange:(UITextField *)textField
{
    
}
- (void)returnKeyboard{
    [_textField resignFirstResponder];
}
@end
