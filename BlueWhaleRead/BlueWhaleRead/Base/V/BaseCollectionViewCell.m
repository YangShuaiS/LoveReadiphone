//
//  BaseCollectionViewCell.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "BaseNavigationViewController.h"
#import "UserLoginViewController.h"
@implementation BaseCollectionViewCell
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController
                                          class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
- (void)UpDengLu{
    BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:[UserLoginViewController new]];
    [[self viewController] presentViewController:homenav animated:YES completion:^{
        
    }];
}
@end
