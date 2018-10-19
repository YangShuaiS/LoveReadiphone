//
//  ZhiShiShuXQImagesAndTitle.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuXQImagesAndTitle.h"

@interface ZhiShiShuXQImagesAndTitle ()<UIScrollViewDelegate,UIWebViewDelegate>{
    NSInteger page;
    CAGradientLayer *gradient;
    BaseView * rightview;
    BaseView * leftview;
    
    BOOL ani;
}

@end

@implementation ZhiShiShuXQImagesAndTitle{
    UIScrollView * scrollView;
    UIScrollView * scrollViewback;
    UIWebView *webView;
    
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
        make.edges.mas_equalTo(self->backview).with.insets(UIEdgeInsetsMake(LENGTH(5), LENGTH(5), LENGTH(5), LENGTH(5)));
    }];
    
    scrollViewback.backgroundColor = [UIColor whiteColor];
    scrollViewback.layer.masksToBounds = YES;
    scrollViewback.layer.cornerRadius = LENGTH(40);
    scrollViewback.layer.shadowOpacity = 1;
    scrollViewback.layer.shadowColor = RGB(1,149,151).CGColor;
    scrollViewback.layer.shadowRadius = 2.0f;
    scrollViewback.layer.shadowOffset = CGSizeMake(0,0);
    
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scrollView.showsHorizontalScrollIndicator = NO;
    [scrollViewback addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(-LENGTH(56));
        make.left.equalTo(ws).with.offset(LENGTH(56));
        make.top.equalTo(self->scrollViewback.mas_top).with.offset(LENGTH(30));
        make.height.equalTo(self->scrollView.mas_width).multipliedBy(0.75);
    }];
    
    
    FLAnimatedImageView * leftsanjiao = [FLAnimatedImageView new];
    leftsanjiao.image = UIIMAGE(@"箭头左");
    [scrollViewback addSubview:leftsanjiao];
    [leftsanjiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->scrollView);
        make.left.mas_equalTo(self->scrollView).with.offset(-LENGTH(20));
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(23));
    }];
    
    leftview = [BaseView new];
    [scrollViewback addSubview:leftview];
    [leftview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->scrollView);
        make.left.mas_equalTo(self->scrollView).with.offset(-LENGTH(20));
        make.width.mas_equalTo(LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    FLAnimatedImageView * rightsanjiao = [FLAnimatedImageView new];
    rightsanjiao.image = UIIMAGE(@"箭头右");
    [scrollViewback addSubview:rightsanjiao];
    [rightsanjiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->scrollView);
        make.right.mas_equalTo(self->scrollView).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(23));
    }];
    
    rightview = [BaseView new];
    [scrollViewback addSubview:rightview];
    [rightview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->scrollView);
        make.right.mas_equalTo(self->scrollView).with.offset(LENGTH(50));
        make.width.mas_equalTo(LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    leftview.userInteractionEnabled = YES;
    rightview.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * left = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftbotton)];
    [leftview addGestureRecognizer:left];
    UITapGestureRecognizer * right = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightbutton)];
    [rightview addGestureRecognizer:right];
    
    webView = [[UIWebView alloc] initWithFrame:self.bounds];
    webView.delegate = self;
    [scrollViewback addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->scrollView.mas_bottom).with.offset(LENGTH(10));
        make.right.equalTo(self->backview).with.offset(-LENGTH(12));
        make.left.equalTo(self->backview).with.offset(LENGTH(12));
        make.bottom.equalTo(self->scrollViewback.mas_bottom).with.offset(-LENGTH(10));
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
    
    nrtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor whiteColor] LabelFont:[UIFont fontWithName:@"HYk1gj" size:FontSize(LENGTH(25))] TextAlignment:NSTextAlignmentCenter Text:@""];
    [titleview addSubview:nrtitle];
    [nrtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(titleview).with.insets(UIEdgeInsetsMake(LENGTH(3), LENGTH(3), LENGTH(3), LENGTH(3)));
    }];

}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    CGRect bounds = scrollView.frame;
    if ([scrollView isEqual:self->scrollView]) {
        if (page == _model.img.count+1) {
            page = 0;
            CGPoint resultPoint = CGPointMake(bounds.size.width, 0);//偏移量移动到第一个图片(前面有第0个图片)
            [self->scrollView setContentOffset:resultPoint animated:NO];//关闭动画效果
            ani = YES;
        }else if (page == 0){
            page = _model.img.count;
            CGPoint resultPoint = CGPointMake(bounds.size.width*_model.img.count, 0);//偏移量移动到第五个图片(后面有第六个图片)
            [self->scrollView setContentOffset:resultPoint animated:NO];
        }
    }

    
}

