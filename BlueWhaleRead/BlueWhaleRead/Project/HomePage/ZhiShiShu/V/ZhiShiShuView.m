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
#import "ZhiShiShuXQView.h"
#import "ZhiShiShuAnimalView.h"
#import "ZhiShiShuSanJIaoView.h"
#import "ZhiShiShuClickView.h"

#import "ZhiShiShuClickDownView.h"//最下面视图
#define radiansToDegrees(x) (180.0 * x / M_PI)
#define radiansToJaiodu(x) (x*M_PI/180)


static BOOL SDImageCacheOldShouldDecompressImages = YES;
static BOOL SDImagedownloderOldShouldDecompressImages = YES;
@interface ZhiShiShuView ()<UIGestureRecognizerDelegate>
@property (nonatomic,assign) CGPoint currentP;

@end
@implementation ZhiShiShuView{
    NSMutableArray * viewdataarray;
    NSMutableArray * layerdataarray;
    
    NSMutableArray * viewarray;
    NSMutableArray * layerarray;

    ZhiShiShuNEiRong * lastneirongview;
    CGFloat lasth;
    NSInteger laststare;
    NSInteger lastend;
    NSInteger nowpage;

    NSInteger page;
    
    ZhiShiSHuTanKuang * tankuang;
    
    BOOL animalzx;
    
    ZhiShiShuNEiRong * lastneirong;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        animalzx = NO;
        [self addview];
    }
    return self;
}

- (void)addview{
    _morenweizhi = @"0";
//    SDImageCache *canche = [SDImageCache sharedImageCache];
//    // SDImageCacheOldShouldDecompressImages = canche.shouldDecompressImages;
//    // canche.shouldDecompressImages = NO;
//    // 上面的被废掉了，目前的写法是：
//    SDImageCacheOldShouldDecompressImages = canche.config.shouldDecompressImages;
//    canche.config.shouldDecompressImages = NO;
//    
//    SDWebImageDownloader *downloder = [SDWebImageDownloader sharedDownloader];
//    SDImagedownloderOldShouldDecompressImages = downloder.shouldDecompressImages;
//    downloder.shouldDecompressImages = NO;
    self.userInteractionEnabled = YES;
    page = 0;

    viewarray = [NSMutableArray array];
    layerarray = [NSMutableArray array];
    viewdataarray = [NSMutableArray array];
    layerdataarray = [NSMutableArray array];
    lasth = 0;
    laststare = 0;
    lastend = 0;
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(WIDTH);
        make.height.mas_equalTo(HEIGHT);
    }];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]init];
    panGesture.delegate = self;
    [panGesture addTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:panGesture];
//    @autoreleasepool {
//    for (int i = 0; i <100; i++) {
//        ZhiShiShuNEiRong * imageview = [ZhiShiShuNEiRong new];
//        [self addSubview:imageview];
//        [viewarray addObject:imageview];
//        }
//    }
//
//    for (int i = 0; i < viewarray.count; i++) {
//        ZhiShiShuNEiRong * view = viewarray[i];
//        NSInteger x = WIDTH*3;
//        NSInteger y = HEIGHT*2;
//        NSInteger sjx = arc4random() % x;
//        NSInteger sjy = arc4random() % y;
//        if (sjx>lastw) {
//            lastw=sjx;
//
//        }
//        if (sjy>lasth) {
//            lasth=sjy;
//        }
////        NSLog(@"x=%ld,y=%ld",sjx,sjy);
////        view.center = CGPointMake(sjx, sjy);
//
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.centerX.mas_equalTo(sjx);
////            make.centerY.mas_equalTo(sjy);
//            make.left.mas_equalTo(sjx);
//            make.top.mas_equalTo(sjy);
//
//        }];
//    }


