//
//  HuiBenViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HuiBenViewController.h"
#import "HuiBenView.h"
#import "AppDelegate.h"
@implementation HuiBenViewController{
    HuiBenView * view;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    view = [HuiBenView new];
    view.userInteractionEnabled = YES;
    WS(ws);
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    
    view.pngfile = _bookpngfile;
    view.pngarray = _itemarray;
    
    FLAnimatedImageView * image = [FLAnimatedImageView new];
    image.contentMode = UIViewContentModeScaleAspectFit;
    image.image = UIIMAGE(@"backhei");
    [self.view addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+(44-image.image.size.height)/2);
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(24));
    }];
    
    UIView * v = [UIView new];
    [self.view addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(ws.view);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(NavHeight);
    }];
    
    v.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fanhui)];
    [v addGestureRecognizer:tap];
    
}
- (void)fanhui{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.allowRotation = NO;
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    NSNumber *orientationTarget = [NSNumber numberWithInt:UIDeviceOrientationPortrait];
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    NSMutableArray * arr = [NSMutableArray array];
    for (int i = 1; i <= itemarray.count; i++) {
        for (NSString * str in itemarray) {
            NSArray * image = [BaseObject TiemArray:str String:@"."];
            NSString * strs = image[1];
            int b = [image[0] intValue];
            if (i == b) {
                [arr addObject:[NSString stringWithFormat:@"%d.%@",i,strs]];
                break;
            }
        }
    }
    _itemarray = arr;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.allowRotation = YES;
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
}

- (void)viewWillDisappear:(BOOL)animated{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.allowRotation = NO;
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    NSNumber *orientationTarget = [NSNumber numberWithInt:UIDeviceOrientationPortrait];
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
}


@end
