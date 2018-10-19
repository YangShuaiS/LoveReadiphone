//
//  UserLoginViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserLoginViewController.h"
#import "UserlLoginTextFileView.h"
#import "BeiJingView.h"
@interface UserLoginViewController (){
    FLAnimatedImageView * userImageView;
    UserlLoginTextFileView * textFile;
}

@end

@implementation UserLoginViewController
- (void)ConfirmTheSize{
    UIView *statusBar = STAUBARHEIGHT;
    StatusBar = statusBar.frame.size.height;
    NavHeight = StatusBar+NAVIGATIONHeight;
    TabBarHeight = TABBARHeight;
    poinw = WIDTH/16;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self ConfirmTheSize];
    WS(ws);
    BeiJingView * backImageView = [BeiJingView new];
    [self.view addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    
    
    
    userImageView = [FLAnimatedImageView new];
    userImageView.image = UIIMAGE(ZHANWEITUTX);
    userImageView.layer.masksToBounds = YES;
    userImageView.layer.cornerRadius = LENGTH(86)/2;
    userImageView.backgroundColor = RGB(233,248,254);
    [self.view addSubview:userImageView];
    [userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.view.mas_top).with.offset(LENGTH(109));
        make.width.mas_equalTo(LENGTH(86));
        make.height.mas_equalTo(LENGTH(86));
    }];
    
    textFile = [UserlLoginTextFileView new];
    textFile.nav = self.navigationController;
    textFile.layer.masksToBounds = YES;
    textFile.layer.cornerRadius = LENGTH(5);
    [self.view addSubview:textFile];
    [textFile mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(self->userImageView.mas_bottom).with.offset(LENGTH(30));
        make.width.mas_equalTo(LENGTH(300));
    }];
    
    BaseLabel * dl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(233,249,254) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"登录"];
    dl.backgroundColor = RGB(32,210,242);
    dl.layer.masksToBounds = YES;
    dl.layer.cornerRadius = LENGTH(22);
    [self.view addSubview:dl];
    [dl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->textFile.mas_bottom).with.offset(LENGTH(94));
        make.height.mas_equalTo(LENGTH(44));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(96));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(96));

    }];
    dl.userInteractionEnabled = YES;
        //添加手势
        UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
        //将手势添加到需要相应的view中去
    [dl addGestureRecognizer:tapGesture1];
    
    backImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [backImageView addGestureRecognizer:tapGesture2];
}
- (void)tapGesture1{
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在登录...";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.view.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view.window);
    }];
    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_DENGLU];
    NSDictionary * dic = @{@"code":[textFile ZhangHao],@"password":[textFile MiMa]};
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

                    [mb hideAnimated:NO];
                    NSNotification *notification =[NSNotification notificationWithName:kNotificationDenglu object:nil userInfo:nil];
                    [[NSNotificationCenter defaultCenter] postNotification:notification];
                }else{
                    mb.label.text = m.message;
                    [mb hideAnimated:NO afterDelay:1];
                }
                
            }else{
                mb.label.text = @"网络请求失败";
                [mb hideAnimated:NO afterDelay:1];
            }
        }];
}

- (void)tapGesture2{
    [textFile returnKeyboard];
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