//    double delayInSeconds = 1.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        for (int i = 0; i < self->viewarray.count; i++) {
//                ZhiShiShuNEiRong * view = self->viewarray[i];
//                [view addimage];
//        }
//    });
}
- (void)setData:(ZhiShiShuDataModel *)data{
    _data = data;
    NSMutableArray * datearray = data.point;
    for (ZhiShiShuNeiRongModel *neirong in datearray) {
        if (lasth<neirong.height*poinw+((neirong.y_axis-neirong.height/2)*poinw)) {
            lasth=neirong.height*poinw+((neirong.y_axis-neirong.height/2)*poinw);
        }
    }
    
    CGFloat a = lasth/_scroviewheight*1.0;
    CGFloat viewcont = ceilf(a);
    for (int i = 0; i<viewcont; i++) {
        NSMutableArray * array = [NSMutableArray array];
        [viewdataarray addObject:array];
    }
    for (ZhiShiShuNeiRongModel *neirong in datearray) {
        NSInteger inter = neirong.y_axis*poinw/_scroviewheight;
        [viewdataarray[inter] addObject:neirong];
    }
    if (viewdataarray.count==0) {
        
    }


    laststare = 2;
    lastend = 3;
    //线
    [layerdataarray addObjectsFromArray:data.relation];
    for (NSInteger i = layerarray.count; i <layerdataarray.count; i++) {
        ZhiSHiShuXianModel * xian = layerdataarray[i];
//    ZhiSHiShuXianModel * xian = [ZhiSHiShuXianModel new];
//    xian.color = @"3x3x3x";
//1
//        xian.start_x =1;
//        xian.start_y = 1;
//        xian.end_x = 4;
//        xian.end_y = 1;
    
//2
//    xian.start_x =1;
//    xian.start_y = 1;
//    xian.end_x = 2;
//    xian.end_y = 5;
    
//3
//    xian.start_x =1;
//    xian.start_y = 1;
//    xian.end_x = 1;
//    xian.end_y = 5;
    
//4
//    xian.start_x =2;
//    xian.start_y = 1;
//    xian.end_x = 1;
//    xian.end_y = 5;
    
//5
//        xian.start_x =3;
//        xian.start_y = 1;
//        xian.end_x = 1;
//        xian.end_y = 1;
    
//6
//            xian.start_x =3;
//            xian.start_y = 5;
//            xian.end_x = 1;
//            xian.end_y = 1;
    
//7
//                xian.start_x =3;
//                xian.start_y = 5;
//                xian.end_x = 3;
//                xian.end_y = 1;
    
    //8
//                    xian.start_x =1;
//                    xian.start_y = 5;
//                    xian.end_x = 3;
//                    xian.end_y = 1;
    
                UIBezierPath *path = [UIBezierPath bezierPath];
                CAShapeLayer * animLayer = [CAShapeLayer layer];
                animLayer.lineJoin = kCALineJoinRound;
                animLayer .lineCap = kCALineCapRound;
//                animLayer.shadowOpacity = 0.4;
//                animLayer.shadowColor = [UIColor blackColor].CGColor;
//                animLayer.shadowRadius = 2.0f;
//                animLayer.shadowOffset = CGSizeMake(0,0);
        animLayer.lineWidth = xian.line_thickness;
                animLayer.strokeColor = [BaseObject colorWithHexString:xian.color Alpha:1].CGColor;
                animLayer.fillColor = [UIColor clearColor].CGColor;
                [self.layer addSublayer:animLayer];

        CGPoint stars = CGPointMake(xian.start_x*poinw, xian.start_y*poinw);
                CGPoint ends = CGPointMake(xian.end_x*poinw, xian.end_y*poinw);
                [path moveToPoint:stars];
                [path addLineToPoint:ends];
                animLayer.path = path.CGPath;
        
        WS(ws);
        if (xian.line_arrow_direction == 1 || xian.line_arrow_direction == 3) {
            ZhiShiShuSanJIaoView * sanjiaostare = [ZhiShiShuSanJIaoView new];
            sanjiaostare.point = xian;
            [self addSubview:sanjiaostare];
            [sanjiaostare mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(ws).with.offset(xian.start_x*poinw-6);
                make.top.mas_equalTo(ws).with.offset(xian.start_y*poinw-4);
                make.width.mas_equalTo(12);
                make.height.mas_equalTo(8);
            }];
            CGFloat jiaodu = angleBetweenPoints(CGPointMake(xian.start_x*poinw, xian.start_y*poinw), CGPointMake(xian.end_x*poinw, xian.end_y*poinw));

            CGFloat bili = 0.0;
            if (jiaodu == 0) {
                if (xian.start_x>xian.end_x) {
                    bili = 1;
                }else{
                    bili = 0 ;
                }
            }else if (jiaodu >0){
                if (xian.start_x>xian.end_x) {
                    if (xian.start_y>xian.end_y) {
                        //                    bili = (180+jiaodu)/180;
                    }else{
                        bili = (180-jiaodu)/180;
                    }
                }else{
                    if (xian.start_y>xian.end_y) {
                        bili = 1+(180-jiaodu)/180;
                    }else{
                        bili = jiaodu/180;
                    }
                }
            }else{
                if (xian.start_x>xian.end_x) {
                    if (xian.start_y>xian.end_y) {
                        bili = 1+(-jiaodu)/180;
                    }else{
                        bili = 1+(-jiaodu)/180;
                        
                    }
                    
                }else{
                    if (xian.start_y>xian.end_y) {
                        bili = 1+(-jiaodu)/180;
                    }else{
                        bili = (-jiaodu)/180;
                    }
                }
            }
            sanjiaostare.transform = CGAffineTransformMakeRotation(M_PI*bili);
            
        }
        if (xian.line_arrow_direction == 2 || xian.line_arrow_direction == 3) {
            ZhiShiShuSanJIaoView * sanjiaoend = [ZhiShiShuSanJIaoView new];
            sanjiaoend.point = xian;
            [self addSubview:sanjiaoend];
            [sanjiaoend mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(ws).with.offset(xian.end_x*poinw-6);
                make.top.mas_equalTo(ws).with.offset(xian.end_y*poinw-4);
                make.width.mas_equalTo(12);
                make.height.mas_equalTo(8);
            }];
            
            CGFloat jiaodu2 = angleBetweenPoints(CGPointMake(xian.end_x*poinw, xian.end_y*poinw),CGPointMake(xian.start_x*poinw, xian.start_y*poinw));
            CGFloat bili2 = 0;
            if (jiaodu2 == 0) {
                if (xian.start_x>xian.end_x) {
                    bili2 = 0;
                }else{
                    bili2 = 1 ;
                }
            }else if (jiaodu2 >0){
                if (xian.start_x>xian.end_x) {
                    if (xian.start_y>xian.end_y) {
                        bili2 = jiaodu2/180;
                    }else{
                        bili2 = 1+(180-jiaodu2)/180;
                        
                    }
                }else{
                    bili2 = (180-jiaodu2)/180;
                }
            }else{
                if (xian.start_x>xian.end_x) {
                    bili2 = (-jiaodu2)/180;
                }else{
                    bili2 = 1+(-jiaodu2)/180;
                }
            }
            sanjiaoend.transform = CGAffineTransformMakeRotation(M_PI*bili2);
        }
        if (![xian.line_words isEqualToString:@""]) {
            CGFloat jiaodu = angleBetweenPoints(CGPointMake(xian.start_x*poinw, xian.start_y*poinw), CGPointMake(xian.end_x*poinw, xian.end_y*poinw));

            BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(33, 33, 33) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:xian.line_words];
            [self addSubview:title];
            CGFloat labelwidth = [self distanceFromPointX:CGPointMake(xian.start_x*poinw, xian.start_y*poinw) distanceToPointY:CGPointMake(xian.end_x*poinw, xian.end_y*poinw)];
            
            CGFloat titlex;
            CGFloat titley;
            if (xian.start_x>xian.end_x) {
                titlex =((xian.start_x-xian.end_x)/2+xian.end_x)*poinw;
            }else if (xian.start_x==xian.end_x){
                titlex = xian.start_x * poinw;
            }else{
                titlex =((xian.end_x-xian.start_x)/2+xian.start_x)*poinw;
            }
            if (xian.start_y>xian.end_y) {
                titley = ((xian.start_y-xian.end_y)/2+xian.end_y)*poinw;
            }else if (xian.start_y == xian.end_y){
                titley = xian.start_y * poinw;
            }else{
                titley = ((xian.end_y-xian.start_y)/2+xian.start_y)*poinw;
            }
            CGPoint labelcenter  = CGPointMake(titlex, titley);
            CGFloat xianwight = 2;
            CGFloat labeljd = 0.0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            
            if (jiaodu == 0) {
                if (xian.start_x>xian.end_x) {
                    if (xian.start_y>xian.end_y) {
                        NSLog(@"123");
                    }else{
                        labelcenter = CGPointMake(titlex, titley-LENGTH(9)-xianwight);
                        labeljd = 0;
                    }
                }else{
                    if (xian.start_y>xian.end_y) {
                        NSLog(@"123");
                    }else{
                        labelcenter = CGPointMake(titlex, titley-LENGTH(9)-xianwight);
                        labeljd = 0;
                    }
                }
            }else if (jiaodu > 0){
                if (xian.start_x>xian.end_x) {
                    if (xian.start_y>xian.end_y) {
                        NSLog(@"123");
                    }else{
                        labelcenter = CGPointMake(titlex-LENGTH(9)-xianwight, titley);
                        labeljd = 1-jiaodu/180+1;
                    }
                }else{
                    if (xian.start_y>xian.end_y) {
                        labelcenter = CGPointMake(titlex-LENGTH(9)-xianwight, titley);
                        labeljd = -jiaodu/180;
                    }else{
                        labelcenter = CGPointMake(titlex+LENGTH(9)+xianwight, titley);
                        labeljd = jiaodu/180;
                    }
                }
            }else{
                if (xian.start_x>xian.end_x) {
                    if (xian.start_y>xian.end_y) {
                        labelcenter = CGPointMake(titlex+LENGTH(9)+xianwight, titley);
                        labeljd = (-jiaodu/180);
                    }else{
                        NSLog(@"123");
                    }
                }else{
                    if (xian.start_y>xian.end_y) {
                        labelcenter = CGPointMake(titlex+LENGTH(9)+xianwight, titley);
                        labeljd = -jiaodu/180;
                    }else{
                        labelcenter = CGPointMake(titlex+LENGTH(9)+xianwight, titley);
                        labeljd = (1-(jiaodu/180))+1;
                    }
                }
            }
            //    transform = CGAffineTransformMakeRotation(M_PI*labeljd);
            transform = CGAffineTransformRotate(transform, M_PI*labeljd);
            
            title.frame = CGRectMake(0, 0, labelwidth, LENGTH(18));
            title.center = labelcenter;
            title.transform = transform;
        }

