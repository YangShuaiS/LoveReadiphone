//
//  NewKnowledgeRootViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NewKnowledgeRootViewController.h"
#import "NKTopSearchView.h"
#import "NKRLbtView.h"
#import "NKRClassificationView.h"
#import "NKRHotKnowledgeView.h"
#import "NKRRecommendedView.h"
#import "NKRRecTowTitleView.h"
#import "NKRBookTJView.h"
#import "NKTJContextDiagramView.h"
#import "NKTopFLView.h"//分类


#import "NKRWenzhangView.h"

#import "GuiDeZhiShiWangOneView.h"
#import "GuiDeZhiShiWangTwoView.h"
#import "GuiDeZhiShiWangThreeView.h"
#import "NewHpViewModel.h"
#import "HproverbView.h"
#import <AdSupport/AdSupport.h>

#import "TUpView.h"
#import "TKJUpView.h"
#import "TCompleteView.h"

#import "VersionUpdateView.h"
@interface NewKnowledgeRootViewController (){
    UIScrollView * scrollView;
    NSMutableArray *  viewarray;

    NKTopSearchView * search;
    NKRLbtView * channel;
    NKRClassificationView *NKRCView;
    NKRHotKnowledgeView * hotkledge;
    NKTJContextDiagramView * TJContextView;
    NKRRecommendedView * recommended;
    NKRRecTowTitleView * rectowtitle;
    HproverbView * prover;//谚语
    NKRBookTJView * booktj;
    NKTopFLView * topFL;
    NSInteger now;

//    NKRWenzhangView * wztj;
}

@end

@implementation NewKnowledgeRootViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NewHomeModel * model = [ NewHomeModel new];
    model = [NewHomeModel mj_objectWithKeyValues:@{}];
    if (now == 0) {
        now = 1;
        [self upapp];
    }else{
        [self willupview];
    }
}
- (void)willupview{
    NSString * nianji  = [[NSUserDefaults standardUserDefaults] objectForKey:kNotificationNianJi];
    if (nianji == nil || [nianji isEqualToString:@""]) {
    }else{
        if (Me.ssid.length>0) {
            [self LoadData];
        }else{
            [self hqid:nianji];
        }
    }
}

- (void)hqid:(NSString *)nianji{
    WS(ws);
    //2AF887C1-A9CE-4F4D-A966-68F913182DAB
    NSString * idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_HQID];
    NSDictionary * dic = @{@"uuid":[[UIDevice currentDevice] identifierForVendor].UUIDString,@"level":nianji,@"idfa":idfa};
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
                [ws LoadData];
            }else if ([m.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            //            [ws hqid:nianji];
        }
    }];
    
}

- (void)upapp{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_NOWBANBENHAO];
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:nil andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UpAppModel * m = [UpAppModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                [self panduanbanbenhao:m];
            }
        }else{
            [self willupview];
        }
    }];
    
}
- (void)panduanbanbenhao:(UpAppModel *)model{
    //    NSString * iosVersionName = APP_VERSION;
    NSInteger iosVersionCodes = [APP_BUILD integerValue];
    iosVersionCode = [model.iosVersionCode integerValue];
    if ([model.iosVersionCode integerValue] > iosVersionCodes) {
        [self qiangzhiup:model];
        if ([model.isForceUpdate isEqualToString:@"1"]) {
        }else{
            [self willupview];
        }
    }else{
        [self willupview];
    }
    
}

- (void)qiangzhiup:(UpAppModel *)model{
    VersionUpdateView * v = [VersionUpdateView new];
    v.model = model;
    [[UIApplication sharedApplication].delegate.window addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([UIApplication sharedApplication].delegate.window);
    }];
