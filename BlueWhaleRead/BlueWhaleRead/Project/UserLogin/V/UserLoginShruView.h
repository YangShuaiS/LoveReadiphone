//
//  UserLoginShruView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface UserLoginShruView : BaseView<UITextFieldDelegate>
@property (strong, nonatomic) UITextField *textField;
@property (copy, nonatomic) NSString * title;
@property (strong, nonatomic) UIImage * image;
- (void)returnKeyboard;
@end
