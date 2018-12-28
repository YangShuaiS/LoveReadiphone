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

#import "TUpView.h"
#import "TKJUpView.h"
#import "TCompleteView.h"

#import "NewHpViewModel.h"

#import "GuideHomeOneView.h"
#import "GuideHomeTwoView.h"

#import "UserXZageView.h"
@interface NewHomeViewController (){
    HomeLBTView * homeLBT;
    NSMutableArray *  viewarray;
    UIScrollView * scrollView;
    HproverbView * prover;//谚语
    HTaskView * task;
    HAllTaskView * alltask;//任务
    HHotBookView * booklist;
}

@end

@implementation NewHomeViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (Me.ssid.length>0) {
        [self LoadData];
    }else{
        [self hqid];
    }
}
- (void)hqid{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_HQID];
    NSDictionary * dic = @{@"uuid":[[UIDevice currentDevice] identifierForVendor].UUIDString};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                NSString *filePatch = [BaseObject AddPathName:UserMe];
                Me = [MeModel mj_objectWithKeyValues:m.studentInfo];
                NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
                NSDictionary * dics = m.studentInfo;
                [usersDic setObject:dics forKey:UserMe];
                [usersDic writeToFile:filePatch atomically:YES];
                if ([Me.birthday isEqualToString:@""]) {
                    [ws addnianji];
                }else{
                    [ws LoadData];
                }
            }else if ([m.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            [ws hqid];
        }
    }];
    
}
- (void)addnianji{
    WS(ws);
    UserXZageView * view = [UserXZageView new];
    [self.view.window  addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view.window);
    }];
    [view setBlock:^(NSString * _Nonnull str) {
        [ws bdstr:str];

    }];

}

- (void)bdstr:(NSString *)str{
    NSString *key = @"nianji";
    [[NSUserDefaults standardUserDefaults] setInteger:[str integerValue] forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
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
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self addGuideHomeOne];
    });

}
- (void)addGuideHomeOne{
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",@"bendixinxi"]];
    NSMutableDictionary *dataDictionary = [BaseObject BenDiXinXi];
    NewHpViewModel * model = [NewHpViewModel mj_objectWithKeyValues:dataDictionary];
    if ([model.ydyhome integerValue]<3) {
        WS(ws);
        GuideHomeOneView * view = [GuideHomeOneView new];
        view.frames = homeLBT.frame;
        [self.view.window addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.view.window);
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
    WS(ws);
    GuideHomeTwoView * view = [GuideHomeTwoView new];
    view.frames = task.frame;
    [self.view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view.window);
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
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self ConfirmTheSize];

    viewarray = [NSMutableArray array];
    
    scrollView = [UIScrollView new];
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headRefresh)];

    
    homeLBT = [HomeLBTView new];
    homeLBT.nav = self.navigationController;
    [viewarray addObject:homeLBT];
    
    prover = [HproverbView new];
    prover.nav = self.navigationController;
    [viewarray addObject:prover];
    
    task = [HTaskView new];
    task.nav = self.navigationController;
    [viewarray addObject:task];
    
    alltask = [HAllTaskView new];
    alltask.nav = self.navigationController;
    [viewarray addObject:alltask];
    
    booklist = [HHotBookView new];
    booklist.nav = self.navigationController;
    [viewarray addObject:booklist];
    WS(ws);
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(-StatusBar);
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
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",@"bendixinxi"]];
    NSMutableDictionary *dataDictionary = [BaseObject BenDiXinXi];
    NSString *currentTimeString = [BaseObject NowTime];
    NewHpViewModel * model = [NewHpViewModel mj_objectWithKeyValues:dataDictionary];
    
    if (model.sfcj == nil) {
        NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
        [usersDic setValue:@"" forKey:@"ljrqtime"];
        [usersDic setValue:@"" forKey:@"wcrwtime"];
        [usersDic setValue:@"" forKey:@"ljymtime"];
        [usersDic setValue:@"1" forKey:@"sfcj"];
        [usersDic setValue:@"" forKey:@"sharetime"];
        [usersDic setValue:@"" forKey:@"shretype"];
        
        [usersDic setValue:@"0" forKey:@"ydyhome"];
        [usersDic setValue:@"0" forKey:@"ydybookcity"];
        [usersDic setValue:@"0" forKey:@"ydyszsc"];
        [usersDic setValue:@"0" forKey:@"ydybookxq"];
        [usersDic setValue:@"0" forKey:@"ydydati"];
        [usersDic setValue:@"0" forKey:@"ydylqrw"];
        [usersDic setValue:@"0" forKey:@"ydyqbrw"];

        [usersDic writeToFile:filePatch atomically:YES];
    }else{
        if (![model.ljrqtime isEqualToString:currentTimeString]) {
            [self kaijiangdaojishi];
            [dataDictionary setValue:currentTimeString forKey:@"ljrqtime"];
            [dataDictionary writeToFile:filePatch atomically:YES];
        }
        if (![model.wcrwtime isEqualToString:currentTimeString]){
            [self xinshourenwuwancheng];
            [dataDictionary setValue:currentTimeString forKey:@"wcrwtime"];
            [dataDictionary writeToFile:filePatch atomically:YES];
        }
        if (![model.ljymtime isEqualToString:currentTimeString]){
            [self wanchengrenwu];
            [dataDictionary setValue:currentTimeString forKey:@"ljymtime"];
            [dataDictionary writeToFile:filePatch atomically:YES];

        }
        
    }
//    [self kaijiangdaojishi];
//    [self xinshourenwuwancheng];
//    [self wanchengrenwu];

    // Do any additional setup after loading the view.
}
- (void)kaijiangdaojishi{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_KJTS];
    NSDictionary * dic = @{@"studentid":Me.ssid};
//        NSDictionary * dic = @{@"studentid":@"12"};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NewHomeModel * model = [NewHomeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self upview:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{

        }
    }];
}
- (void)upview:(NewHomeModel *)model{
    WS(ws);
    TUpView * view = [TUpView new];
    view.nav = self.navigationController;
    view.model = model;
    [self.view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view.window);
    }];

}

- (void)xinshourenwuwancheng{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_XSRWWC];
    NSDictionary * dic = @{@"studentid":Me.ssid};
//        NSDictionary * dic = @{@"studentid":@"12"};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TKXSTaskXQModel * model = [TKXSTaskXQModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self uplingjiang:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}
- (void)uplingjiang:(TKXSTaskXQModel *)model{
    WS(ws);
    TKJUpView * view = [TKJUpView new];
    view.nav = self.navigationController;
    view.model = model;
    [self.view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view.window);
    }];
    
}

- (void)wanchengrenwu{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_RWWC];
    NSDictionary * dic = @{@"studentid":Me.ssid};
//        NSDictionary * dic = @{@"studentid":@"12"};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TKXSTaskXQModel * model = [TKXSTaskXQModel mj_objectWithKeyValues:responseObject];
                        if ([model.code isEqual:@200]) {
            [self upwanchengrw:model];
                        }else if ([model.code isEqual:@Notloggedin]){
                            [self UpDengLu];
                        }
        }else{
            
        }
    }];
}

- (void)upwanchengrw:(TKXSTaskXQModel *)model{
    WS(ws);
    TCompleteView * view = [TCompleteView new];
    view.nav = self.navigationController;
    view.model = model;
    [self.view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view.window);
    }];
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
