//
//  NBCThemeViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCThemeViewController.h"
#import <WebKit/WebKit.h>
#import "NewBookXQViewController.h"
#import "FenXiangView.h"
#import "HaiBaoView.h"

//#import <WebViewJavascriptBridge.h>
@interface NBCThemeViewController ()<WKNavigationDelegate,NavDelegate,WKUIDelegate,WKScriptMessageHandler>
//@property(nonatomic,strong)WebViewJavascriptBridge* bridge;
@end

@implementation NBCThemeViewController{
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
    self.navtive.backgroundColor = [UIColor whiteColor];
    self.navtive.layer.shadowColor = RGB(0, 0, 0).CGColor;
    self.navtive.layer.shadowOffset = CGSizeMake(0,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.navtive.layer.shadowRadius = LENGTH(4);
    self.navtive.layer.shadowOpacity = 0.04;
    
    FLAnimatedImageView * sharefriend = [FLAnimatedImageView new];
    sharefriend.image = UIIMAGE(@"组 928");
    sharefriend.contentMode = UIViewContentModeScaleAspectFit;
    [self.navtive addSubview:sharefriend];
    [sharefriend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_top).with.offset(StatusBar+10);
        make.right.mas_equalTo(ws.navtive.mas_right).with.offset(-20);
        //        make.size.mas_equalTo(sharefriend.image.size);
        make.width.and.height.mas_equalTo(24);
    }];
    sharefriend.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(FenXiang)];
    [sharefriend addGestureRecognizer:tap];
}

- (void)FenXiang{
    
    NSString * title = @"";
    if (webview.title.length == 0) {
        title = @"";
    }else{
        title = webview.title;
    }
    FenXiangView * fenxiangs = [FenXiangView new];
    fenxiangs.vc = self;
    if (_style == 1) {
        fenxiangs.atype = @"1";
    }else{
        fenxiangs.atype = @"2";
    }
    fenxiangs.imageurl = _imageurl;
    fenxiangs.wzbt = title;
    fenxiangs.textid = _bannerid;
    fenxiangs.bookname = title;
    fenxiangs.sharestyle = ShareStyleTag9;
    [self.view addSubview:fenxiangs];
    WS(ws);
    [fenxiangs mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    [fenxiangs setBlock:^(FenXiangModel *model, ShareStyle sharestyle) {
        [self addhabai:model Style:sharestyle];
    }];
    
}

- (void)addhabai:(FenXiangModel *)model Style:(ShareStyle)style{
    HaiBaoView * haibao = [HaiBaoView new];
    haibao.sharestyle = style;
    haibao.modes = model;
    [self.view addSubview:haibao];
    WS(ws);
    [haibao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
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
    webview.navigationDelegate = self;
    webview.UIDelegate = self;
    [self.view addSubview:webview];
    WS(ws);
    [webview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(6));
        make.left.and.bottom.and.right.mas_equalTo(ws.view);
    }];
    
    [[webview configuration].userContentController addScriptMessageHandler:self name:@"getMessage"];
    
//    if (_bridge) {
//        return;
//    }
//    [WebViewJavascriptBridge enableLogging];
//    _bridge = [WebViewJavascriptBridge bridgeForWebView:webview];
//    [_bridge setWebViewDelegate:self];
//
//    [_bridge registerHandler:@"jumpToArticleDetail" handler:^(id data, WVJBResponseCallback responseCallback) {
//        // data js页面传过来的参数  假设这里是用户名和姓名，字典格式
//        NSLog(@"JS调用OC，并传值过来");
//
//        // 利用data参数处理自己的逻辑
//        NSDictionary *dict = (NSDictionary *)data;
//        // responseCallback 给后台的回复
//        responseCallback(@"报告，oc已收到js的请求");
//    }];

}

- (void)setBannerid:(NSString *)bannerid{
    _bannerid = bannerid;
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_LBTXQ];
    NSDictionary * dic = @{@"bannerid":bannerid,@"studentid":Me.ssid};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            LunBoTuXQModel * model = [LunBoTuXQModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self updata:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}


- (void)updata:(LunBoTuXQModel *)model{
    NSString * str = model.banner.content;
//    NSString *headerString = @"<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></header>";
//    [webview loadHTMLString:[headerString stringByAppendingString:str] baseURL:nil];
    [webview loadHTMLString:str baseURL:nil];
//    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.1.117/share_tiantian/aaaa.html"]]];
}
//
//- (void)webViewDidFinishLoad:(UIWebView *)webView
//{
//
//}
//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
//
//{
//
//    //判断是否是单击
//
//    if (navigationType == UIWebViewNavigationTypeLinkClicked)
//
//    {
//
//        NSURL *url = [request URL];
//
////        if([[UIApplication sharedApplication]canOpenURL:url])
////
////        {
////
////            [[UIApplication sharedApplication]openURL:url];
////
////        }
////
//        return NO;
//
//    }
//
//    return YES;
//
//}


- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    //开始加载
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    self.navtive.title = webView.title;
    //加载完成
    //这里可以接受web前端的方法，用来初始化web页面的信息
//    [webView evaluateJavaScript:@"setTing()" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
//        //当然在这个setTing()返回的数据可以是个字典的数据形式。
//    }];
    [webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '100%'"completionHandler:nil];
//    [webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.background='#edf3f3'"completionHandler:nil];

}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
    //网络错误
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{

    decisionHandler(WKNavigationActionPolicyAllow);
    //允许webView的点击时数据的获取
}


- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
//    NSDictionary *dic = [NSDictionary parseJSONStringToNSDictionary:message];
//    NewBookXQViewController * vc = [NewBookXQViewController new];
//    vc.loadId = message;
//    [self.navigationController pushViewController:vc animated:YES];
    completionHandler();
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler
{
    completionHandler(NO);
}

- (void)dealloc{

}



- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSLog(@"name = %@, body = %@", message.name, message.body);
    NSDictionary *dic = message.body;
        NewBookXQViewController * vc = [NewBookXQViewController new];
        vc.loadId = dic[@"id"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
