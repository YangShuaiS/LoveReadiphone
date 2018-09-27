//
//  UserForgetTextFileView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^BackTextFileText)(NSString * text);

@interface UserForgetTextFileView : BaseView<UITextFieldDelegate>
@property (strong, nonatomic) UITextField *textField;
@property (copy, nonatomic) NSString * title;
@property(nonatomic) UIKeyboardType keyboardType;
@property(nonatomic,getter=isSecureTextEntry) BOOL secureTextEntry;       // default is NO
@property(nonatomic,strong)BackTextFileText block;

- (void)returnKeyboard;
@end
