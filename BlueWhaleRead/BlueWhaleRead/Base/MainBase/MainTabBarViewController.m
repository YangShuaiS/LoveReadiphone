//
//  MainTabBarViewController.m
//  ZYlive
//
//  Created by 杨帅 on 2017/5/25.
//  Copyright © 2017年 杨帅. All rights reserved.
//

#import "MainTabBarViewController.h"
#import <UIKit/UIKit.h>

#import "BaseNavigationViewController.h"
#import "ViewController.h"

#import "NewKnowledgeRootViewController.h"
#import "NewHomeViewController.h"
#import "NBookCityViewController.h"
#import "MMyViewController.h"

static CGFloat const CYLTabBarControllerHeight = 40.f;

@interface MainTabBarViewController ()<UITabBarControllerDelegate>{
    NSInteger _currentIndex;
}

@end

@implementation MainTabBarViewController
- (instancetype)init {
    if (!(self = [super init])) {
        return nil;
    }
    /**
     * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
     * 等效于在 `-tabBarItemsAttributesForController` 方法中不传 `CYLTabBarItemTitle` 字段。
     * 更推荐后一种做法。
     */
    UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
    UIOffset titlePositionAdjustment = UIOffsetMake(0, -3.5);
    CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                               tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                                                         imageInsets:imageInsets
                                                                             titlePositionAdjustment:titlePositionAdjustment
                                                                                             context:nil
                                             ];
    [self customizeTabBarAppearance:tabBarController];
    
    return (self = (MainTabBarViewController *)tabBarController);
}

- (NSArray *)viewControllers {
    NewHomeViewController *firstViewController = [[NewHomeViewController alloc] init];
    BaseNavigationViewController *firstNavigationController = [[BaseNavigationViewController alloc]
                                                   initWithRootViewController:firstViewController];
    
    NewKnowledgeRootViewController *secondViewController = [[NewKnowledgeRootViewController alloc] init];
    BaseNavigationViewController *secondNavigationController = [[BaseNavigationViewController alloc]
                                                    initWithRootViewController:secondViewController];
    
    NBookCityViewController *thirdViewController = [[NBookCityViewController alloc] init];
    BaseNavigationViewController *thirdNavigationController = [[BaseNavigationViewController alloc]
                                                   initWithRootViewController:thirdViewController];
    
    MMyViewController *fourthViewController = [[MMyViewController alloc] init];
    BaseNavigationViewController *fourthNavigationController = [[BaseNavigationViewController alloc]
                                                    initWithRootViewController:fourthViewController];
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController,
                                 fourthNavigationController
                                 ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    CGFloat firstXOffset = -12/2;
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"任务",
                                                 CYLTabBarItemImage : @"任务1",  /* NSString and UIImage are supported*/
                                                 CYLTabBarItemSelectedImage : @"任务",  /* NSString and UIImage are supported*/
                                                 CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(firstXOffset, -3.5)]
                                                 //第一位 右大，下大
                                                 };
    CGFloat secondXOffset = (-25+2)/2;
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"课堂",
                                                  CYLTabBarItemImage : @"课堂1",
                                                  CYLTabBarItemSelectedImage : @"课堂",
                                                  CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(secondXOffset, -3.5)]
                                                  };
    
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"书城",
                                                 CYLTabBarItemImage : @"书城1",
                                                 CYLTabBarItemSelectedImage : @"书城",
                                                 CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(-secondXOffset, -3.5)]
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"我的",
                                                  CYLTabBarItemImage : @"我的1",
                                                  CYLTabBarItemSelectedImage : @"我的",
                                                  CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(-firstXOffset, -3.5)]
                                                  };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    [self becomeFirstResponder];
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    // Customize UITabBar height
    // 自定义 TabBar 高度
    //        tabBarController.tabBarHeight = CYL_IS_IPHONE_X ? 65 : 40;
    [tabBarController rootWindow].backgroundColor = [UIColor whiteColor];
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = TabBarTitleColor;
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
//    [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor clearColor]];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    //        [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
    UITabBar *tabBarAppearance = [UITabBar appearance];
    
    //FIXED:  https://github.com/ChenYilong/CYLTabBarController/issues/312
    [UITabBar appearance].translucent = NO;
    //FIXED: https://github.com/ChenYilong/CYLTabBarController/issues/196
    NSString *tabBarBackgroundImageName = @"tabbarBg";
    UIImage *tabBarBackgroundImage = [UIImage imageNamed:tabBarBackgroundImageName];
    UIImage *scanedTabBarBackgroundImage = [[self class] scaleImage:tabBarBackgroundImage];
    [tabBarAppearance setBackgroundImage:scanedTabBarBackgroundImage];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // iOS10 后 需要使用 `-[CYLTabBarController hideTabBadgeBackgroundSeparator]` 见 AppDelegate 类中的演示;
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

