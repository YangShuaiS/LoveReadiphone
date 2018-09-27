





//
//  ShiZiOrShiCIJieGuoViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ShiZiOrShiCIJieGuoViewController.h"

#import "ShiZiJGTopView.h"
#import "ShiZiJGDownView.h"

#import "HomePageViewController.h"
@interface ShiZiOrShiCIJieGuoViewController ()<UIScrollViewDelegate>

@end

@implementation ShiZiOrShiCIJieGuoViewController{
    UIScrollView * scrollView;
    FLAnimatedImageView * backImageView;
    ShiZiJGTopView * topView;
    BaseLabel * CenterLabel;//中间字
    ShiZiJGDownView * downView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);

    backImageView = [FLAnimatedImageView new];
    backImageView.image = UIIMAGE(ZHANWEITU);
    [self.view addSubview:backImageView];
    
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    if ([IOS_X integerValue]>=11.0) {
//        scrollView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    }
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    FLAnimatedImageView * backView = [FLAnimatedImageView new];
    backView.image = UIIMAGE(@"fanhui");
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view.mas_top).with.offset(22);
        make.left.mas_equalTo(ws.view.mas_left).with.offset(27);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    BaseButton * LeftBigButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [LeftBigButton addTarget:self action:@selector(left) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:LeftBigButton];
    
    [LeftBigButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.top.mas_equalTo(ws.view.mas_top).with.offset(20);
        make.height.mas_equalTo(@44);
        make.width.mas_equalTo(@75);
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"检测结果"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.centerY.mas_equalTo(backView.mas_centerY);
    }];
    
    topView = [ShiZiJGTopView new];
    topView.layer.masksToBounds = YES;
    topView.layer.cornerRadius = LENGTH(20);
    [scrollView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(LENGTH(656));
        make.height.mas_equalTo(LENGTH(200));
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(self->scrollView.mas_top).with.offset(LENGTH(80));
    }];
    
    CenterLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(25) TextAlignment:NSTextAlignmentCenter Text:@"在同级的同学当中属于中等偏下水平，不要灰心\n通过阅读书籍来提高你的识字量吧！"];
    CenterLabel.numberOfLines = 2;
    [scrollView addSubview:CenterLabel];
    [CenterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(self->topView.mas_bottom).with.offset(LENGTH(26));
    }];
    
    downView = [ShiZiJGDownView new];
    [scrollView addSubview:downView];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->CenterLabel.mas_bottom).with.offset(LENGTH(30));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(54));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(54));
        make.bottom.mas_equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(50));
    }];
    
    NSMutableArray * itemarray = [NSMutableArray array];
    for (int i =0 ; i < 10; i++) {
        [itemarray addObject:@"123"];
    }
    downView.itmearray = itemarray;
}
- (void)left{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    NSArray * contarray = self.navigationController.viewControllers;
    for (int i =0; i < contarray.count; i++) {
        UIViewController *controller = contarray[i];
        if ([controller isKindOfClass:[HomePageViewController class]]) {
            [self.navigationController popToViewController:controller animated:YES];
            break;
        }
    }

    if (contarray.count == self.navigationController.viewControllers.count) {
        self.tabBarController.selectedIndex = 0;        
    }
//    UIViewController *controller = self.navigationController.viewControllers[self.navigationController.viewControllers.count-1-2 ];
//    [self.navigationController popToViewController:controller animated:YES];
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

@end