//        if (xian.start_x == xian.end_x) {
//            if (xian.start_y == xian.end_y) {
//
//            }else if (xian.st)
//
//        }else if (xian.start_x > xian.end_x){
//
//        }else{
//
//        }
//
//        if (xian.start_x>xian.end_x) {
//            if (xian.start_y>xian.end_y) {
////                titlex = xian.end_x * poinw;
//            }else if (xian.start_y == xian.end_y){
//            }else{
//            }
//        }else if (xian.start_x==xian.end_x){
//            if (xian.start_y>xian.end_y) {
//            }else if (xian.start_y == xian.end_y){
//            }else{
//            }
//        }else{
//            if (xian.start_y>xian.end_y) {
//            }else if (xian.start_y == xian.end_y){
//            }else{
//            }
//        }

        
//        [title mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.center.mas_equalTo(labelcenter);
//            make.width .mas_equalTo(labelwidth);
////            make.height.mas_equalTo(20);
//        }];

        
//        UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(xian.start_x*poinw-3, xian.start_y*poinw-3, 6, 6) cornerRadius:3];
        



//        UIBezierPath *circlePath1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(xian.end_x*poinw-3, xian.end_y*poinw-3, 6, 6) cornerRadius:3];
//        CAShapeLayer *fillLayer1 = [CAShapeLayer layer];
//        fillLayer1.path = circlePath1.CGPath;
//        fillLayer1.fillRule = kCAFillRuleEvenOdd;
//        fillLayer1.fillColor = [UIColor blackColor].CGColor;
//        fillLayer1.opacity = 0.7;
//        [self.layer addSublayer:fillLayer1];

        [layerarray addObject:animLayer];
    }
    for (NSMutableArray * array in viewdataarray) {
        [self addneirong:array weizhi:1];
    }