- (void)updateTabBarCustomizationWhenTabBarItemWidthDidUpdate {
    void (^deviceOrientationDidChangeBlock)(NSNotification *) = ^(NSNotification *notification) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
            NSLog(@"Landscape Left or Right !");
        } else if (orientation == UIDeviceOrientationPortrait) {
            NSLog(@"Landscape portrait!");
        }
        [self customizeTabBarSelectionIndicatorImage];
    };
    [[NSNotificationCenter defaultCenter] addObserverForName:CYLTabBarItemWidthDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:deviceOrientationDidChangeBlock];
}

- (void)customizeTabBarSelectionIndicatorImage {
    ///Get initialized TabBar Height if exists, otherwise get Default TabBar Height.
    CGFloat tabBarHeight = CYLTabBarControllerHeight;
    CGSize selectionIndicatorImageSize = CGSizeMake(CYLTabBarItemWidth, tabBarHeight);
    //Get initialized TabBar if exists.
    UITabBar *tabBar = [self cyl_tabBarController].tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor whiteColor]
                             size:selectionIndicatorImageSize]];
}

+ (UIImage *)scaleImage:(UIImage *)image {
    CGFloat halfWidth = image.size.width/2;
    CGFloat halfHeight = image.size.height/2;
    UIImage *secondStrechImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(halfHeight, halfWidth, halfHeight, halfWidth) resizingMode:UIImageResizingModeStretch];
    return secondStrechImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}




