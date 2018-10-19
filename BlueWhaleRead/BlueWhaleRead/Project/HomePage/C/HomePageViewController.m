 //
//  HomePageViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomeTopView.h"
#import "HomeLBTView.h"
#import "HomeClassIfCation.h"
#import "HomeHomework.h"
#import "HomeModerateView.h"
#import "HomeNewMedalView.h"
#import "HomeInterestGroupView.h"
#import "HomeLiteracyView.h"
#import "HomeFriendReadingView.h"
//二维码
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import "WCQRCodeScanningVC.h"

#import "HomeNoticeView.h"

@interface HomePageViewController ()<UIScrollViewDelegate>

@end

@implementation HomePageViewController{
    NSMutableArray *  viewarray;
    UIScrollView * scrollView;
    
    HomeTopView * topView;
    HomeLBTView * homeLBT;
    HomeClassIfCation * homeFL;//分类
    HomeHomework * homeWork;
    HomeModerateView * moderate;//适度
    HomeNewMedalView * new;//
    HomeInterestGroupView * intersGroup;//热门兴趣小组
    HomeLiteracyView * literacy;//
    HomeFriendReadingView * friendreading;
}
- (void)ConfirmTheSize{
    UIView *statusBar = STAUBARHEIGHT;
    StatusBar = statusBar.frame.size.height;
    NavHeight = StatusBar+NAVIGATIONHeight;
    poinw = WIDTH/16;
    TabBarHeight = TABBARHeight;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self LoadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self ConfirmTheSize];
    [self Addview];
    [self ViewLaout];

    [self LoadData];
}

#pragma mark - 下拉刷新
- (void)headRefresh{
    [self LoadData];
}
#pragma mark - 上拉加载
//- (void)footerRefresh{
//    [self LoadData];
//
//}
#pragma mark ---- 添加通知
- (void)addTongZhi{
    HomeNoticeView * NOView = [HomeNoticeView new];
    [self.view addSubview:NOView];
    WS(ws);
    [NOView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
        make.top.mas_equalTo(self->topView.mas_bottom);
        make.height.mas_equalTo(54);
    }];
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [NOView removeFromSuperview];
    });
    
}
- (void)Addview{
    self.automaticallyAdjustsScrollViewInsets = NO;
    topView = [HomeTopView new];
    topView.nav = self.navigationController;
    [self.view addSubview:topView];
    WS(ws);
    [topView setBlock:^{
        [ws erweima];
    }];
    
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = NO;
    [self.view addSubview:scrollView];
#pragma mark ---- 暂时不做
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(addTongZhi) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    
    
//    if ([IOS_X integerValue]>=11.0) {
//        scrollView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
//    }
    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headRefresh)];
//    scrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
    


//    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
////        [self chushihua];
//        [self LoadData];
//    }];
//    [scrollView.mj_header beginRefreshing];
    viewarray = [NSMutableArray array];
    

//    [viewarray addObject:topView];
    
    homeLBT = [HomeLBTView new];
    homeLBT.nav = self.navigationController;
    [viewarray addObject:homeLBT];
    

    homeFL = [HomeClassIfCation new];
    homeFL.nav = self.navigationController;
    [viewarray addObject:homeFL];
    
    homeWork = [HomeHomework new];
    homeWork.layer.masksToBounds = YES;
    homeWork.nav = self.navigationController;
    [viewarray addObject:homeWork];
    
    moderate = [HomeModerateView new];
    moderate.nav = self.navigationController;
    [viewarray addObject:moderate];
    
    new = [HomeNewMedalView new];
    new.nav = self.navigationController;
    [viewarray addObject:new];
    
//    intersGroup = [HomeInterestGroupView new];
//    [viewarray addObject:intersGroup];
    
    literacy = [HomeLiteracyView new];
    literacy.nav = self.navigationController;
    [viewarray addObject:literacy];
    
    friendreading = [HomeFriendReadingView new];
    friendreading.nav = self.navigationController;
    [viewarray addObject:friendreading];
    
    
}
- (void)ViewLaout{
    WS(ws);
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
    }];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->topView.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(-TabBarHeight);
    }];
    
    BaseView * lastview;
    for (int i = 0; i < viewarray.count; i++) {
        BaseView * view = viewarray[i];
        [scrollView addSubview:view];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {

                make.top.equalTo(self->scrollView.mas_top).with.offset(0);
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
                if (i == 1) {
                    make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(0));
                }else{
                    make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(10));
                }
            }];
        }
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);
            }];
        }
        lastview = view;
    }

}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,HOMEPAGE];
    NSDictionary * dic = @{@"studentid":Me.ssid};
//    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,@"searchBook"];
//    NSDictionary * dic = @{@"bookName":@"我",@"studentid":Me.ssid};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomePage * model = [HomePage mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }
            [self->scrollView.mj_header endRefreshing];
            [self->scrollView.mj_footer endRefreshing];
        }else{
            [self->scrollView.mj_header endRefreshing];
            [self->scrollView.mj_footer endRefreshing];
        }
    }];

}
- (void)UpData:(HomePage *)model{
    
    topView.model = model.student;
    homeFL.itemArray = model.iconList;
    homeLBT.itemArray = model.bannerList;
    if (model.classStudent.count == 0) {
        [homeWork mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }else{
        if (homeWork.itemarray.count ==0) {
            homeWork.itemarray = model.classStudent;
        }
    }
    moderate.model = model.typeList;
    new.itemarray = model.hotBadge;
//    literacy.itemarray = model.testImgList;   //暂时不用
    friendreading.friendBookCount = model.friendBookCount;
    friendreading.itemarray = model.friendBook;
    scrollView.userInteractionEnabled = YES;

}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//二维码
- (void)erweima{
    WCQRCodeScanningVC *WCVC = [[WCQRCodeScanningVC alloc] init];
    [self QRCodeScanVC:WCVC];
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
