//
//  HuiBenView.m
//  DiaoYanDemoS
//
//  Created by 杨帅 on 2018/11/16.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HuiBenView.h"
#import "HuiBenImageView.h"
#import <QuartzCore/QuartzCore.h>
typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转
} AnimationType;

@implementation HuiBenView{
    UIScrollView * scrollView;
    HuiBenImageView * imageview;
    
    NSInteger page;
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
    scrollView = [UIScrollView new];
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.bounces = NO;
    scrollView.minimumZoomScale = 0.5;
    scrollView.maximumZoomScale = 10;
    scrollView.directionalLockEnabled=YES;//定向锁定
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
    }];
//    self.backgroundColor = [UIColor whiteColor];
    
    imageview = [HuiBenImageView new];
    [scrollView addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->scrollView);
        make.size.mas_equalTo(ws);
    }];
    
    FLAnimatedImageView * lastImageview = [FLAnimatedImageView new];
    lastImageview.contentMode = UIViewContentModeScaleAspectFit;
    lastImageview.image = UIIMAGE(@"上一页");
    [self addSubview:lastImageview];
    [lastImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(-TabBarHeight-LENGTH(50));
        make.left.mas_equalTo(20);
        make.width.and.height.mas_equalTo(LENGTH(50));
    }];
    
    BaseButton * oneButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [oneButton addTarget:self action:@selector(oneButton) forControlEvents:UIControlEventTouchUpInside];
    [oneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:oneButton];
    [oneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(-TabBarHeight-LENGTH(50));
        make.left.mas_equalTo(20);
        make.width.and.height.mas_equalTo(LENGTH(50));

    }];
    
    FLAnimatedImageView * nextImageview = [FLAnimatedImageView new];
    nextImageview.image = UIIMAGE(@"下一页");
    nextImageview.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:nextImageview];
    [nextImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(-TabBarHeight-LENGTH(50));
        make.right.mas_equalTo(-20);
        make.width.and.height.mas_equalTo(LENGTH(50));

    }];
    
    BaseButton * twoButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [twoButton addTarget:self action:@selector(twoButton) forControlEvents:UIControlEventTouchUpInside];
    [twoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:twoButton];
    [twoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(-TabBarHeight-LENGTH(50));
        make.right.mas_equalTo(-20);
        make.width.and.height.mas_equalTo(LENGTH(50));

    }];

//            NSTimer *timer = [NSTimer timerWithTimeInterval:3.5 target:self selector:@selector(test) userInfo:nil repeats:YES];
//            // 将定时器添加到runloop中，否则定时器不会启动
//            [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
//- (void)test{
//    NSString *subtypeString;
//    subtypeString = kCATransitionFromTop;
//    [self transitionWithType:@"CurlUp" WithSubtype:subtypeString ForView:self];
//
//}
- (void)oneButton{
    if (page <_pngarray.count&&page>0) {
        page --;
        imageview.imageview.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",_pngfile,_pngarray[page]]];
        [self transformAnimation:@"pageUnCurl" Type:kCATransitionFromRight];
    }else{
//        page = 0;
    }
}

- (void)twoButton{
    if (page <_pngarray.count-1&&page>=0) {
        page ++;
        imageview.imageview.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",_pngfile,_pngarray[page]]];
        [self transformAnimation:@"pageCurl" Type:kCATransitionFromRight];

    }else{
//        page = 0;
    }
}
#pragma CATransition动画实现
- (void)transformAnimation:(NSString *)AnimationType Type:(CATransitionSubtype)type{
//    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = AnimationType;//设置动画的类型
    anima.subtype = type; //设置动画的方向
    //anima.startProgress = 0.3;//设置动画起点
    //anima.endProgress = 0.8;//设置动画终点
    anima.duration = 0.8;
    [self.layer addAnimation:anima forKey:AnimationType];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

}

#define mark ---------------- 放大
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return imageview;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {

    CGRect frame = imageview.frame;

    frame.origin.y = (scrollView.frame.size.height - imageview.frame.size.height) > 0 ? (scrollView.frame.size.height - imageview.frame.size.height) * 0.5 : 0;
    frame.origin.x = (scrollView.frame.size.width - imageview.frame.size.width) > 0 ? (scrollView.frame.size.width - imageview.frame.size.width) * 0.5 : 0;
    imageview.frame = frame;

    scrollView.contentSize = CGSizeMake(imageview.frame.size.width + 30, imageview.frame.size.height + 30);
}
- (void)layoutSubviews{
    [super layoutSubviews];
}

- (void)setPngarray:(NSArray *)pngarray{
    _pngarray = pngarray;
    page = 0;
    if (_pngarray.count > 0) {
        imageview.imageview.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",_pngfile,_pngarray[page]]];
    }
}
@end