//    if (viewdataarray.count >=1){
//        [self addneirong:viewdataarray[0] weizhi:1];
//    }
//    if (viewdataarray.count >=2){
//        [self addneirong:viewdataarray[1] weizhi:1];
//    }
//    if (viewdataarray.count >=3){
//        [self addneirong:viewdataarray[2] weizhi:1];
//    }

    [self addClickAnNiu:data];
    [self addClickDown:data];
    WS(ws);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self->lasth+ws.newheight);
    }];
    
}

- (void)addClickDown:(ZhiShiShuDataModel *)model{
    for (ZhiShiShuDownClickModel * modees in model.click) {
        ZhiShiShuClickDownView * view = [ZhiShiShuClickDownView new];
        view.model = modees;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo((modees.x_axis-modees.width/2)*poinw);
            make.top.mas_equalTo((modees.y_axis-modees.height/2)*poinw);
        }];
        if (lasth<modees.height*poinw+((modees.y_axis-modees.height/2)*poinw)) {
            lasth=modees.height*poinw+((modees.y_axis-modees.height/2)*poinw);
        }
    }
    
}
- (void)setNewheight:(CGFloat)newheight{
    _newheight = newheight;
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self->lasth+newheight);
    }];
}
- (void)addClickAnNiu:(ZhiShiShuDataModel *)model{
    WS(ws);
    for (ZhiShiShuClickModel * modes in model.arrow) {
        if ([modes.arrow_type isEqualToString:@"1"]) {
            ZhiShiShuClickView * view = [ZhiShiShuClickView new];
            view.model = modes;
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws.mas_left).with.offset(modes.x_axis*poinw);
                make.top.mas_equalTo(ws).with.offset(modes.y_axis*poinw);
                //            make.top.mas_equalTo(ws).with.offset(100);
                //            make.left.mas_equalTo(ws).with.offset(100);
            }];
        }

    }
    
}