- (void)leftbotton{
    leftview.userInteractionEnabled = NO;
    rightview.userInteractionEnabled = NO;
    
    CGSize viewSize = scrollView.frame.size;
    CGRect bounds = scrollView.frame;
    if (page == 0){
        page = _model.img.count;
        CGPoint resultPoint = CGPointMake(bounds.size.width*page, 0);//偏移量移动到第五个图片(后面有第六个图片)
        [self->scrollView setContentOffset:resultPoint animated:NO];
    }
        page--;
    if (page<0) {
        page = 0;
    }
        CGRect rect = CGRectMake(page * viewSize.width, 0, viewSize.width, viewSize.height);
        [scrollView scrollRectToVisible:rect animated:YES];
    
    double delayInSeconds = 0.2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        self->leftview.userInteractionEnabled = YES;
        self->rightview.userInteractionEnabled = YES;
    });
}
- (void)rightbutton{
    leftview.userInteractionEnabled = NO;
    rightview.userInteractionEnabled = NO;
    
    CGRect bounds = scrollView.frame;
    if (page == _model.img.count+1) {
        page = 0;
        CGPoint resultPoint = CGPointMake(bounds.size.width, 0);//偏移量移动到第一个图片(前面有第0个图片)
        [self->scrollView setContentOffset:resultPoint animated:NO];//关闭动画效果
    }
    
    page++;
    if (page>_model.img.count+2) {
        page = _model.img.count+2;
    }
    if (ani == YES) {
        ani = NO;
        page++;
    }
    CGSize viewSize = scrollView.frame.size;
    CGRect rect = CGRectMake(page * viewSize.width, 0, viewSize.width, viewSize.height);
    [scrollView scrollRectToVisible:rect animated:YES];

    double delayInSeconds = 0.2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        self->leftview.userInteractionEnabled = YES;
        self->rightview.userInteractionEnabled = YES;
    });
}
//滑动停止时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //更新UIPageControl的当前页
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    page = offset.x / bounds.size.width;
    if ([scrollView isEqual:self->scrollView]) {
        if (page == _model.img.count+1) {
            page = 0;
            CGPoint resultPoint = CGPointMake(bounds.size.width, 0);//偏移量移动到第一个图片(前面有第0个图片)
            [self->scrollView setContentOffset:resultPoint animated:NO];//关闭动画效果
        }else if (page == 0){
            page = _model.img.count;
            CGPoint resultPoint = CGPointMake(bounds.size.width*page, 0);//偏移量移动到第五个图片(后面有第六个图片)
            [self->scrollView setContentOffset:resultPoint animated:NO];
        }
    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self->scrollView.contentSize = CGSizeMake(self->scrollView.frame.size.width*(self->_model.img.count+2), self->scrollView.frame.size.height);
    });
    
    gradient.frame = backview.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[BaseObject colorWithHexString:@"#6ce5cd"].CGColor,
                       (id)[BaseObject colorWithHexString:@"#41d4c6"].CGColor,nil];
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1, 0.5);
    gradient.locations = @[@0.0, @1];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='#ffffff'"];
    [webView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(webView.scrollView.contentSize.height);
    }];
    //方法1 实际使用js方法实现
    //    CGFloat documentWidth = [[webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('content').offsetWidth"] floatValue];
    //    CGFloat documentHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"content\").offsetHeight;"] floatValue];
    //    NSLog(@"documentSize = {%f, %f}", documentWidth, documentHeight);
    //
    //    //方法2
    //    CGRect frame = webView.frame;
    ////    frame.size.width = 768;
    ////    frame.size.height = 1;
    ////        webView.scrollView.scrollEnabled = NO;
    ////    webView.frame = frame;
    //    frame.size.height = webView.scrollView.contentSize.height;
    //    NSLog(@"frame = %@", [NSValue valueWithCGRect:frame]);
    //    webView.frame = frame;
    
}

- (void)setModel:(ZhiShiShuXqStyle2Model *)model{
    _model = model;
    nrtitle.text = model.name;
    NSMutableArray * imagearray = [NSMutableArray array];
    for (NSString * image in model.img) {
        NSString * imageurl = [NSString stringWithFormat:@"%@%@",ZSTX,image];
        [imagearray addObject:imageurl];
    }
    [imagearray insertObject:imagearray[imagearray.count-1] atIndex:0];
    [imagearray addObject:imagearray[1]];
    //过渡视图添加子视图
    FLAnimatedImageView *previousView =nil;
    for (int i = 0; i < imagearray.count; i++) {
        FLAnimatedImageView * imageView  = [FLAnimatedImageView new];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.layer.masksToBounds = YES;
        imageView.userInteractionEnabled = YES;
        [imageView sd_setImageWithURL:[NSURL URLWithString:imagearray[i]]];
        [scrollView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->scrollView);
            make.bottom.equalTo(self->scrollView);
            make.width.mas_equalTo(self->scrollView);
            make.height.mas_equalTo(self->scrollView);
            if (previousView)
            {
                make.left.mas_equalTo(previousView.mas_right);
            }
            else
            {
                make.left.mas_equalTo(self->scrollView);
            }
            
        }];
        previousView = imageView;
    }

    NSString * str = model.desc;
    [webView loadHTMLString:str baseURL:nil];
    
    
}

@end
