//
//  MainTabBarViewController.h
//  ZYlive
//
//  Created by 杨帅 on 2017/5/25.
//  Copyright © 2017年 杨帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#if __has_include(<CYLTabBarController/CYLTabBarController.h>)
#import <CYLTabBarController/CYLTabBarController.h>
#else
#import "CYLTabBarController.h"
#endif
@interface MainTabBarViewController : CYLTabBarController

@end
