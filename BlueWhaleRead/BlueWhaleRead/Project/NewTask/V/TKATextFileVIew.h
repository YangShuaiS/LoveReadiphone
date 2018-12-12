//
//  TKATextFileVIew.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKATextFileVIew : BaseView<UITextFieldDelegate>
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) BaseLabel *titlabel;

@end

NS_ASSUME_NONNULL_END
