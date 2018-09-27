//
//  ZhiShiShuView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuView.h"
#import "ZhiShiShuNEiRong.h"
#import "ZhiShiSHuTanKuang.h"

static BOOL SDImageCacheOldShouldDecompressImages = YES;
static BOOL SDImagedownloderOldShouldDecompressImages = YES;
@implementation ZhiShiShuView{
    NSMutableArray * viewarray;
    NSMutableArray * layerarray;

    ZhiShiShuNEiRong * lastview;
//    CAShapeLayer * animLayer;
    CGFloat lastw;
    CGFloat lasth;
    NSInteger page;
    
    ZhiShiSHuTanKuang * tankuang;
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
    SDImageCache *canche = [SDImageCache sharedImageCache];
    // SDImageCacheOldShouldDecompressImages = canche.shouldDecompressImages;
    // canche.shouldDecompressImages = NO;
    // 上面的被废掉了，目前的写法是：
    SDImageCacheOldShouldDecompressImages = canche.config.shouldDecompressImages;
    canche.config.shouldDecompressImages = NO;
    
    SDWebImageDownloader *downloder = [SDWebImageDownloader sharedDownloader];
    SDImagedownloderOldShouldDecompressImages = downloder.shouldDecompressImages;
    downloder.shouldDecompressImages = NO;
    
    self.userInteractionEnabled = YES;
    page = 0;

    
    viewarray = [NSMutableArray array];
    layerarray = [NSMutableArray array];
    @autoreleasepool {
    for (int i = 0; i <100; i++) {
        ZhiShiShuNEiRong * imageview = [ZhiShiShuNEiRong new];
        [self addSubview:imageview];
        [viewarray addObject:imageview];
        }
    }
    
    for (int i = 0; i < viewarray.count; i++) {
        ZhiShiShuNEiRong * view = viewarray[i];
        NSInteger x = WIDTH*3;
        NSInteger y = HEIGHT*2;
        NSInteger sjx = arc4random() % x;
        NSInteger sjy = arc4random() % y;
        if (sjx>lastw) {
            lastw=sjx;

        }
        if (sjy>lasth) {
            lasth=sjy;
        }
//        NSLog(@"x=%ld,y=%ld",sjx,sjy);
//        view.center = CGPointMake(sjx, sjy);

        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.mas_equalTo(sjx);
//            make.centerY.mas_equalTo(sjy);
            make.left.mas_equalTo(sjx);
            make.top.mas_equalTo(sjy);

        }];
    }
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(WIDTH/2+self->lastw);
        make.height.mas_equalTo(HEIGHT/2+self->lasth);
    }];
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        for (int i = 0; i < self->viewarray.count; i++) {
                ZhiShiShuNEiRong * view = self->viewarray[i];
                [view addimage];
        }
    });
}
- (void)dealloc{
    SDImageCache *canche = [SDImageCache sharedImageCache];
    canche.config.shouldDecompressImages = SDImageCacheOldShouldDecompressImages;
    SDWebImageDownloader *downloder = [SDWebImageDownloader sharedDownloader];
    downloder.shouldDecompressImages = SDImagedownloderOldShouldDecompressImages;
}
- (void)huadong{
    NSInteger lastviewin = viewarray.count-1;
    page++;
    @autoreleasepool {
    for (int i = 0; i <100; i++) {
        ZhiShiShuNEiRong * imageview = [ZhiShiShuNEiRong new];
        [self addSubview:imageview];
        [viewarray addObject:imageview];
    }
    }
    for (NSInteger i = lastviewin; i < viewarray.count; i++) {
        ZhiShiShuNEiRong * view = viewarray[i];
        NSInteger x = WIDTH*3;
        NSInteger y = HEIGHT*2;
        NSInteger sjx = arc4random() % x;
        NSInteger sjy = arc4random() % y +HEIGHT*2*page;
        if (sjx>lastw) {
            lastw=sjx;
        }
        if (sjy>lasth) {
            lasth=sjy;
        }
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(sjx);
            make.top.mas_equalTo(sjy);
        }];
    }
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(WIDTH/2+self->lastw);
        make.height.mas_equalTo(HEIGHT/2+self->lasth);
    }];
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        for (int i = 0; i < self->viewarray.count; i++) {
            ZhiShiShuNEiRong * view = self->viewarray[i];
            [view addimage];
        }
    });
}
- (void)layoutSubviews{
    [super layoutSubviews];
    for (NSInteger i = layerarray.count+1; i < viewarray.count; i++) {
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        CAShapeLayer * animLayer = [CAShapeLayer layer];
        animLayer.lineJoin = kCALineJoinRound;
        animLayer .lineCap = kCALineCapRound;
        animLayer.shadowOpacity = 0.4;
        animLayer.shadowColor = [UIColor blackColor].CGColor;
        animLayer.shadowRadius = 2.0f;
        animLayer.shadowOffset = CGSizeMake(0,0);
        animLayer.lineWidth = 5.0f;
        animLayer.strokeColor = [UIColor yellowColor].CGColor;
        animLayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:animLayer];
        
        ZhiShiShuNEiRong * starview = self->viewarray[i-1];
        ZhiShiShuNEiRong * endview = self->viewarray[i];
        CGPoint stars = starview.center;
        CGPoint ends = endview.center;
        [path moveToPoint:stars];
        [path addLineToPoint:ends];
        
        animLayer.path = path.CGPath;
        [layerarray addObject:animLayer];

    }
//    MJExtensionLog(@"width=%f,height=%f",self.frame.size.width,self.frame.size.height);
}

- (void)addviews{
    WS(ws);
    
    for (int i = 0; i <1000; i++) {
        FLAnimatedImageView * imageview = [FLAnimatedImageView new];
        imageview.layer.masksToBounds = YES;
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageview];
        [viewarray addObject:imageview];
    }
    FLAnimatedImageView * view = viewarray[1000-1];

    [lastview mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(100);
        make.top.mas_equalTo(view.mas_bottom).with.offset(LENGTH(100));
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    for (int i = 2000; i < viewarray.count; i++) {
        FLAnimatedImageView * view = viewarray[i];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws).with.offset(100);
            make.top.mas_equalTo(self->lastview.mas_bottom).with.offset(LENGTH(100));
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(100);
        }];
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(ws).with.offset(0);
            }];
        }
        lastview = view;
    }
}

- (BOOL)isDisplayedInScreen:(FLAnimatedImageView *)view
{
    if (view == nil) {
        return NO;
    }
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    // 转换view对应window的Rect
    UIWindow *win= [UIApplication sharedApplication].keyWindow;
    CGRect rect = [view convertRect:view.frame toView:win];
    if (CGRectIsEmpty(rect) || CGRectIsNull(rect)) {
        return NO;
    }
    
    // 若view 隐藏
    if (view.hidden) {
        return NO;
    }
    
    // 若没有superview
    if (view.superview == nil) {
        return NO;
    }
    
    // 若size为CGrectZero
    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
        return  NO;
    }
    
    // 获取 该view与window 交叉的 Rect
    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
        return NO;
    }
    
    return YES;
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = touches.anyObject;
//    CGPoint touchLocation = [touch locationInView:self];
////    if (!tankuang) {
//
////    }
////    if (tankuang) {
//        [tankuang animatedend];
//            tankuang = [ZhiShiSHuTanKuang new];
//            [self addSubview:tankuang];
//            [tankuang mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.left.mas_equalTo(touchLocation.x-50);
//                make.top.mas_equalTo(touchLocation.y-50);
//            }];
//            [tankuang animatedstar];
////    }
//    NSLog(@"%@",NSStringFromCGPoint(touchLocation));
//}
@end