//    NSString * url ;
//    url = [[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/博万卷-学生中文课外阅读app/id1434054632?mt=8"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"更新"
//                                                                   message:@"应用有新版本，请及时更新"
//                                                            preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"更新" style:UIAlertActionStyleDefault
//                                                         handler:^(UIAlertAction * action) {
//                                                             //响应事件
//                                                             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
//                                                             exit(0);
//
//
//                                                         }];
//    [alert addAction:cancelAction];
//    [self presentViewController:alert animated:YES completion:nil];
}
- (void)noqiangzhiup{
    NSString * url ;
    if( IS_IPHONE ){
        url = [[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/博万卷-学生中文课外阅读app/id1434054632?mt=8"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    }else{
        url = [[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/博万卷-学生中文课外阅读app-pad/id1422331735?mt=8"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        
    }
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"更新"
                                                                   message:@"应用有新版本，请及时更新"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"暂不更新" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"更新" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];                                                         }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}
- (void)ConfirmTheSize{
    UIView *statusBar = STAUBARHEIGHT;
    StatusBar = statusBar.frame.size.height;
    NavHeight = StatusBar+NAVIGATIONHeight;
    poinw = WIDTH/16;
    TabBarHeight = TABBARHeight;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self ConfirmTheSize];
    if (Me.ssid.length>0) {
        [self UpMeDaty];
    }
    [self Addview];
}
- (void)UpMeDaty{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_getUserInfo];
    NSDictionary * dic = @{@"studentid":Me.ssid};
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
            }
        }else{
            //            [ws hqid:nianji];
        }
    }];
}
- (void)Addview{
    WS(ws);
    search = [NKTopSearchView new];
    [self.view addSubview:search];
    [search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(StatusBar+LENGTH(8));
        make.left.and.right.mas_equalTo(ws.view);
    }];
    

    
    viewarray = [NSMutableArray array];
    scrollView = [UIScrollView new];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->search.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headRefresh)];
    topFL = [NKTopFLView new];
    [self.view addSubview:topFL];
    [topFL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->search.mas_bottom).with.offset(0);
        make.left.and.right.mas_equalTo(ws.view);
    }];
    topFL.alpha = 0;

    
    channel = [NKRLbtView new];
    [viewarray addObject:channel];
    
    NKRCView = [NKRClassificationView new];
    [viewarray addObject:NKRCView];
    
    hotkledge = [NKRHotKnowledgeView new];
    [viewarray addObject:hotkledge];
    
    TJContextView = [NKTJContextDiagramView new];
    [viewarray addObject:TJContextView];
    
    recommended = [NKRRecommendedView new];
    [viewarray addObject:recommended];
    
    rectowtitle = [NKRRecTowTitleView new];
    [viewarray addObject:rectowtitle];
    
    prover = [HproverbView new];
    [viewarray addObject:prover];
    
    booktj = [NKRBookTJView new];
    [viewarray addObject:booktj];

//    wztj = [NKRWenzhangView new];
//    [viewarray addObject:wztj];

    BaseView * lastview;
    for (int i = 0; i < viewarray.count; i++) {
        BaseView * view = viewarray[i];
        [scrollView addSubview:view];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->scrollView.mas_top);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lastview.mas_bottom);
            }];
        }
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws.view).with.offset(0);
            make.right.equalTo(ws.view).with.offset(0);
        }];
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);
            }];
        }
        lastview = view;
    }
}
#pragma mark - 下拉刷新
- (void)headRefresh{
    [self LoadData];
}

- (void)LoadData{
    [self cshxx];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ZHISHIWANGSHOUYE];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NewKnowledgeModel * model = [NewKnowledgeModel mj_objectWithKeyValues:responseObject];
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
- (void)UpData:(NewKnowledgeModel *)model{
    channel.itemArray = model.bannerList;
    NKRCView.itemArray = model.knowledgeData;
    topFL.itemarray = model.knowledgeData;
    hotkledge.allpage = [model.hotKnowledgeNum integerValue];
    hotkledge.itemArray = model.hotKnowledge;
    TJContextView.itemArray = model.knowledges;
    recommended.itemArray = model.myHistory;
    rectowtitle.itemArray = model.relatedRecommendations;
    booktj.itemarray = model.bookList;
    prover.itemArray = model.proverb;
    
    if ([[[BaseObject jsd_getCurrentViewController] class] isEqual:[self class]]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self.view.superview layoutIfNeeded];
            [self addGuiDeZhiShiWangOneView];
        });
    }
    

//    wztj.itemarray = model.goodBannerList;
}

#pragma mark ------------------ 引导页
- (void)addGuiDeZhiShiWangOneView{
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",BENDIXINXI]];
    NSMutableDictionary *dataDictionary = [BaseObject BenDiXinXi];
    NewHpViewModel * model = [NewHpViewModel mj_objectWithKeyValues:dataDictionary];
    if ([model.zhishiwang integerValue]<3) {
        WS(ws);
        [scrollView setContentOffset:CGPointMake(0,NKRCView.frame.origin.y) animated:NO];
        GuiDeZhiShiWangOneView * view = [GuiDeZhiShiWangOneView new];
        view.frames = NKRCView.frame;
        [[[[UIApplication sharedApplication] delegate] window] addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo([[[UIApplication sharedApplication] delegate] window] );
        }];
        [view setBlock:^{
            [ws addGuiDeZhiShiWangTwoView];
        }];
        NSString * str = [NSString stringWithFormat:@"%ld",[model.zhishiwang integerValue]+1];
        [dataDictionary setValue:str forKey:@"zhishiwang"];
        [dataDictionary writeToFile:filePatch atomically:YES];
    }
}

