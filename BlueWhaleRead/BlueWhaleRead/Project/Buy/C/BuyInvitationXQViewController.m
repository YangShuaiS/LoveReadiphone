//
//  BuyInvitationXQViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/26.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyInvitationXQViewController.h"
#import "BuyInvitationXQView.h"
#import "BuyShareView.h"
#import "BuyDownView.h"
#import "UIView+GZExtend.h"

@interface BuyInvitationXQViewController ()<NavDelegate,UIScrollViewDelegate>

@end

@implementation BuyInvitationXQViewController{
    BuyInvitationXQView * xqView;
    UIScrollView * scrollViews;
    BuyShareView * buyShare;
    BuyDownView * buyDown;
    BuyYaoQingModel * YQModel;
    NSTimer *timer;
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"邀请有礼" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.titcolor = RGB(0, 0, 0);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.downlayer = YES;
}

- (void)NavLeftClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    self.view.backgroundColor = RGB(255,255,255);
    [self AddNavtion];
    scrollViews = [UIScrollView new];
    scrollViews.delegate = self;
    [self.view addSubview:scrollViews];
    [scrollViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    xqView = [BuyInvitationXQView new];
    [scrollViews addSubview:xqView];
    [xqView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollViews).with.offset(LENGTH(18));
        make.width.mas_equalTo(ws.view);
        make.left.and.right.mas_equalTo(self->scrollViews);
    }];
    
    buyShare = [BuyShareView new];
    [scrollViews addSubview:buyShare];
    [buyShare mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->xqView.mas_bottom).with.offset(LENGTH(10));
//        make.left.and.right.mas_equalTo(ws.view);
        make.centerX.mas_equalTo(ws.view);
    }];
    
    buyDown = [BuyDownView new];
    [scrollViews addSubview:buyDown];
    [buyDown mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->buyShare.mas_bottom).with.offset(LENGTH(20));
        //        make.left.and.right.mas_equalTo(ws.view);
        make.centerX.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(self->scrollViews).with.offset(-LENGTH(20));
    }];
    [self loadData];
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)loadData{
    NSString * urls = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_YAPQING];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:urls dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            self->YQModel = [BuyYaoQingModel mj_objectWithKeyValues:responseObject];
            [self loaddata];
        }else{
        }
    }];
}
- (void)loaddata{
    if (xqView.model == nil) {
        xqView.model = YQModel;
        buyDown.model = YQModel;
    }
    if (xqView.now >=2) {
        buyShare.image = [xqView imageFromView];
        [timer invalidate];
        timer = nil;
    }else{
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(loaddata) userInfo:nil repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    }
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
