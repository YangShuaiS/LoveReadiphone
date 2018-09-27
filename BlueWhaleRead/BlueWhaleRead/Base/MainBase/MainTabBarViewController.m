//
//  MainTabBarViewController.m
//  ZYlive
//
//  Created by 杨帅 on 2017/5/25.
//  Copyright © 2017年 杨帅. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "BaseNavigationViewController.h"
#import "ViewController.h"

#import "HomePageViewController.h"
#import "FoundViewController.h"
#import "BookCityViewController.h"
#import "MyViewController.h"
@interface MainTabBarViewController ()<UITabBarControllerDelegate>{
    NSInteger _currentIndex;
}

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addview];
}
- (void)addview{

    UITabBarItem *item1 = [[UITabBarItem alloc] init];
    item1.tag = 1;
    [item1 setTitle:@"首页"];
    [item1 setImage:[UIImage imageNamed:@"icon_首页_未选中"]];
    [item1 setSelectedImage:[[UIImage imageNamed:@"icon_首页_选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item1 setTitleTextAttributes:@{NSForegroundColorAttributeName: TabBarTitleColor,NSFontAttributeName:[UIFont systemFontOfSize:40]}
                         forState:UIControlStateSelected];

    UITabBarItem *item2 = [[UITabBarItem alloc] init];
    item2.tag = 2;
    [item2 setTitle:@"发现"];
    [item2 setImage:[UIImage imageNamed:@"icon_发现_未选中"]];
    [item2 setSelectedImage:[[UIImage imageNamed:@"icon_发现_选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item2 setTitleTextAttributes:@{NSForegroundColorAttributeName: TabBarTitleColor,NSFontAttributeName:[UIFont systemFontOfSize:40]}
                         forState:UIControlStateSelected];
    
    UITabBarItem *item3 = [[UITabBarItem alloc] init];
    item3.tag = 3;
    [item3 setTitle:@"书城"];
    [item3 setImage:[UIImage imageNamed:@"icon_书城_未选中"]];
    [item3 setSelectedImage:[[UIImage imageNamed:@"icon_书城_选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item3 setTitleTextAttributes:@{NSForegroundColorAttributeName: TabBarTitleColor,NSFontAttributeName:[UIFont systemFontOfSize:40]}
                         forState:UIControlStateSelected];
    
    
    UITabBarItem *item4 = [[UITabBarItem alloc] init];
    item4.tag = 4;
    [item4 setTitle:@"我的"];
    [item4 setImage:[UIImage imageNamed:@"icon_我的_未选中"]];
    [item4 setSelectedImage:[[UIImage imageNamed:@"icon_我的_选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item4 setTitleTextAttributes:@{NSForegroundColorAttributeName: TabBarTitleColor,NSFontAttributeName:[UIFont systemFontOfSize:40]}
                         forState:UIControlStateSelected];
//    [item4 setTitleTextAttributes:@{NSForegroundColorAttributeName:RGB(33, 33, 33),NSFontAttributeName:[UIFont systemFontOfSize:40]} forState:UIControlStateNormal];
    
    HomePageViewController * view1 = [[HomePageViewController alloc] init];
    BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:view1];
    homenav.tabBarItem =item1;
    
    FoundViewController * view2 = [[FoundViewController alloc] init];
    BaseNavigationViewController * homenav1 = [[BaseNavigationViewController alloc] initWithRootViewController:view2];
    homenav1.tabBarItem =item2;
    
    BookCityViewController * view3 = [[BookCityViewController  alloc] init];
    BaseNavigationViewController * homenav2 = [[BaseNavigationViewController alloc] initWithRootViewController:view3];
    homenav2.tabBarItem =item3;
    
    MyViewController * view4 = [[MyViewController alloc] init];
    BaseNavigationViewController * homenav4 = [[BaseNavigationViewController alloc] initWithRootViewController:view4];
    homenav4.tabBarItem =item4;
    
    self.viewControllers = @[homenav,homenav1,homenav2,homenav4];
    self.delegate = self;
    self.selectedIndex = 0;
//    self.tabBar.backgroundColor = [UIColor redColor];
//    self.selectedIndex = 0;
    
    
//    backView = [BaseView new];
//    backView.backgroundColor = MAINCOLOR;
//    [self.tabBar insertSubview:backView atIndex:0];
    [[UITabBar appearance] setBarTintColor:WhitColor];
 
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if ([item.title isEqualToString:@"发布"]) {
        
    }
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if (tabBarController.selectedIndex == 3) {
        
    }
    
    //点击tabBarItem动画
    if (self.selectedIndex != _currentIndex)[self tabBarButtonClick:[self getTabBarButton]];
    
    
}
- (UIControl *)getTabBarButton{
    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];
    
    /*
     "<_UITabBarBackgroundView: 0x7fddb21236e0; frame = (0 0; 375 49); autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7fddb21297d0>>",
     "<UITabBarButton: 0x7fddb23bb500; frame = (2 1; 90 48); opaque = NO; layer = <CALayer: 0x7fddb2130880>>",
     "<UITabBarButton: 0x7fddb217e1a0; frame = (96 1; 90 48); opaque = NO; layer = <CALayer: 0x7fddb217eec0>>",
     "<UITabBarButton: 0x7fddb2184700; frame = (190 1; 89 48); opaque = NO; layer = <CALayer: 0x7fddb2184e20>>",
     "<UITabBarButton: 0x7fddb21893c0; frame = (283 1; 90 48); opaque = NO; layer = <CALayer: 0x7fddb2189b60>>",
     "<UIImageView: 0x7fddb217ea70; frame = (0 -0.5; 375 0.5); autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7fddb219fa40>>"
     */
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [tabBarButtons addObject:tabBarButton];
        }
    }
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
    
    return tabBarButton;
}

- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    
    
    
    /*
     "<UITabBarSwappableImageView: 0x7fd7ebc52760; frame = (32 5.5; 25 25); opaque = NO; userInteractionEnabled = NO; tintColor = UIDeviceWhiteColorSpace 0.572549 1; layer = <CALayer: 0x7fd7ebc52940>>",
     "<UITabBarButtonLabel: 0x7fd7ebc4f360; frame = (29.5 35; 30 12); text = '\U8d2d\U7269\U8f66'; opaque = NO; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x7fd7ebc4e090>>" a
     */
    for (UIView *imageView in tabBarButton.subviews) {
//        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据需求自定义
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            //把动画添加上去就OK了
            [imageView.layer addAnimation:animation forKey:nil];
//        }
    }
//    for (UIControl *control in self.tabBar.subviews) {
//        NSLog(@"########3%@",control);
//    }
    _currentIndex = self.selectedIndex;
}

//#pragma mark - ADTabBarDelegate
//- (void)tabBarDidClickCenterButton:(XPFTabBar *)tabBar {
//    MJExtensionLog(@" 执行 delete 了, 还我辣条... 别跑!!! ");
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
