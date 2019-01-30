//
//  MBProgressHUDYS.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/3.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUDYS : MBProgressHUD
+ (MBProgressHUDYS *)SharedMBProgressHUDYS;
- (void)addview:(UIView *)view;
- (void)shoumessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
