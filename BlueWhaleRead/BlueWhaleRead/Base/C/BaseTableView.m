//
//  BaseTableView.m
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

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


@end