- (void)setMorenweizhi:(NSString *)morenweizhi{
    _morenweizhi = morenweizhi;
//    for (int i = 0; i < viewarray.count; i++) {
//        [self remoview:viewarray[0]];
//    }
//    NSInteger inter =_weizhi/_scroviewheight;
//    if ([_morenweizhi isEqualToString:@"1"]) {
//        [self addneirong:viewdataarray[inter-1] weizhi:1];
//        [self addneirong:viewdataarray[inter] weizhi:1];
//        [self addneirong:viewdataarray[inter+1] weizhi:1];
//    }
//    _morenweizhi = @"0";

}

- (void)setSizey:(CGFloat)sizey{

//    if (viewdataarray.count>3&&[_morenweizhi isEqualToString:@"0"]) {
//        NSInteger inter =sizey/_scroviewheight;
//        if (sizey>_sizey && inter != nowpage && inter < viewdataarray.count-2) {
//            nowpage = inter;
//            [self remoview:viewarray[0]];
//            [self addneirong:viewdataarray[inter+2] weizhi:1];
//        }else if (sizey<_sizey && inter != nowpage && inter >= 0 && inter< viewdataarray.count-2 ) {
//            nowpage = inter;
//            [self remoview:viewarray[2]];
//            [self addneirong:viewdataarray[inter] weizhi:0];
//        }
//    }
//    _sizey = sizey;

//        else{
//
//        if (inter<=laststare) {
//            [self remoview:viewarray[2]];
//            [self addneirong:viewdataarray[inter] weizhi:0];
//            laststare--;
//
//            laststare = inter-1;
//            lastend--;
//        }
//
//    }
}
- (void)remoview:(NSMutableArray *)varray{
    for (ZhiShiShuNEiRong * neirong in varray) {
        [neirong removeFromSuperview];
    }
    [viewarray removeObject:varray];
}
- (void)addneirong:(NSMutableArray *)array weizhi:(NSInteger)inter{
    NSMutableArray * viearray = [NSMutableArray array];
    for (ZhiShiShuNeiRongModel *neirong in array) {
        ZhiShiShuNEiRong * imageview = [ZhiShiShuNEiRong new];
        WS(ws);
        [imageview setBlock:^(ZhiShiShuNeiRongModel *model) {
            [ws clickbutton:model];
        }];
        imageview.userInteractionEnabled = YES;
        imageview.nav = self.nav;
        [self addSubview:imageview];
        [viearray addObject:imageview];
        imageview.neirong = neirong;
        imageview.textmodel = _data;
        if (neirong.width<=0) {
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo((neirong.x_axis-neirong.width/2)*poinw);
                make.top.mas_equalTo((neirong.y_axis-neirong.height/2)*poinw-LENGTH(16));
            }];
        }else{
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo((neirong.x_axis-neirong.width/2)*poinw);
                make.top.mas_equalTo((neirong.y_axis-neirong.height/2)*poinw);
            }];
        }
        if (lastneirong == nil) {
            [self.superview layoutIfNeeded];
            lastneirong = imageview;
            self.block(imageview.frame);
        }
    }
    if (inter == 0) {
        [viewarray insertObject:viearray atIndex:0];
    }else{
        [viewarray addObject:viearray];
    }
}
- (void)dealloc{
    SDImageCache *canche = [SDImageCache sharedImageCache];
    canche.config.shouldDecompressImages = SDImageCacheOldShouldDecompressImages;
    SDWebImageDownloader *downloder = [SDWebImageDownloader sharedDownloader];
    downloder.shouldDecompressImages = SDImagedownloderOldShouldDecompressImages;
}
- (void)huadong{
//    NSInteger lastviewin = viewarray.count-1;
//    page++;
//    @autoreleasepool {
//    for (int i = 0; i <100; i++) {
//        ZhiShiShuNEiRong * imageview = [ZhiShiShuNEiRong new];
//        [self addSubview:imageview];
//        [viewarray addObject:imageview];
//    }
//    }
//    for (NSInteger i = lastviewin; i < viewarray.count; i++) {
//        ZhiShiShuNEiRong * view = viewarray[i];
//        NSInteger x = WIDTH*3;
//        NSInteger y = HEIGHT*2;
//        NSInteger sjx = arc4random() % x;
//        NSInteger sjy = arc4random() % y +HEIGHT*2*page;
//        if (sjx>lastw) {
//            lastw=sjx;
//        }
//        if (sjy>lasth) {
//            lasth=sjy;
//        }
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(sjx);
//            make.top.mas_equalTo(sjy);
//        }];
//    }
//
//    [self mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(WIDTH/2+self->lastw);
//        make.height.mas_equalTo(HEIGHT/2+self->lasth);
//    }];
//
//    double delayInSeconds = 1.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        for (int i = 0; i < self->viewarray.count; i++) {
//            ZhiShiShuNEiRong * view = self->viewarray[i];
//            [view addimage];
//        }
//    });
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
//    for (NSInteger i = layerarray.count+1; i < viewarray.count; i++) {
//
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        CAShapeLayer * animLayer = [CAShapeLayer layer];
//        animLayer.lineJoin = kCALineJoinRound;
//        animLayer .lineCap = kCALineCapRound;
//        animLayer.shadowOpacity = 0.4;
//        animLayer.shadowColor = [UIColor blackColor].CGColor;
//        animLayer.shadowRadius = 2.0f;
//        animLayer.shadowOffset = CGSizeMake(0,0);
//        animLayer.lineWidth = 5.0f;
//        animLayer.strokeColor = [UIColor yellowColor].CGColor;
//        animLayer.fillColor = [UIColor clearColor].CGColor;
//        [self.layer addSublayer:animLayer];
//
//        ZhiShiShuNEiRong * starview = self->viewarray[i-1];
//        ZhiShiShuNEiRong * endview = self->viewarray[i];
//        CGPoint stars = starview.center;
//        CGPoint ends = endview.center;
//        [path moveToPoint:stars];
//        [path addLineToPoint:ends];
//
//        animLayer.path = path.CGPath;
//        [layerarray addObject:animLayer];
//
//    }
//    MJExtensionLog(@"width=%f,height=%f",self.frame.size.width,self.frame.size.height);
}

