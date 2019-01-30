//
//  MBProgressHUDYS.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/3.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "MBProgressHUDYS.h"
static MBProgressHUDYS * mb = nil;

@implementation MBProgressHUDYS

+ (MBProgressHUDYS *)SharedMBProgressHUDYS{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        mb = [[MBProgressHUDYS alloc] init];
        mb.mode = MBProgressHUDModeIndeterminate;
        mb.removeFromSuperViewOnHide = NO;
        [mb showAnimated:YES];

    });
    return mb;
}
- (void)addview:(UIView *)view{
    [view addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(view);
    }];
}
- (void)shoumessage:(NSString *)message{
    mb.label.text = message;
    [mb showAnimated:YES];
//    [mb hideAnimated:YES afterDelay:1];
}
@end
  
