//
//  BaseViewController.m
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
@interface BaseViewController ()<UITabBarControllerDelegate>{
    NSInteger _currentIndex;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.delegate = self;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if ([item.title isEqualToString:@"发布"]) {
        
    }
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if (self.tabBarController.selectedIndex != _currentIndex)[self tabBarButtonClick:[self getTabBarButton]];

    [self RefreshTheView];
}
- (void)RefreshTheView{
    
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
    for (UIView *tabBarButton in self.tabBarController.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [tabBarButtons addObject:tabBarButton];
        }
    }
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.tabBarController.selectedIndex];
    
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
            animation.values = @[@1.0,@1.2,@0.8,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            //把动画添加上去就OK了
            [imageView.layer addAnimation:animation forKey:nil];
//        }
    }
    
    _currentIndex = self.tabBarController.selectedIndex;
}


- (void)AddNavtion{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)QRCodeScanVC:(UIViewController *)scanVC {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        switch (status) {
            case AVAuthorizationStatusNotDetermined: {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if (granted) {
                        dispatch_sync(dispatch_get_main_queue(), ^{
                            //                            if ([scanVC.class isEqual:UIImagePickerController]) {
                            //
                            //                            }
                            if ([scanVC.class isEqual:UIImagePickerController.class]) {
                                [self presentViewController:scanVC animated:YES completion:nil];
                                
                            }else{
                                [self.navigationController pushViewController:scanVC animated:YES];
                            }                        });
//                        MJExtensionLog(@"用户第一次同意了访问相机权限 - - %@", [NSThread currentThread]);
                    } else {
//                        MJExtensionLog(@"用户第一次拒绝了访问相机权限 - - %@", [NSThread currentThread]);
                    }
                }];
                break;
            }
            case AVAuthorizationStatusAuthorized: {
                if ([scanVC.class isEqual:UIImagePickerController.class]) {
                    [self presentViewController:scanVC animated:YES completion:nil];
                }else{
                    [self.navigationController pushViewController:scanVC animated:YES];
                }
                break;
            }
            case AVAuthorizationStatusDenied: {
                UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请去-> [设置 - 隐私 - 相机 - SGQRCodeExample] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                
                [alertC addAction:alertA];
                [self presentViewController:alertC animated:YES completion:nil];
                break;
            }
            case AVAuthorizationStatusRestricted: {
//                MJExtensionLog(@"因为系统原因, 无法访问相册");
                break;
            }
                
            default:
                break;
        }
        return;
    }
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertC addAction:alertA];
    [self presentViewController:alertC animated:YES completion:nil];
}
@end
