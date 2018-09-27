//
//  BaseNavigationViewController.m
//  ZYlive
//
//  Created by 杨帅 on 2017/5/25.
//  Copyright © 2017年 杨帅. All rights reserved.
//

#import "BaseNavigationViewController.h"
@interface BaseNavigationViewController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>{
    NSInteger inter;
    NSString * VC;
}
@property (nonatomic, assign) CGFloat startX;

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置navigationbar的半透明
    [self.navigationBar setTranslucent:NO];
    self.navigationBar.hidden = YES;
//    self.navigationBar.barTintColor = RGB(0x26, 0x60, 0xad);
    UIView *statusBar = [[UIApplication sharedApplication]  valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
//        statusBar.backgroundColor = RGB(0x33, 0x33, 0x33);
    }


}

- (void)setNavigationStyle:(NavigationBarStyle)NavigationStyle{
    switch (NavigationStyle) {
        case NavigationBarStyle1:
            [self NavigationBarStyle1];
            break;
        case NavigationBarStyle2:
            [self NavigationBarStyle2];
            break;
        case NavigationBarStyle3:
            [self NavigationBarStyle3];
            break;
        default:
            break;
    }
}
-(void)NavigationBarStyle1{
    self.navigationBar.barTintColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
    self.navigationBar.barStyle = UIBarStyleBlack;

}
-(void)NavigationBarStyle2{
    self.navigationBar.barTintColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
    self.navigationBar.barStyle = UIBarStyleBlack;

}
-(void)NavigationBarStyle3{
    self.navigationBar.barTintColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
    self.navigationBar.barStyle = UIBarStyleBlack;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    if (WIDTH < HEIGHT) {
        [super pushViewController:viewController animated:YES];
    }
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    VC = [NSString stringWithFormat:@"%@",self.visibleViewController.class];
    //|| [VC isEqualToString:@"bfViewController"]
    // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if (self.childViewControllers.count == 1) {
        // 表示用户在根控制器界面，就不需要触发滑动手势，
        return NO;
    }
    inter = self.childViewControllers.count;
    
    if (WIDTH < HEIGHT) {
        return YES;
    }else{
        return NO;
    }

}
-(BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch*)touch {
//    if([touch.view isKindOfClass:[XJGestureButton class]]||[touch.view isKindOfClass:[NoHuaDong class]])
//        return NO;
//    else
        return YES;
}
- (void)handleNavigationTransition:(UIPanGestureRecognizer *)panGesture{
    //调用系统手势绑定的方法
    [self.interactivePopGestureRecognizer.delegate performSelector:@selector(handleNavigationTransition:) withObject:panGesture];
}

@end
