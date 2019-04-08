//
//  ZhiShiShuXQImagesAndTitle.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuXQImagesAndTitle.h"
#import <WebKit/WebKit.h>

@interface ZhiShiShuXQImagesAndTitle ()<UIScrollViewDelegate,WKNavigationDelegate,WKScriptMessageHandler>{
    NSInteger page;
    CAGradientLayer *gradient;
    BOOL ani;
}

@end

@implementation ZhiShiShuXQImagesAndTitle{
    UIScrollView * scrollViewback;
    FLAnimatedImageView * neirongimage;
    WKWebView *webView;
    
    BaseView * backview;
    BaseLabel * nrtitle;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        page = 0;
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    backview = [BaseView new];
    backview.layer.masksToBounds = YES;
    backview.layer.cornerRadius = LENGTH(43);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(327));
        make.height.mas_equalTo(LENGTH(472));
    }];
    gradient = [CAGradientLayer layer];
    [backview.layer addSublayer:gradient];
    
    BaseView * bacv = [BaseView new];
    bacv.backgroundColor = [UIColor whiteColor];
    [backview addSubview:bacv];
    [bacv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->backview).with.insets(UIEdgeInsetsMake(LENGTH(5), LENGTH(5), LENGTH(5), LENGTH(5)));

    }];
    bacv.backgroundColor = [UIColor whiteColor];
    bacv.layer.masksToBounds = YES;
    bacv.layer.cornerRadius = LENGTH(40);
    bacv.layer.shadowOpacity = 1;
    bacv.layer.shadowColor = RGB(1,149,151).CGColor;
    bacv.layer.shadowRadius = 2.0f;
    bacv.layer.shadowOffset = CGSizeMake(0,0);
    
    scrollViewback = [UIScrollView new];
    scrollViewback.backgroundColor = [UIColor whiteColor];
    scrollViewback.delegate = self;
    scrollViewback.userInteractionEnabled = YES;
//    scrollViewback.pagingEnabled = YES;
    scrollViewback.bounces = NO;
    scrollViewback.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scrollViewback.showsHorizontalScrollIndicator = NO;
    [backview addSubview:scrollViewback];
    [scrollViewback mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->backview).with.insets(UIEdgeInsetsMake(LENGTH(17), LENGTH(17), LENGTH(17), LENGTH(17)));
    }];

    
    
    neirongimage = [FLAnimatedImageView new];
//    leftsanjiao.image = UIIMAGE(@"箭头左");
    [scrollViewback addSubview:neirongimage];
    [neirongimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->scrollViewback).with.offset(LENGTH(10));
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(17));
        make.right.mas_equalTo(self->backview).with.offset(-LENGTH(17));
        make.height.mas_offset(LENGTH(30));
    }];
    
    webView = [[WKWebView alloc] initWithFrame:self.bounds];
    webView.navigationDelegate = self;
    webView.scrollView.bounces = NO;
    [scrollViewback addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->neirongimage.mas_bottom).with.offset(LENGTH(10));
        make.right.equalTo(bacv).with.offset(-LENGTH(17));
        make.left.equalTo(bacv).with.offset(LENGTH(17));
        make.bottom.equalTo(self->scrollViewback.mas_bottom).with.offset(0);
        make.height.mas_equalTo(1);
    }];
    
    FLAnimatedImageView * titleview = [FLAnimatedImageView new];
    titleview.image = UIIMAGE(@"title");
    [self addSubview:titleview];
    [titleview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backview);
        make.top.mas_equalTo(self->backview.mas_top).with.offset(-LENGTH(19));
        make.width.mas_equalTo(LENGTH(137));
        make.height.mas_equalTo(LENGTH(38));
    }];
    
    nrtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor whiteColor] LabelFont:TextFont(25) TextAlignment:NSTextAlignmentCenter Text:@""];
    [titleview addSubview:nrtitle];
    [nrtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(titleview).with.insets(UIEdgeInsetsMake(LENGTH(3), LENGTH(3), LENGTH(3), LENGTH(3)));
    }];

}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
}


//滑动停止时调用


- (void)layoutSubviews{
    [super layoutSubviews];
    
    gradient.frame = backview.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[BaseObject colorWithHexString:@"#6ce5cd" Alpha:1].CGColor,
                       (id)[BaseObject colorWithHexString:@"#41d4c6" Alpha:1].CGColor,nil];
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1, 0.5);
    gradient.locations = @[@0.0, @1];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '350%'"completionHandler:nil];

    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [webView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(webView.scrollView.contentSize.height);
        }];
    });
}

- (void)setModel:(ZhiShiShuXqStyle2Model *)model{
    _model = model;
    nrtitle.text = model.name;
    NSMutableArray * imagearray = [NSMutableArray array];
    for (NSString * image in model.img) {
        NSString * imageurl = [NSString stringWithFormat:@"%@%@",ZSTXIMAGEURL,image];
        [imagearray addObject:imageurl];
    }
    if (imagearray.count ==0) {
        
    }else{
        [neirongimage layoutIfNeeded];
        [neirongimage sd_setImageWithURL:[NSURL URLWithString:imagearray[0]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            CGFloat bl = image.size.width/image.size.height*1.000;
            CGFloat hei = self->neirongimage.frame.size.width/bl*1.000;
            [self->neirongimage mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(hei);
            }];
        }];
    }
    NSString * str = model.desc;
    [webView loadHTMLString:str baseURL:nil];
    
    
}

@end
