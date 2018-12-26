//
//  TakGFGLViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TakGFGLViewController.h"
#import <WebKit/WebKit.h>

@interface TakGFGLViewController ()<WKNavigationDelegate,NavDelegate,WKUIDelegate,WKScriptMessageHandler>

@end

@implementation TakGFGLViewController{
    WKWebView * webview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self Addview];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"" RightTitle:@"" NativeStyle:NavStyleGeneral];
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
- (void)Addview{
    webview = [WKWebView new];

    [self.view addSubview:webview];
    WS(ws);
    [webview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(0));
        make.left.and.bottom.and.right.mas_equalTo(ws.view);
    }];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
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
