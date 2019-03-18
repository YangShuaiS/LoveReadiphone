//
//  ClassroomTextFileView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/8.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ClassroomTextFileView.h"
#import <MOFSPickerManager.h>

@implementation ClassroomTextFileView{
    BaseLabel * titleLabel;
    UIView * xian;
    UIImageView * imageview;
    ClassroomTextFileViewStyle styles;
}

- (instancetype)initWithTitle:(NSString *)title
                     Subtitle:(NSString *)subtitle
                   RightImage:(UIImage *)rightimage
                   ClassStyle:(ClassroomTextFileViewStyle)style{
    self = [super init];
    if (self) {
        styles = style;
        switch (style) {
            case ClassroomTextFileViewClick:
                [self ClassroomTextFileViewClickWithTitle:title Subtitle:subtitle RightImage:rightimage ClassStyle:ClassroomTextFileViewClick];
                break;
            case ClassroomTextFileViewClickGeneral:
                [self ClassroomTextFileViewClickGeneralWithTitle:title Subtitle:subtitle RightImage:rightimage ClassStyle:ClassroomTextFileViewClickGeneral];

                break;
            case ClassroomTextFileViewPassWord:
                [self ClassroomTextFileViewPassWordWithTitle:title Subtitle:subtitle RightImage:rightimage ClassStyle:ClassroomTextFileViewPassWord];

                break;
            default:
                break;
        }
    }
    return self;
}
- (void)ClassroomTextFileViewClickWithTitle:(NSString *)title
                                   Subtitle:(NSString *)subtitle
                                 RightImage:(UIImage *)rightimage
                                 ClassStyle:(ClassroomTextFileViewStyle)style{
    [self addTitle:title];
    [self addTextFile:subtitle];
    [self addXian];
    [self addRightImage:rightimage];
    [self GeneralLayout];
    WS(ws);
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws.textField);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(4));
    }];
    _textField.userInteractionEnabled = NO;
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *backtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xuanzekuang)];
    //将手势添加到需要相应的view中去
    [self addGestureRecognizer:backtap];
    
}
- (void)ClassroomTextFileViewClickGeneralWithTitle:(NSString *)title
                                   Subtitle:(NSString *)subtitle
                                 RightImage:(UIImage *)rightimage
                                 ClassStyle:(ClassroomTextFileViewStyle)style{
    [self addTitle:title];
    [self addTextFile:subtitle];
    [self addXian];
    [self GeneralLayout];

}
- (void)ClassroomTextFileViewPassWordWithTitle:(NSString *)title
                                   Subtitle:(NSString *)subtitle
                                 RightImage:(UIImage *)rightimage
                                 ClassStyle:(ClassroomTextFileViewStyle)style{
    [self addTitle:title];
    [self addTextFile:subtitle];
    [self addXian];
    [self addRightImage:rightimage];
    [self GeneralLayout];
    WS(ws);
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws.textField);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(4));
    }];
    
    imageview.userInteractionEnabled = YES;
    UITapGestureRecognizer *backtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mimaxianshi)];
    //将手势添加到需要相应的view中去
    [imageview addGestureRecognizer:backtap];

    _textField.keyboardType = UIKeyboardTypeAlphabet;
    _textField.secureTextEntry = YES;
}

- (void)addTitle:(NSString*)title{
    titleLabel = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:title];
    [self addSubview:titleLabel];
}

- (void)addTextFile:(NSString *)subtitle{
    self.textField = [UITextField new];
    _textField.delegate = self;
    _textField.borderStyle = UITextBorderStyleNone;
    [self addSubview:_textField];
    UIColor * color = RGB(175,175,175);
    _textField.textColor = RGB(43,67,66);
    _textField.font = TextFont(14);
    _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:subtitle attributes:@{NSForegroundColorAttributeName: color,NSFontAttributeName:TextFont(14)}];
}

- (void)addXian{
    xian = [UIView new];
    xian.backgroundColor = RGB(230, 230, 230);
    [self addSubview:xian];
}
- (void)addRightImage:(UIImage *)rightimage{
    imageview = [UIImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.image = rightimage;
    [self addSubview:imageview];
}
- (void)GeneralLayout{
    WS(ws);
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
    }];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->titleLabel.mas_bottom).with.offset(LENGTH(14));
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
    }];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.textField.mas_bottom).with.offset(LENGTH(9));
        make.left.and.right.and.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(1);
    }];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (styles == ClassroomTextFileViewClick) {
        return NO;

    }else{
        return YES;
    }
}

- (void)xuanzekuang{
    imageview.image = UIIMAGE(@"三角形关闭");

    [[MOFSPickerManager shareManger] showPickerViewWithDataArray:@[@"山西省临汾市三维小学",@"山西省临汾市义堂小学",@"山西省临汾市邓庄小学",@"山西省临汾市北续小学",@"山西省临汾市五一路学校",@"山西省临汾市八一学校",@"山西省临汾市临钢小学",@"山西省临汾市育红小学",@"山西省临汾市实验小学",@"山西省临汾市第三小学"] tag:1 title:@"选择学校" cancelTitle:@"取消" commitTitle:@"确定" commitBlock:^(NSString *string) {
        [self genggauntextfile:string];
    } cancelBlock:^{
        self->imageview.image = UIIMAGE(@"三角形-展开");

    }];
}
-(void)genggauntextfile:(NSString*)str{
    _textField.text = str;
    imageview.image = UIIMAGE(@"三角形-展开");

}

- (void)mimaxianshi{
    if (_textField.secureTextEntry == YES) {
        _textField.secureTextEntry = NO;
        imageview.image = UIIMAGE(@"眼睛-睁开");
    }else{
        _textField.secureTextEntry = YES;
        imageview.image = UIIMAGE(@"眼睛-关闭");
    }
}
@end
