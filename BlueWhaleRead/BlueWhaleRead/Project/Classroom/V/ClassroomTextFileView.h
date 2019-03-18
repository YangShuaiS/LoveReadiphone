//
//  ClassroomTextFileView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/8.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, ClassroomTextFileViewStyle) {
    ClassroomTextFileViewClick = 0,//点击
    ClassroomTextFileViewClickGeneral = 1,//通用
    ClassroomTextFileViewPassWord = 2,//密码
};
@interface ClassroomTextFileView : BaseView<UITextFieldDelegate>
- (instancetype)initWithTitle:(NSString *)title
                     Subtitle:(NSString *)subtitle
                   RightImage:(UIImage *)rightimage
                   ClassStyle:(ClassroomTextFileViewStyle)style;
@property (strong, nonatomic) UITextField *textField;

@end

NS_ASSUME_NONNULL_END
