//
//  MMyViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MMyViewController.h"
#import "MMviewTableView.h"
#import "MTopSZorSCView.h"
#import "MMyViewTopView.h"
#import "GuideSZorSConeView.h"
#import "GuideSZorSCtwoView.h"
#import "GuideSZorSCthreeView.h"

#import "MyMessageViewController.h"

#import "NewHpViewModel.h"
@interface MMyViewController ()<NavDelegate>{
    MyDeModel * model;
    MMviewTableView * tabview;
    MMyViewTopView * topview;
    
}

@end

@implementation MMyViewController
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"" Title:@"我的" RightTitle:@"个人中心-消息" NativeStyle:nacStyleCengterAndRight];
    self.navtive.titcolor = RGB(0, 0, 0);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.backgroundColor = RGBA(255, 255, 255, 1);
}
- (void)NavLeftClick{
    
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    MyMessageViewController *  vc = [MyMessageViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self LoadData];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    
    WS(ws);
    topview = [MMyViewTopView new];
    [self.view addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom);
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
    }];
    
    tabview = [MMviewTableView new];
    tabview.nav = self.navigationController;
    [self.view addSubview:tabview];
    [tabview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->topview.mas_bottom);
        make.left.and.right.and.bottom.mas_equalTo(ws.view);
    }];
    
    [tabview setBlock:^(NSInteger inter) {
        [ws Click:inter];
    }];
}

- (void)Click:(NSInteger)inter{
    if (inter == 0) {
        [self szorsc];
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self addGuideSZorSConeView];
        });
    }
}
- (void)szorsc{
    WS(ws);
    MTopSZorSCView * view = [MTopSZorSCView new];
    view.nav = self.navigationController;
    [self.view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view.window);
    }];
}

- (void)addGuideSZorSConeView{
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",@"bendixinxi"]];
    NSMutableDictionary *dataDictionary = [BaseObject BenDiXinXi];
    NewHpViewModel * model = [NewHpViewModel mj_objectWithKeyValues:dataDictionary];
    if ([model.ydyszsc integerValue]<3) {
        WS(ws);
        GuideSZorSConeView * view = [GuideSZorSConeView new];
        [self.view.window addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.view.window);
        }];
        [view setBlock:^{
            [ws addGuideSZorSCtwoView];
        }];
        
        NSString * str = [NSString stringWithFormat:@"%ld",[model.ydyszsc integerValue]+1];
        [dataDictionary setValue:str forKey:@"ydyszsc"];
        [dataDictionary writeToFile:filePatch atomically:YES];
    }
}
- (void)addGuideSZorSCtwoView{
    WS(ws);
    GuideSZorSCtwoView * view = [GuideSZorSCtwoView new];
    [self.view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view.window);
    }];
    [view setBlock:^{
        [ws addGuideSZorSCthreeView];
    }];
}
- (void)addGuideSZorSCthreeView{
    WS(ws);
    GuideSZorSCthreeView * view = [GuideSZorSCthreeView new];
    [self.view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view.window);
    }];
    [view setBlock:^{
        
    }];
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_MYDE];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            self->model = [MyDeModel mj_objectWithKeyValues:responseObject];
            if ([self->model.code isEqual:@200]) {
                [self UpData];
            }else if ([self->model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
    
}

- (void)UpData{
    topview.model = model.userinfo;
    tabview.model = model.userinfo;
}
@end
