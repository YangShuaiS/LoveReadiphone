//
//  LBTViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "LBTViewController.h"
#import "FenXiangView.h"
#import "HaiBaoView.h"

#import <WebKit/WebKit.h>
#import "BookXqViewController.h"
@interface LBTViewController ()<NavDelegate,WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler>

@end

@implementation LBTViewController{
    UIScrollView * scrollView;
    FLAnimatedImageView * topImageView;
    BaseLabel * time;
    BaseLabel * name;
    BaseLabel * down;
    
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
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = RGB(237,243,243);
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
//    if ([IOS_X integerValue]>=11.0) {
//        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    }
    WS(ws);
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view);
    }];
    
//    topImageView = [FLAnimatedImageView new];
//    topImageView.image = UIIMAGE(@"bg_推荐书籍");
//    [scrollView addSubview:topImageView];
//    [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->scrollView.mas_top).with.offset(0);
//        make.left.equalTo(ws.view).with.offset(0);
//        make.right.equalTo(ws.view).with.offset(0);
//        make.height.mas_equalTo(LENGTH(155));
//    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(8,8,8) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@""];
    name.numberOfLines = 0;
    [scrollView addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->scrollView.mas_top).with.offset(LENGTH(40));
        make.right.equalTo(ws.view).with.offset(-LENGTH(12));
        make.left.equalTo(ws.view).with.offset(LENGTH(12));
    }];
    
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(182,181,181) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"2012-12-12"];
    [scrollView addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->name.mas_bottom).with.offset(10);
        make.left.equalTo(ws.view).with.offset(LENGTH(12));
    }];
    
    
    webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    webView.navigationDelegate = self;
    webView.UIDelegate = self;
    webView.backgroundColor = [UIColor clearColor];
    webView.scrollView.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->time.mas_bottom).with.offset(LENGTH(10));
        make.right.equalTo(ws.view).with.offset(-LENGTH(12));
        make.left.equalTo(ws.view).with.offset(LENGTH(12));
        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(10));
        make.height.mas_equalTo(1);
    }];
        [[webView configuration].userContentController addScriptMessageHandler:self name:@"getMessage"];
    
//    down = [BaseLabel new];
//    down.numberOfLines = 0;
//    [scrollView addSubview:down];
//    [down mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->time.mas_bottom).with.offset(LENGTH(10));
//        make.right.equalTo(ws.view).with.offset(-LENGTH(26));
//        make.left.equalTo(ws.view).with.offset(LENGTH(26));
//        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(10));
//    }];

}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    
    FLAnimatedImageView * sharefriend = [FLAnimatedImageView new];
    sharefriend.image = UIIMAGE(@"告诉朋友");
    [self.navtive addSubview:sharefriend];
    [sharefriend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_top).with.offset(StatusBar);
        make.right.mas_equalTo(ws.navtive.mas_right).with.offset(-20);
        make.size.mas_equalTo(sharefriend.image.size);
    }];
    sharefriend.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(FenXiang)];
    [sharefriend addGestureRecognizer:tap];
}

- (void)FenXiang{
    FenXiangView * fenxiangs = [FenXiangView new];
    fenxiangs.atype = @"1";
    fenxiangs.vc = self;
    fenxiangs.imageurl = _imageurl;
    fenxiangs.wzbt = name.text;
    fenxiangs.textid = _itemid;
    fenxiangs.bookname = name.text;
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

- (void)setItemid:(NSString *)itemid{
    _itemid = itemid;
        NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_LBTXQ];
    NSDictionary * dic = @{@"bannerid":itemid,@"studentid":Me.ssid};
        
        [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
            if (responseObject) {
                LunBoTuXQModel * model = [LunBoTuXQModel mj_objectWithKeyValues:responseObject];
                if ([model.code isEqual:@200]) {
                    [self updata:model];
                }
            }else{
                
            }
        }];
}
- (void)updata:(LunBoTuXQModel *)model{
//    [topImageView sd_setImageWithURL:URLIMAGE(model.banner.banner_img) placeholderImage:UIIMAGE(@"bg_推荐书籍")];
    time.text = [BaseObject TiemArray:model.banner.create_time String:@" "][0];
//    name.text = model.banner.
    name.text = model.banner.title; 
    NSString * str = model.banner.content;
    [webView loadHTMLString:str baseURL:nil];
//    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[str
//                                                                             dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:
//                                                                                                                                      NSHTMLTextDocumentType} documentAttributes:nil error:nil];
//
//    down.attributedText = attrStr;
}
//- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='#edf3f3'"];
//    [webView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(webView.scrollView.contentSize.height);
//    }];
//    
//}
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    //开始加载
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
//    self.navtive.title = webView.title;
    //加载完成
    //这里可以接受web前端的方法，用来初始化web页面的信息
    //    [webView evaluateJavaScript:@"setTing()" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
    //        //当然在这个setTing()返回的数据可以是个字典的数据形式。
    //    }];
    if (_inter == 1) {
        [webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '200%'"completionHandler:nil];

    }else{
        [webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '100%'"completionHandler:nil];

    }
    [webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.background='#edf3f3'"completionHandler:nil];
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [webView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(webView.scrollView.contentSize.height);
        }];
    });

    
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
    BookXqViewController * vc = [BookXqViewController new];
    vc.loadId = message;
    [self.navigationController pushViewController:vc animated:YES];
    completionHandler();
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler
{
    completionHandler(NO);
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
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSDictionary *dic = message.body;
    BookXqViewController * vc = [BookXqViewController new];
    vc.loadId = dic[@"id"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
