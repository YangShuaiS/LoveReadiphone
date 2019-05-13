//
//  NewHomeViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NewHomeViewController.h"
#import "HomeLBTView.h"
#import "HproverbView.h"
#import "HTaskView.h"
#import "HAllTaskView.h"
#import "HHotBookView.h"

#import "NewHpViewModel.h"

#import "GuideHomeOneView.h"
#import "GuideHomeTwoView.h"

#import "UserXZageView.h"
#import "NHNavView.h"

#import "BuyTemporaryView.h"

@interface NewHomeViewController (){
    HomeLBTView * homeLBT;
    NSMutableArray *  viewarray;
    UIScrollView * scrollView;
    HproverbView * prover;//谚语
    HTaskView * task;
    HAllTaskView * alltask;//任务
    HHotBookView * booklist;
    
    NSInteger now;
}

@end

@implementation NewHomeViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self LoadData];
}


- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_NEWHOME];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    //    NSDictionary * dic = @{@"studentid":@"12"};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NewHomeModel * model = [NewHomeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
            [self->scrollView.mj_header endRefreshing];
            [self->scrollView.mj_footer endRefreshing];
        }else{
            [self->scrollView.mj_header endRefreshing];
            [self->scrollView.mj_footer endRefreshing];
        }
    }];
}
- (void)UpData:(NewHomeModel *)model{
    homeLBT.itemArray = model.bannerList;
    prover.itemArray = model.proverb;
    task.model = model.missionInfo;
    alltask.itemArray = model.missionList;
    booklist.model = model.tag;
    [self.view.superview layoutIfNeeded];
    if ([[[BaseObject jsd_getCurrentViewController] class] isEqual:[self class]]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self addGuideHomeOne];
        });
    }
}
- (void)addGuideHomeOne{
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",BENDIXINXI]];
    NSMutableDictionary *dataDictionary = [BaseObject BenDiXinXi];
    NewHpViewModel * model = [NewHpViewModel mj_objectWithKeyValues:dataDictionary];
    if ([model.ydyhome integerValue]<3) {
        WS(ws);
        GuideHomeOneView * view = [GuideHomeOneView new];
        view.frames = homeLBT.frame;
        [[[[UIApplication sharedApplication] delegate] window]  addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo([[[UIApplication sharedApplication] delegate] window] );
        }];
        [view setBlock:^{
            [ws GuideHomeTwo];
        }];
        
        NSString * str = [NSString stringWithFormat:@"%ld",[model.ydyhome integerValue]+1];
        [dataDictionary setValue:str forKey:@"ydyhome"];
        [dataDictionary writeToFile:filePatch atomically:YES];
    }
}
- (void)GuideHomeTwo{
    GuideHomeTwoView * view = [GuideHomeTwoView new];
    view.frames = task.frame;
    [[[[UIApplication sharedApplication] delegate] window]  addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([[[UIApplication sharedApplication] delegate] window] );
    }];
}


- (void)ConfirmTheSize{
    UIView *statusBar = STAUBARHEIGHT;
    StatusBar = statusBar.frame.size.height;
    NavHeight = StatusBar+NAVIGATIONHeight;
    poinw = WIDTH/16;
    TabBarHeight = TABBARHeight;
}
#pragma mark - 下拉刷新
- (void)headRefresh{
    [self LoadData];
}
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"" Title:@"任务" RightTitle:@"" NativeStyle:NavStyleHome];
    self.navtive.titcolor = RGB(0, 0, 0);
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.downlayer = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self ConfirmTheSize];
//    [self AddNavtion];
    self.view.backgroundColor = [UIColor whiteColor];
    
    viewarray = [NSMutableArray array];
    
    scrollView = [UIScrollView new];
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headRefresh)];
    
    NHNavView * hnnav = [NHNavView new];
    [viewarray addObject:hnnav];
    
    homeLBT = [HomeLBTView new];
    homeLBT.nav = self.navigationController;
    [viewarray addObject:homeLBT];
    
    task = [HTaskView new];
    task.nav = self.navigationController;
    [viewarray addObject:task];
    
    prover = [HproverbView new];
    prover.nav = self.navigationController;
    [viewarray addObject:prover];
    
//    BuyTemporaryView * vc = [BuyTemporaryView new];
//    [viewarray addObject:vc];
    
    alltask = [HAllTaskView new];
    alltask.nav = self.navigationController;
    [viewarray addObject:alltask];
    
    booklist = [HHotBookView new];
    booklist.nav = self.navigationController;
    [viewarray addObject:booklist];
    WS(ws);
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(StatusBar);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
//
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
                    make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(0));
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
   
    //    [self kaijiangdaojishi];
    //    [self xinshourenwuwancheng];
    //    [self wanchengrenwu];
    
    // Do any additional setup after loading the view.
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
