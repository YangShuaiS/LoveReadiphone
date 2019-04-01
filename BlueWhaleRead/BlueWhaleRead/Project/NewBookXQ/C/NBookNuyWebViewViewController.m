//
//  NBookNuyWebViewViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/22.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBookNuyWebViewViewController.h"
#import <WebKit/WebKit.h>

@interface NBookNuyWebViewViewController ()<NavDelegate,WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler,UIScrollViewDelegate>

@end

@implementation NBookNuyWebViewViewController{
    WKWebView *webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    self.view.backgroundColor = BEIJINGCOLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self addView];
}
- (void)addView{
    WS(ws);
    webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    webView.navigationDelegate = self;
    webView.UIDelegate = self;
    webView.allowsBackForwardNavigationGestures = YES;
    webView.backgroundColor = [UIColor clearColor];
    webView.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(1));
        make.right.equalTo(ws.view);
        make.left.equalTo(ws.view);
        make.bottom.equalTo(ws.view);
    }];
//    //可返回的页面列表, 存储已打开过的网页
//    WKBackForwardList * backForwardList = [webView backForwardList];
//    //页面后退
//    [webView goBack];
//    //页面前进
//    [webView goForward];
//    //刷新当前页面
//    [webView reload];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_url]];
    [webView loadRequest:request];

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
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    //开始加载
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    //加载完成
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
    //网络错误
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    WKNavigationActionPolicy policy = WKNavigationActionPolicyAllow;

//        WKNavigationActionPolicypolicy =WKNavigationActionPolicyAllow;/* 判断itunes的host链接 */if([[navigationAction.request.URL host] isEqualToString:@"itunes.apple.com"] &&[[UIApplicationsharedApplication] openURL:navigationAction.request.URL]){policy =WKNavigationActionPolicyCancel;}decisionHandler(policy);
    if([[navigationAction.request.URL host] isEqualToString:@"itunes.apple.com"] &&[[UIApplication sharedApplication] openURL:navigationAction.request.URL]){
        policy =WKNavigationActionPolicyCancel;
    }else{
        if ([[navigationAction.request.URL host] isEqualToString:@"virtual"]||[[navigationAction.request.URL host] isEqualToString:@"page.tm"]) {
//            policy =WKNavigationActionPolicyCancel;
            NSURL * requestURL = navigationAction.request.URL;
            [[UIApplication sharedApplication] openURL:requestURL];
            [webView goBack];
        }
        
    }
//    if([[UIApplication sharedApplication] canOpenURL:requestURL]) {
//        [[UIApplication sharedApplication] openURL:requestURL];
//    }

    decisionHandler(policy);
//    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{

}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler
{
    completionHandler(NO);
}
- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
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
