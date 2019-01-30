//
//  MMyViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MMyViewController.h"
#import "MMyViewCenterView.h"


#import "MMviewTableView.h"
#import "MTopSZorSCView.h"
#import "MMyViewTopView.h"
#import "GuideSZorSConeView.h"
#import "GuideSZorSCtwoView.h"
#import "GuideSZorSCthreeView.h"

#import "MyMessageViewController.h"

#import "NewHpViewModel.h"
@interface MMyViewController (){
    UIScrollView * scrollView;
    NSMutableArray *  viewarray;

    MyDeModel * model;
    MMviewTableView * tabview;
    MMyViewTopView * topview;
    MMyViewCenterView * cenview;
}

@end

@implementation MMyViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self LoadData];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    
    viewarray = [NSMutableArray array];
    scrollView = [UIScrollView new];
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(-StatusBar);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(-TabBarHeight);
    }];
    
    
    topview = [MMyViewTopView new];
    [viewarray addObject:topview];

    cenview = [MMyViewCenterView new];
    [viewarray addObject:cenview];
    [cenview setBlock:^(NSInteger inter) {
        [ws Click:inter];
    }];
    
    tabview = [MMviewTableView new];
    [viewarray addObject:tabview];

    
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
}
@end
