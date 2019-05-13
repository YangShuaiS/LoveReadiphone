//
//  YSGmBouncedView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/23.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface YSGmBouncedView : BaseView
- (instancetype)initWithMessage:(NSString *)message;
- (instancetype)initWithMessage:(NSString *)message
                      ImageView:(NSString *)image;
- (void)AddWindow;
- (void)AddWindowRemo:(BOOL)remo;
@end

NS_ASSUME_NONNULL_END