//- (void)addviews{
//    WS(ws);
//
//    for (int i = 0; i <1000; i++) {
//        FLAnimatedImageView * imageview = [FLAnimatedImageView new];
//        imageview.layer.masksToBounds = YES;
//        imageview.contentMode = UIViewContentModeScaleAspectFit;
//        [self addSubview:imageview];
//        [viewarray addObject:imageview];
//    }
//    FLAnimatedImageView * view = viewarray[1000-1];
//
//    [lastview mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(ws).with.offset(100);
//        make.top.mas_equalTo(view.mas_bottom).with.offset(LENGTH(100));
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(100);
//    }];
//    for (int i = 2000; i < viewarray.count; i++) {
//        FLAnimatedImageView * view = viewarray[i];
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(ws).with.offset(100);
//            make.top.mas_equalTo(self->lastview.mas_bottom).with.offset(LENGTH(100));
//            make.width.mas_equalTo(100);
//            make.height.mas_equalTo(100);
//        }];
//        if (i == viewarray.count-1) {
//            [view mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.bottom.equalTo(ws).with.offset(0);
//            }];
//        }
//        lastview = view;
//    }
//}

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


- (void)clickbutton:(ZhiShiShuNeiRongModel*)neirong{
    WS(ws);

    if ([neirong.flag isEqualToString:@""]||[neirong.flag isEqualToString:@"0"]) {
        
    }else{
        ZhiShiShuXQView * view = [ZhiShiShuXQView new];
        view.itemid = neirong._id;
        view.nav = self.nav;
        [_lastview addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.lastview);
        }];
    }
}
- (void)oneButton:(BaseButton *)button{
//    WS(ws);
//     ZhiShiShuNeiRongModel * neirong = viewdataarray[button.tag-100];
//    if ([neirong.flag isEqualToString:@""]||[neirong.flag isEqualToString:@"0"]) {
//
//    }else{
//    ZhiShiShuXQView * view = [ZhiShiShuXQView new];
//    view.itemid = neirong._id;
//    view.nav = self.nav;
//    [_lastview addSubview:view];
//
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(ws.lastview);
//    }];
//    }
}


