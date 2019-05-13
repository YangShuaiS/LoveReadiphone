//
//  ArticleScroTopView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ArticleScroTopView.h"
#import <WebKit/WebKit.h>
@interface ArticleScroTopView ()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler,UIScrollViewDelegate>

@end
@implementation ArticleScroTopView{
    WKWebView *webView;
    BaseLabel * time;
    BaseLabel * name;

}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    self.backgroundColor = [UIColor whiteColor];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(8,8,8) LabelFont:TextFontCu(22) TextAlignment:NSTextAlignmentLeft Text:@""];
    name.numberOfLines = 0;
    [self addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(20));
        make.right.equalTo(ws).with.offset(-LENGTH(20));
        make.left.equalTo(ws).with.offset(LENGTH(20));
    }];
    
    _topView = [ArticleTopView new];
    [self addSubview:_topView];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->name.mas_bottom).with.offset(10);
        make.left.and.right.mas_equalTo(ws);
    }];
    
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(182,181,181) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.topView.mas_bottom).with.offset(10);
        make.left.equalTo(ws).with.offset(LENGTH(20));
    }];
    
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.preferences = [WKPreferences new];
    config.preferences.minimumFontSize = 10;
    config.preferences.javaScriptEnabled = YES;
    config.preferences.javaScriptCanOpenWindowsAutomatically = YES;   //下方代码，禁止缩放
    WKUserContentController *userController = [WKUserContentController new];
    NSString *js = @" $('meta[name=description]').remove(); $('head').append( '<meta name=\"viewport\" content=\"width=device-width, initial-scale=1,user-scalable=no\">' );";
    WKUserScript *script = [[WKUserScript alloc] initWithSource:js injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:NO];
    NSMutableString *javascript = [NSMutableString string];
    [javascript appendString:@"document.documentElement.style.webkitTouchCallout='none';"];//禁止长按
    [javascript appendString:@"document.documentElement.style.webkitUserSelect='none';"];//禁止选择
    WKUserScript *noneSelectScript = [[WKUserScript alloc] initWithSource:javascript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    [userController addUserScript:script];
    [userController addUserScript:noneSelectScript];
    [userController addScriptMessageHandler:self name:@"openInfo"];
    config.userContentController = userController;
    
    webView = [[WKWebView alloc] initWithFrame:self.bounds configuration:config];
    webView.navigationDelegate = self;
    webView.UIDelegate = self;
    webView.backgroundColor = [UIColor clearColor];
    webView.scrollView.backgroundColor = [UIColor clearColor];
    webView.scrollView.bounces = NO;//禁止滑动
    
    
    //    webView.scalesPageToFit = YES;
    //    webView.multipleTouchEnabled = YES;
    webView.userInteractionEnabled = NO;
    webView.scrollView.scrollEnabled = NO;
    //    webView.contentMode = UIViewContentModeScaleAspectFit;
    webView.scrollView.delegate = self;
    [self addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->time.mas_bottom).with.offset(LENGTH(13));
        make.right.equalTo(ws);
        make.left.equalTo(ws);
        make.height.mas_equalTo(1);
        make.bottom.mas_equalTo(ws);
    }];
    
}
- (void)setModel:(LunBoTuXQModel *)model{
    _model = model;

    [self addview];

    time.text = [BaseObject TiemArray:model.banner.create_time String:@" "][0];
    name.text = model.banner.title;
    _topView.model = model;
    NSString * str = model.banner.content;
    NSString *headerString = @"<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></header>";
    [webView loadHTMLString:[headerString stringByAppendingString:str] baseURL:nil];
//    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.1.124/chuhan/sun.html"]]];

}
- (void)layoutSubviews{
    [super layoutSubviews];
    _sizeheight = _topView.frame.origin.y;
    _titleheight = name.frame.origin.y+name.frame.size.height;
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    //    self.navtive.title = webView.title;
    //加载完成
    //这里可以接受web前端的方法，用来初始化web页面的信息
    //    [webView evaluateJavaScript:@"setTing()" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
    //        //当然在这个setTing()返回的数据可以是个字典的数据形式。
    //    }];
    //    if (_inter == 1) {
    //        [webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '200%'"completionHandler:nil];
    //
    //    }else{
    //        [webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '100%'"completionHandler:nil];
    //
    //    }
    //    [webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.background='#edf3f3'"completionHandler:nil];
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        [webView.scrollView setZoomScale:WIDTH/600 animated:YES];
//        [webView layoutIfNeeded];
        [webView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(webView.scrollView.contentSize.height);
        }];
    });
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    scrollView.contentOffset = CGPointMake((scrollView.contentSize.width - WIDTH) / 2, scrollView.contentOffset.y);
}
@end
