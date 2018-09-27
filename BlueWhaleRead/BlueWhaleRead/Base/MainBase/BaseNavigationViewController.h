//
//  BaseNavigationViewController.h
//  ZYlive
//
//  Created by 杨帅 on 2017/5/25.
//  Copyright © 2017年 杨帅. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseNavigationViewController : UINavigationController

typedef NS_ENUM(NSInteger, NavigationBarStyle) {
    NavigationBarStyle1 = 1,
    NavigationBarStyle2 = 2,
    NavigationBarStyle3 = 3,
    NavigationBarStyle4 = 4
};
@property (nonatomic,assign)  NavigationBarStyle NavigationStyle;

@end
