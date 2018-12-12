//
//  NewNavView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewNavView : BaseView
@property(nonatomic,assign)NavStyle nativeStyle;
- (instancetype)initWithLeftImage:(NSString *)image
                            Title:(NSString *)title
                       RightTitle:(NSString *)rightTitle
                      NativeStyle:(NavStyle)nativeStyle;
@end

NS_ASSUME_NONNULL_END