- (void)addGuiDeZhiShiWangTwoView{
    WS(ws);
    if (recommended.itemArray.count > 0) {
        [scrollView setContentOffset:CGPointMake(0,recommended.frame.origin.y - (HEIGHT -TabBarHeight-recommended.frame.size.height)/2) animated:NO];
        GuiDeZhiShiWangTwoView * view = [GuiDeZhiShiWangTwoView new];
        view.viewy =(HEIGHT -TabBarHeight-recommended.frame.size.height)/2+LENGTH(48)+StatusBar;
        [[[[UIApplication sharedApplication] delegate] window]  addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo([[[UIApplication sharedApplication] delegate] window] );
        }];
        [view setBlock:^{
            [ws addGuiDeZhiShiWangThreeView];
        }];
        
    }else{
        if (self->rectowtitle.itemArray.count > 0) {
            [scrollView setContentOffset:CGPointMake(0,rectowtitle.frame.origin.y - (HEIGHT -TabBarHeight-rectowtitle.frame.size.height)/2) animated:NO];
            GuiDeZhiShiWangThreeView * view = [GuiDeZhiShiWangThreeView new];
            view.viewy =(HEIGHT -TabBarHeight-rectowtitle.frame.size.height)/2+LENGTH(48)+StatusBar;
            [[[[UIApplication sharedApplication] delegate] window]  addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo([[[UIApplication sharedApplication] delegate] window] );
            }];
            [view setBlock:^{
                [self->scrollView setContentOffset:CGPointMake(0,0) animated:NO];
                
            }];
        }

    }
}
- (void)addGuiDeZhiShiWangThreeView{
    if (self->rectowtitle.itemArray.count > 0) {
        [scrollView setContentOffset:CGPointMake(0,rectowtitle.frame.origin.y - (HEIGHT -TabBarHeight-rectowtitle.frame.size.height)/2) animated:NO];
        GuiDeZhiShiWangThreeView * view = [GuiDeZhiShiWangThreeView new];
        view.viewy =(HEIGHT -TabBarHeight-rectowtitle.frame.size.height)/2+LENGTH(48)+StatusBar;
        [[[[UIApplication sharedApplication] delegate] window]  addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo([[[UIApplication sharedApplication] delegate] window] );
        }];
        [view setBlock:^{
            [self->scrollView setContentOffset:CGPointMake(0,0) animated:NO];
        }];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y >= hotkledge.frame.origin.y && topFL.alpha == 0) {
        [UIView animateWithDuration:0.5 animations:^{
            self->topFL.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }
    
    if (scrollView.contentOffset.y < hotkledge.frame.origin.y && topFL.alpha == 1) {
        [UIView animateWithDuration:0.5 animations:^{
            self->topFL.alpha = 0;
        } completion:^(BOOL finished) {
            
        }];
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

#pragma mark ------ 初始化信息
- (void)cshxx{
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",BENDIXINXI]];
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
        [usersDic setValue:@"0" forKey:@"ydybookxq"];//新书详情
        [usersDic setValue:@"0" forKey:@"ydydati"];
        [usersDic setValue:@"0" forKey:@"ydylqrw"];
        [usersDic setValue:@"0" forKey:@"ydyqbrw"];
        [usersDic setValue:@"0" forKey:@"ydyzhuanzhuanzhuan"];//转转转
        [usersDic setValue:@"0" forKey:@"zhishiwang"];//知识网
        
        [usersDic writeToFile:filePatch atomically:YES];
    }
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

- (void)kaijiangdaojishi{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_KJTS];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    //            NSDictionary * dic = @{@"studentid":@"12"};
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
    if (![model.remaindDays isEqualToString:@"0"]) {
        TUpView * view = [TUpView new];
        view.nav = self.navigationController;
        view.model = model;
        [self.view.window addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.view.window);
        }];
    }
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
@end
