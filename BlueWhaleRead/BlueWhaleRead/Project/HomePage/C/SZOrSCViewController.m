//
//  SZOrSCViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "SZOrSCViewController.h"
#import "SZorSCView.h"
#import "SZOrSCJieGuoViewController.h"
#import "BeiJingView.h"
@interface SZOrSCViewController ()<NavDelegate>

@end

@implementation SZOrSCViewController{
    BaseLabel * page;
    NSMutableArray * itemarray;
    SZorSCView * szsc;
    NSInteger nows;
    NSInteger all;
    
    NSString * jg;
    SZOrSCJieGuoViewController * vc;

}
#pragma mark ------------- 请求数据
- (void)loadUpData{
    if (nows == all) {
        szsc.dtdownstyle = DTStyleWithPushUp;
    }else{
        szsc.dtdownstyle = DTStyleWithOneNext;
    }
    if ([_titles isEqualToString:@"识字量检测"]) {
        [self loadszl];
    }else if ([_titles isEqualToString:@"识词量检测"]){
        [self loadscl];
    }
}

- (void)loadszl{
    NSString * url;
    NSDictionary * dic;
    if (all == 0) {
        url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TISHIZILIANGKS];
        dic = @{@"studentid":Me.ssid};
    }else if (all == nows){
        url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TISHIZILIANGJG];
        SZLListModel * m = szsc.collectView.yhxx;
        ShiZiLiangModel * m1 = szsc.szorci;
        NSString * litid;
        if (m == nil) {
            litid = @"0";
        }else{
            litid = m.LiteracyId;
        }
        dic = @{@"studentid":Me.ssid,@"answerid":litid,@"literacyid":m1.LiteracyId};
    }else{
        url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TISHIZILIANGNEXT];
        SZLListModel * m = szsc.collectView.yhxx;
        ShiZiLiangModel * m1 = szsc.szorci;
        NSString * litid;
        if (m == nil) {
            litid = @"0";
        }else{
            litid = m.LiteracyId;
        }
        dic = @{@"studentid":Me.ssid,@"answerid":litid,@"literacyid":m1.LiteracyId};
    }
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ShiZiLiangModel * model = [ShiZiLiangModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }
        }else{
            
        }
    }];
}

- (void)UpData:(ShiZiLiangModel *)model{

    if (all == 0) {
        all = model.TestTime;
        nows = 1;
    }
    if (nows == all) {
        jg = model.LiteracyScore;
        vc = [SZOrSCJieGuoViewController new];
        vc.jg = jg;
        vc.titles = _titles;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        szsc.szorci = model;

    }
    page.text = [NSString stringWithFormat:@"%ld/%ld",nows,all];
    nows++;
}

- (void)loadscl{
    NSString * url;
    NSDictionary * dic;
    if (all == 0) {
        url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TISHICILIANGKS];
        dic = @{@"studentid":Me.ssid};
    }else if (all == nows){
        url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TISHIVILIANGJG];
        SZLListModel * m = szsc.collectView.yhxx;
        ShiZiLiangModel * m1 = szsc.szorci;
        NSString * litid;
        if (m == nil) {
            litid = @"0";
        }else{
            litid = m.LiteracyId;
        }
        dic = @{@"studentid":Me.ssid,@"answerid":litid,@"glossaryid":m1.LiteracyId};
    }else{
        url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TISHICILIANGNEXT];
        SZLListModel * m = szsc.collectView.yhxx;
        ShiZiLiangModel * m1 = szsc.szorci;
        NSString * litid;
        if (m == nil) {
            litid = @"0";
        }else{
            litid = m.LiteracyId;
        }
        dic = @{@"studentid":Me.ssid,@"answerid":litid,@"glossaryid":m1.LiteracyId};
    }
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ShiZiLiangModel * model = [ShiZiLiangModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }
            
        }else{
            
        }
    }];
}

- (void)UpDatasc:(ShiCiLiangModel *)model{

//    if (all == 0) {
//        all = model.TestTime;
//        nows = 1;
//    }
//    if (nows == all) {
//        jg = model.GlossaryScore;
//    }else{
//        szsc.szorci = model;
//
//    }
//    page.text = [NSString stringWithFormat:@"%ld/%ld",nows,all];
//    nows++;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    nows =1;
    all = 0;
    [self loadUpData];
    
    BeiJingView * backImageView = [BeiJingView new];
    [self.view addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    
    page = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"1/1"];
    [self.view addSubview:page];
    [page mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(LENGTH(15));
        make.top.equalTo(ws.view).with.offset(NavHeight+LENGTH(12));
    }];
    
    szsc = [SZorSCView new];
    szsc.delegate = self;
    szsc.nav = self.navigationController;
    szsc.dtdownstyle = DTStyleWithOneNext;
    szsc.titles = _titles;
    [self.view addSubview:szsc];
    [szsc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    szsc.userInteractionEnabled = YES;
    [self AddNavtion];

}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:_titles RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.backgroundColor = [UIColor clearColor];
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
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                   message:@"小朋友，识字率检测还没做完\n确认要退出检测吗？"
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
                                                                 self.navigationController.interactivePopGestureRecognizer.enabled = YES;
                                                             }
                                                             [self.navigationController popToRootViewControllerAnimated:YES];
                                                         }];

    [cancelAction setValue:RGB(24,59,161) forKey:@"titleTextColor"];
    [defaultAction setValue:RGB(14,13,13) forKey:@"titleTextColor"];
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];

    NSMutableAttributedString *hogan1 = [[NSMutableAttributedString alloc] initWithString:@"小朋友，识字率检测还没做完\n确认要退出检测吗？"];
    [alert setValue:hogan1 forKey:@"attributedMessage"];
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"小朋友，识字率检测还没做完\n确认要退出检测吗？" preferredStyle:UIAlertControllerStyleAlert];
//
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//
//    //设置cancelAction的title颜色
//
//    [cancelAction setValue:RGB(14,13,13) forKey:@"titleTextColor"];
//
//    //设置cancelAction的title的对齐方式
//
//    [cancelAction setValue:[NSNumber numberWithInteger:NSTextAlignmentLeft] forKey:@"titleTextAlignment"];
//
//    [alertController addAction:cancelAction];
//
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//
//    //设置okAction的title颜色
//
//    [okAction setValue:RGB(24,59,161) forKey:@"titleTextColor"];
//
//    [alertController addAction:okAction];
//
//    //Custom Title,使用富文本来改变title的字体大小
//
//
//    NSMutableAttributedString *hogan1 = [[NSMutableAttributedString alloc] initWithString:@"小朋友，识字率检测还没做完\n确认要退出检测吗？"];
//
//    [alertController setValue:hogan1 forKey:@"attributedMessage"];
//
//    [self presentViewController:alertController animated:YES  completion:nil];
    

}
- (void)pushjieguo{
    [self loadUpData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)PushFriendViewCOntroller:(PushModel *)model{
    switch (model.style) {
        case PushDaTiJieGuo:
            [self pushjieguo];
            break;
        case DaTiTiaoCHuanXiaYiTi:
            [self NextTI];
            break;
        default:
            break;
    }
}
- (void)NextTI{
    [self loadUpData];
}

- (void)setTitles:(NSString *)titles{
    _titles = titles;
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
