//
//  UserLoginClickView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef NS_ENUM(NSInteger, UserLoginClickStyle) {
    UserLoginClickStyleNoml = 0,//
    UserLoginClickStyleImgAndTitle = 1,
};
typedef void(^ClickNolock)(void);
@interface UserLoginClickView : BaseView
- (instancetype)initWithImage:(NSString *)image
                         Text:(NSString *)text
                        Style:(UserLoginClickStyle)userstyle;

@property(nonatomic,copy)ClickNolock block;
- (void)whitherBacler;
@end
