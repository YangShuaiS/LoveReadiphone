//
//  ArticleScroTopView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ArticleScroTopView.h"
#import "ArticleShareView.h"
#import "ArticleTopView.h"
#import <WebKit/WebKit.h>
@interface ArticleScroTopView ()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler,UIScrollViewDelegate>

@end
@implementation ArticleScroTopView{
    WKWebView *webView;
    ArticleShareView * share;
    BaseLabel * time;
    BaseLabel * name;
    ArticleTopView * topView;

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
    
    topView = [ArticleTopView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->name.mas_bottom).with.offset(10);
        make.left.and.right.mas_equalTo(ws);
    }];
    
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(182,181,181) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->topView.mas_bottom).with.offset(10);
        make.left.equalTo(ws).with.offset(LENGTH(20));
    }];

    
    webView = [[WKWebView alloc] initWithFrame:self.bounds];
    webView.navigationDelegate = self;
    webView.UIDelegate = self;
    webView.backgroundColor = [UIColor clearColor];
    webView.scrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->time.mas_bottom).with.offset(LENGTH(13));
        make.right.equalTo(ws);
        make.left.equalTo(ws);
        make.height.mas_equalTo(1);
    }];
    
    
    share = [ArticleShareView new];
    [self addSubview:share];
    [share mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->webView.mas_bottom);
        make.left.and.right.and.bottom.mas_equalTo(ws);
    }];
}
- (void)setModel:(LunBoTuXQModel *)model{
    _model = model;

    [self addview];

    time.text = [BaseObject TiemArray:model.banner.create_time String:@" "][0];
    name.text = model.banner.title;
    topView.model = model;
    NSString * str = model.banner.content;
    NSString *headerString = @"<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></header>";
    [webView loadHTMLString:[headerString stringByAppendingString:str] baseURL:nil];
    
    share.atype = @"1";
    share.imageurl = [NSString stringWithFormat:@"%@%@",IMAGEURL,model.banner.banner_img];
    share.wzbt = model.banner.title;
    share.textid = model.banner.ssid;
    share.bookname = model.banner.title;
    share.model = model;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    _sizeheight = topView.frame.origin.y;
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
        [webView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(webView.scrollView.contentSize.height);
        }];
    });
    
    
}
@end
