//
//  ChallengeOneController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/7.
//  Copyright © 2018年 YS. All rights reserved.
//  答题one

#import "ChallengeOneController.h"
#import "BookCityViewController.h"
#import "ChallengeTwoController.h"
@interface ChallengeOneController ()<NavDelegate>

@end

@implementation ChallengeOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self AddView];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"home-Click" Title:@"挑战答题" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    
}
- (void)NavLeftClick{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[BookCityViewController class]]) {
            BookCityViewController *A =(BookCityViewController *)controller;
            [self.navigationController popToViewController:A animated:YES];
        }
    }

//    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)NavCenterClick {

}


- (void)NavRightClick {
    
}


- (void)AddView{
    WS(ws);
    FLAnimatedImageView * backImage = [FLAnimatedImageView new];
    backImage.backgroundColor = RANDOMCOLOR;
    [self.view addSubview:backImage];
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    BaseView * NeiRongView = [BaseView new];
    NeiRongView.backgroundColor = RANDOMCOLOR;
    NeiRongView.layer.masksToBounds = YES;
    NeiRongView.layer.cornerRadius = 15;
    [backImage addSubview:NeiRongView];
    
    [NeiRongView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backImage.mas_left).with.offset(20);
        make.right.equalTo(backImage.mas_right).with.offset(-20);
        make.top.equalTo(backImage.mas_top).with.offset(20);
        make.height.equalTo(NeiRongView.mas_width).multipliedBy(0.8);
    }];
    
    FLAnimatedImageView * xunzhang = [FLAnimatedImageView new];
    xunzhang.backgroundColor = RANDOMCOLOR;
    [NeiRongView addSubview:xunzhang];
    [xunzhang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(NeiRongView.mas_centerX);
        make.top.equalTo(NeiRongView.mas_top).with.offset(20);
        make.width.mas_equalTo(LENGTH(80));
        make.height.equalTo(xunzhang.mas_width).multipliedBy(1.5);
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    [NeiRongView addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(NeiRongView.mas_centerX);
        make.top.equalTo(xunzhang.mas_bottom).with.offset(20);
        make.left.equalTo(NeiRongView.mas_left).with.offset(20);
        make.right.equalTo(NeiRongView.mas_right).with.offset(-20);
    }];
    
    BaseLabel * subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    [NeiRongView addSubview:subtitle];
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(NeiRongView.mas_centerX);
        make.top.equalTo(title.mas_bottom).with.offset(20);
        make.left.equalTo(NeiRongView.mas_left).with.offset(20);
        make.right.equalTo(NeiRongView.mas_right).with.offset(-20);
        
    }];
    
    FLAnimatedImageView * DuWenZhang = [FLAnimatedImageView new];
    DuWenZhang.backgroundColor = RANDOMCOLOR;
    DuWenZhang.userInteractionEnabled = YES;
    backImage.userInteractionEnabled = YES;
    [backImage addSubview:DuWenZhang];
    
    [DuWenZhang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(backImage.mas_centerX);
        make.top.equalTo(NeiRongView.mas_bottom).with.offset(20);
        make.width.mas_equalTo(LENGTH(200));
        make.height.mas_equalTo(LENGTH(100));
    }];
    
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(push)];
    //将手势添加到需要相应的view中去
    [DuWenZhang addGestureRecognizer:tapGesture1];
    
    
    
}
- (void)push{
    ChallengeTwoController * vc = [ChallengeTwoController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