//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self addview];
//}
//- (void)addview{
//
//    UITabBarItem *item1 = [[UITabBarItem alloc] init];
//    item1.tag = 1;
//    [item1 setTitle:@"首页"];
//    [item1 setImage:[UIImage imageNamed:@"icon_首页_未选中"]];
//    [item1 setSelectedImage:[[UIImage imageNamed:@"icon_首页_选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [item1 setTitleTextAttributes:@{NSForegroundColorAttributeName: TabBarTitleColor,NSFontAttributeName:[UIFont systemFontOfSize:40]}
//                         forState:UIControlStateSelected];
//
//    UITabBarItem *item2 = [[UITabBarItem alloc] init];
//    item2.tag = 2;
//    [item2 setTitle:@"知识网"];
//    [item2 setImage:[UIImage imageNamed:@"iocn_知识网_未选中"]];
//    [item2 setSelectedImage:[[UIImage imageNamed:@"iocn_知识网"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [item2 setTitleTextAttributes:@{NSForegroundColorAttributeName: TabBarTitleColor,NSFontAttributeName:[UIFont systemFontOfSize:40]}
//                         forState:UIControlStateSelected];
//
//    UITabBarItem *item3 = [[UITabBarItem alloc] init];
//    item3.tag = 3;
//    [item3 setTitle:@"书城"];
//    [item3 setImage:[UIImage imageNamed:@"icon_书城_未选中"]];
//    [item3 setSelectedImage:[[UIImage imageNamed:@"icon_书城_选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [item3 setTitleTextAttributes:@{NSForegroundColorAttributeName: TabBarTitleColor,NSFontAttributeName:[UIFont systemFontOfSize:40]}
//                         forState:UIControlStateSelected];
//
//
//    UITabBarItem *item4 = [[UITabBarItem alloc] init];
//    item4.tag = 4;
//    [item4 setTitle:@"我的"];
//    [item4 setImage:[UIImage imageNamed:@"icon_我的_未选中"]];
//    [item4 setSelectedImage:[[UIImage imageNamed:@"icon_我的_选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [item4 setTitleTextAttributes:@{NSForegroundColorAttributeName: TabBarTitleColor,NSFontAttributeName:[UIFont systemFontOfSize:40]}
//                         forState:UIControlStateSelected];
////    [item4 setTitleTextAttributes:@{NSForegroundColorAttributeName:RGB(33, 33, 33),NSFontAttributeName:[UIFont systemFontOfSize:40]} forState:UIControlStateNormal];
//
//    NewHomeViewController * view1 = [[NewHomeViewController alloc] init];
//    BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:view1];
//    homenav.tabBarItem =item1;
//
//    NewKnowledgeRootViewController * view2 = [[NewKnowledgeRootViewController alloc] init];
//    BaseNavigationViewController * homenav1 = [[BaseNavigationViewController alloc] initWithRootViewController:view2];
//    homenav1.tabBarItem =item2;
//
//    NBookCityViewController * view3 = [[NBookCityViewController  alloc] init];
//    BaseNavigationViewController * homenav2 = [[BaseNavigationViewController alloc] initWithRootViewController:view3];
//    homenav2.tabBarItem =item3;
//
//    MMyViewController * view4 = [[MMyViewController alloc] init];
//    BaseNavigationViewController * homenav4 = [[BaseNavigationViewController alloc] initWithRootViewController:view4];
//    homenav4.tabBarItem =item4;
//
//    self.viewControllers = @[homenav,homenav1,homenav2,homenav4];
//    self.delegate = self;
//    self.selectedIndex = 0;
////    self.tabBar.backgroundColor = [UIColor redColor];
////    self.selectedIndex = 0;
//
//
////    backView = [BaseView new];
////    backView.backgroundColor = MAINCOLOR;
////    [self.tabBar insertSubview:backView atIndex:0];
//    [[UITabBar appearance] setBarTintColor:WhitColor];
//
//}
//
//
//- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
//    if ([item.title isEqualToString:@"发布"]) {
//
//    }
//}
//- (void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
//}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
//    if (tabBarController.selectedIndex == 3) {
//
//    }
//
//    //点击tabBarItem动画
//    if (self.selectedIndex != _currentIndex)[self tabBarButtonClick:[self getTabBarButton]];
//
//
//}
//- (UIControl *)getTabBarButton{
//    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];
//
//    /*
//     "<_UITabBarBackgroundView: 0x7fddb21236e0; frame = (0 0; 375 49); autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7fddb21297d0>>",
//     "<UITabBarButton: 0x7fddb23bb500; frame = (2 1; 90 48); opaque = NO; layer = <CALayer: 0x7fddb2130880>>",
//     "<UITabBarButton: 0x7fddb217e1a0; frame = (96 1; 90 48); opaque = NO; layer = <CALayer: 0x7fddb217eec0>>",
//     "<UITabBarButton: 0x7fddb2184700; frame = (190 1; 89 48); opaque = NO; layer = <CALayer: 0x7fddb2184e20>>",
//     "<UITabBarButton: 0x7fddb21893c0; frame = (283 1; 90 48); opaque = NO; layer = <CALayer: 0x7fddb2189b60>>",
//     "<UIImageView: 0x7fddb217ea70; frame = (0 -0.5; 375 0.5); autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7fddb219fa40>>"
//     */
//    for (UIView *tabBarButton in self.tabBar.subviews) {
//        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
//            [tabBarButtons addObject:tabBarButton];
//        }
//    }
//    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
//
//    return tabBarButton;
//}
//
//- (void)tabBarButtonClick:(UIControl *)tabBarButton
//{
//
//
//
//    /*
//     "<UITabBarSwappableImageView: 0x7fd7ebc52760; frame = (32 5.5; 25 25); opaque = NO; userInteractionEnabled = NO; tintColor = UIDeviceWhiteColorSpace 0.572549 1; layer = <CALayer: 0x7fd7ebc52940>>",
//     "<UITabBarButtonLabel: 0x7fd7ebc4f360; frame = (29.5 35; 30 12); text = '\U8d2d\U7269\U8f66'; opaque = NO; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x7fd7ebc4e090>>" a
//     */
//    for (UIView *imageView in tabBarButton.subviews) {
////        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
//            //需要实现的帧动画,这里根据需求自定义
//            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//            animation.keyPath = @"transform.scale";
//            animation.values = @[@1.0,@1.1,@0.9,@1.0];
//            animation.duration = 0.3;
//            animation.calculationMode = kCAAnimationCubic;
//            //把动画添加上去就OK了
//            [imageView.layer addAnimation:animation forKey:nil];
////        }
//    }
////    for (UIControl *control in self.tabBar.subviews) {
////        NSLog(@"########3%@",control);
////    }
//    _currentIndex = self.selectedIndex;
//}
//
////#pragma mark - ADTabBarDelegate
////- (void)tabBarDidClickCenterButton:(XPFTabBar *)tabBar {
////    MJExtensionLog(@" 执行 delete 了, 还我辣条... 别跑!!! ");
////}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//// "tabBar": {
////   "color": "#6e6d6b", //未选择时 底部导航文字的颜色
////   "selectedColor": "#52c7c6", //选择时 底部导航文字的颜色
////   // "borderStyle": "black" ,//底部导航边框的样色（注意 这里如果没有写入样式 会导致 导航框上边框会出现默认的浅灰色线条）
////   "backgroundColor": "#fff",//底部导航栏颜色
////   // "box-shadow":"0 0 6px 0",
////   "list": [{
////     "pagePath": "pages/index/index",
////     "iconPath": "images/tabBar/icon_首页_未选中.png",
////     "selectedIconPath": "images/tabBar/icon_首页_选中.png",
////     "text": "首页"
////   },{
////     "pagePath": "pages/index/index",
////     "iconPath": "images/tabBar/icon_发现_未选中.png",
////     "selectedIconPath": "images/tabBar/icon_发现_选中.png",
////     "text": "发现"
////   },{
////     "pagePath": "pages/index/index",
////     "iconPath": "images/tabBar/icon_书城_未选中.png",
////     "selectedIconPath": "images/tabBar/icon_书城_选中.png",
////     "text": "书城"
////   },{
////     "pagePath": "pages/index/index",
////     "iconPath": "images/tabBar/icon_我的_未选中.png",
////     "selectedIconPath": "images/tabBar/icon_我的_选中.png",
////     "text": "我的"
////   }
////   ]
//// },
@end