-(void)pan:(UIPanGestureRecognizer *)pan{

    //获取当前点
    if (animalzx == NO) {
        self.currentP = [pan locationInView:self];
        //判断触摸点在不在按钮上
        for (NSMutableArray *muarray in viewarray) {
            for (ZhiShiShuNEiRong *view in muarray) {
                //判断点在不在某个范围内,按钮有没有选中
                if (![view.neirong.is_background isEqualToString:@"1"]) {
                    if(CGRectContainsPoint(view.frame,self.currentP)){
                        animalzx = YES;
                        if (lastneirongview != nil) {
                            [lastneirongview wuyinying];
                        }
                        [view yinying];
                        lastneirongview=view;
                        animalzx = NO;
                        
                        //                    ZhiShiShuAnimalView * backview = [ZhiShiShuAnimalView new];
                        //                    [view addSubview:backview];
                        //                    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
                        //                        make.edges.mas_equalTo(view);
                        //                    }];
                        //                    [backview setBlock:^{
                        //                        self->animalzx = NO;
                        //                    }];
                    }
                }
            }
        }
    }

}
//保证拖动手势和UIScrollView上的拖动手势互不影响
-(BOOL)gestureRecognizer:(UIGestureRecognizer*) gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer*)otherGestureRecognizer
{
    if ([gestureRecognizer.view isKindOfClass:[UIScrollView class]]) {
        return NO;
    }else {
        return YES;
    }
}


CGFloat angleBetweenLines(CGPoint line1Start, CGPoint line1End, CGPoint line2Start, CGPoint line2End) {
    CGFloat a = line1End.x - line1Start.x;
    CGFloat b = line1End.y - line1Start.y;
    CGFloat c = line2End.x - line2Start.x;
    CGFloat d = line2End.y - line2Start.y;
    CGFloat rads = acos(((a*c) + (b*d)) / ((sqrt(a*a + b*b)) * (sqrt(c*c + d*d))));
    return radiansToDegrees(rads);
}
//两个点之间的角度

CGFloat angleBetweenPoints(CGPoint first, CGPoint second) {
    CGFloat height = second.y - first.y;
    CGFloat width = first.x - second.x;
    CGFloat rads = atan(height/width);
    return radiansToDegrees(rads);
}
-(CGFloat)distanceFromPointX:(CGPoint)start distanceToPointY:(CGPoint)end{
    float distance;
    //下面就是高中的数学，不详细解释了
    CGFloat xDist = (end.x - start.x);
    CGFloat yDist = (end.y - start.y);
    distance = sqrt((xDist * xDist) + (yDist * yDist));
    return distance;
}

@end
