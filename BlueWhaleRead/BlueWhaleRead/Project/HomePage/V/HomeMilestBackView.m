//
//  HomeMilestBackView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeMilestBackView.h"
#import "GppdBookXinXingView.h"
#import "HomeMilestDuiHuaKuangView.h"
#define VALUE(_INDEX_) [NSValue valueWithCGPoint:points[_INDEX_]]

@implementation HomeMilestBackView{
    NSMutableArray * viewarray;
    NSMutableArray * dhkarray;

    CAShapeLayer *border;
    NSMutableArray * cgponintarray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)setModel:(LCBMilestone *)model{
    _model = model;
    WS(ws);
    NSMutableArray * itemarray = model.milestone;
    
    viewarray = [NSMutableArray array];
    dhkarray = [NSMutableArray array];
    
    cgponintarray = [NSMutableArray array];
    for (int i = 0; i < itemarray.count+1; i++) {
        GppdBookXinXingView * Xing = [GppdBookXinXingView new];
        HomeMilestDuiHuaKuangView  * tiankong= [HomeMilestDuiHuaKuangView new];
        tiankong.layer.masksToBounds = NO;
        Xing.inter = i+1;
        if (i < itemarray.count) {
            LCBmilestoneModel * mo = itemarray[i];
            tiankong.now = i+1;
            tiankong.bookS = mo.stone;
        }else{
            [Xing weiwancheng];
            
            tiankong.now = i+1;
            NSInteger inter = model.nextMilestone - model.readnum;
            tiankong.bookS = [NSString stringWithFormat:@"%ld",inter];
            [tiankong weiwancheng];
        }
        [viewarray addObject:Xing];
        [dhkarray addObject:tiankong];
    }
    
    GppdBookXinXingView * lastview;
    HomeMilestDuiHuaKuangView  * lastiankong;
    for (int i = 0; i < viewarray.count; i++) {
        GppdBookXinXingView * view = viewarray[i];
        [self addSubview:view];
        
        HomeMilestDuiHuaKuangView * tiankong = dhkarray[i];
        [self addSubview:tiankong];
        if (!lastview) {
            tiankong.leftImage = NO;
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(ws.mas_bottom).with.offset(-LENGTHHEIGHT(154));
                make.centerX.mas_equalTo(ws.mas_centerX);
            }];
            [tiankong mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(view.mas_right).with.offset(-LENGTHHEIGHT(40));
                make.bottom.mas_equalTo(view.mas_top).with.offset(LENGTHHEIGHT(40));
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                if (i == 1) {
                    tiankong.leftImage = NO;
                    make.right.mas_equalTo(lastview.mas_left).with.offset(-LENGTHHEIGHT(59));
                    make.bottom.mas_equalTo(lastview.mas_top).with.offset(-LENGTHHEIGHT(263));
                }else{
                    if (i%2 == 0) {
                        tiankong.leftImage = YES;
                        make.left.mas_equalTo(lastview.mas_right).with.offset(LENGTHHEIGHT(266));
                        make.bottom.mas_equalTo(lastview.mas_top).with.offset(-LENGTHHEIGHT(150+arc4random()%74));
                    }else{
                        tiankong.leftImage = NO;
                        
                        make.right.mas_equalTo(lastview.mas_left).with.offset(-LENGTHHEIGHT(266));
                        make.bottom.mas_equalTo(lastview.mas_top).with.offset(-LENGTHHEIGHT(150+arc4random()%236));
                    }
                }
            }];
            
            [tiankong mas_makeConstraints:^(MASConstraintMaker *make) {
                if (i%2 == 0) {
                    make.right.mas_equalTo(view.mas_left).with.offset(-LENGTHHEIGHT(20));
                    make.bottom.mas_equalTo(view.mas_top).with.offset(LENGTHHEIGHT(60));
                }else{
                    make.left.mas_equalTo(view.mas_right).with.offset(LENGTHHEIGHT(20));
                    make.bottom.mas_equalTo(view.mas_top).with.offset(LENGTHHEIGHT(60));
                }
            }];
        }
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LENGTHHEIGHT(126));
            make.height.mas_equalTo(LENGTHHEIGHT(123));
        }];
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(ws.mas_top).with.offset(LENGTHHEIGHT(114));
            }];
        }
        lastview = view;
        lastiankong = tiankong;
    }
}
- (void)addView{
    WS(ws);
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor clearColor];
}

- (void)addnewBody{
    if (border == nil) {
        WS(ws);
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i = 0; i < viewarray.count; i++) {
        GppdBookXinXingView * view = viewarray[i];
        CGPoint point = CGPointMake(view.center.x, view.center.y);
        [cgponintarray addObject:[NSValue valueWithCGPoint:point]];
        if (i == 0) {
            [path moveToPoint:point];
        }else if(i == 1){
            CGPoint point1  = [cgponintarray[i-1] CGPointValue];
            NSInteger one =  arc4random() % 2;
            CGPoint point2 ;
            NSInteger sj = LENGTHHEIGHT(50+arc4random() % 30);
            if (one == 0) {
                point2 = CGPointMake(point.x+(point1.x-point.x)/2-sj,point.y+(point1.y-point.y)/2);
            }else{
                point2 = CGPointMake(point.x+(point1.x-point.x)/2+sj,point.y+(point1.y-point.y)/2);
            }

//            FLAnimatedImageView * xz = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(point2.x, point2.y, LENGTHHEIGHT(62), LENGTHHEIGHT(54))];
//            FLAnimatedImageView * xz = [FLAnimatedImageView new];
//            xz.image = UIIMAGE(@"文学勋章lv5");
//            [self addSubview:xz];
//            [xz mas_makeConstraints:^(MASConstraintMaker *make) {
//                if (one == 0) {
//                    make.left.mas_equalTo(ws).with.offset(point.x+(point1.x-point.x)/2);
//                }else{
//                    make.left.mas_equalTo(ws).with.offset(point.x+(point1.x-point.x)/2);
//                }
//                make.top.mas_equalTo(ws).with.offset(point2.y);
//                make.width.mas_equalTo(LENGTHHEIGHT(62));
//                make.height.mas_equalTo(LENGTHHEIGHT(54));
//            }];
            [path addQuadCurveToPoint:point controlPoint:point2];

        }else{
            NSInteger one =  arc4random() % 2;
            NSInteger oneone =  arc4random() % 2;
            NSInteger two =  arc4random() % 2;
            NSInteger twotwo =  arc4random() % 2;
            CGPoint point1  = [cgponintarray[i-1] CGPointValue];
            CGPoint point3 ;
            CGPoint point4 ;
            NSInteger suiji = 50+arc4random()%30;
            if (one == 0 && oneone == 0) {
                point3 = CGPointMake(point.x+(point1.x-point.x)/4+LENGTHHEIGHT(suiji),point.y+(point1.y-point.y)/4*3);
            }else if (oneone ==1 && oneone == 0){
                point3 = CGPointMake(point.x-(point1.x-point.x)/4+LENGTHHEIGHT(suiji),point.y-(point1.y-point.y)/4*3);
            }else if (oneone ==0 && oneone == 1){
                point3 = CGPointMake(point.x+(point1.x-point.x)/4-LENGTHHEIGHT(suiji),point.y-(point1.y-point.y)/4*3);
            }else{
                point3 = CGPointMake(point.x-(point1.x-point.x)/4-LENGTHHEIGHT(suiji),point.y+(point1.y-point.y)/4*3);
            }

            if (two == 0 && twotwo == 0) {
                point4 = CGPointMake(point.x+(point1.x-point.x)/4*3+LENGTHHEIGHT(suiji),point.y+(point1.y-point.y)/4);
            }else if (two ==1 && twotwo == 0){
                point4 =CGPointMake(point.x-(point1.x-point.x)/4*3+LENGTHHEIGHT(suiji),point.y-(point1.y-point.y)/4);
            }else if (two ==0 && twotwo == 1){
                point4 = CGPointMake(point.x+(point1.x-point.x)/4*3-LENGTHHEIGHT(suiji),point.y-(point1.y-point.y)/4);
            }else{
                point4 = CGPointMake(point.x-(point1.x-point.x)/4*3-LENGTHHEIGHT(suiji),point.y+(point1.y-point.y)/4);

            }
            [path addCurveToPoint:point controlPoint1:point3 controlPoint2:point4];

//            NSInteger xzgs =  arc4random() % 4;
//            for (int d =1 ; d < xzgs+1; d++) {
//                FLAnimatedImageView * xz = [FLAnimatedImageView new];
//                xz.image = UIIMAGE(@"文学勋章lv5");
//                [self addSubview:xz];
//                [xz mas_makeConstraints:^(MASConstraintMaker *make) {
//                    if (i%2 == 0) {
//                        make.left.mas_equalTo(view.mas_left).with.offset(-(point.x-point1.x)/(xzgs+1)*(xzgs-d));
//                        make.top.mas_equalTo(view.mas_bottom).with.offset((point1.y-point.y)/(xzgs+1)*(xzgs-d));
//
//                    }else{
//                        make.right.mas_equalTo(view.mas_right).with.offset((point1.x-point.x)/(xzgs+1)*(xzgs-d));
//                        make.top.mas_equalTo(view.mas_bottom).with.offset((point1.y-point.y)/(xzgs+1)*(xzgs-d));
//                    }
//                    make.width.mas_equalTo(LENGTHHEIGHT(62));
//                    make.height.mas_equalTo(LENGTHHEIGHT(54));
//                }];
//            }
        }
        
//        else{
////            CGPoint point1;
//        if ((i+1) < viewarray.count) {
//            GppdBookXinXingView * view1 = viewarray[i+1];
//            CGPoint point1  = CGPointMake(view1.center.x, view1.center.y);
//            CGPoint point2 = CGPointMake(point.x-(point1.x-point.x)/2,point.y-(point1.y-point.y)/2);
//            [path addQuadCurveToPoint:point controlPoint:point2];
//        }else{
//            [path addLineToPoint:point];

//        }
        
//        }
    }
    
        border = [CAShapeLayer layer];
        border.cornerRadius = LENGTHHEIGHT(20);
        //虚线的颜色
        border.strokeColor = RGBA(255, 255, 255, 0.7).CGColor;
        //填充的颜色
        border.fillColor = [UIColor clearColor].CGColor;
        //设置路径
        border.path =path.CGPath;
        //虚线的宽度
        border.lineWidth = LENGTHHEIGHT(10);
        border.lineJoin = kCALineJoinRound;
        border.lineCap = kCALineCapRound;
//        border.lineJoin = @"kCGLineJoinRound";
        //设置线条的样式
//        border.lineCap = @"square";
        //虚线的间隔
        border.lineDashPattern = @[@50, @20];
        [self.layer addSublayer:border];
        
        UIImage * leftImage = UIIMAGE(@"bg_我的里程碑_左");
        UIImage * rightImage = UIIMAGE(@"bg_我的里程碑_右");

        float fl = self.frame.size.height/leftImage.size.height*1.0/2;
        int a;
        a = ceil(fl);
        NSMutableArray * leftimageViewarray = [NSMutableArray array];
        NSMutableArray * rightimageViewarray = [NSMutableArray array];
        for (int b = 0; b<a; b++) {
            FLAnimatedImageView * leftImageView = [FLAnimatedImageView new];
            leftImageView.contentMode = UIViewContentModeScaleAspectFill;
            leftImageView.image = leftImage;
            [self addSubview:leftImageView];
            [leftimageViewarray addObject:leftImageView];
        }
        
        float fll = self.frame.size.height/rightImage.size.height*1.0/2;
        int d;
        d = ceil(fll);
        for (int b = 0; b<d; b++) {
            FLAnimatedImageView * rightImageView = [FLAnimatedImageView new];
            rightImageView.contentMode = UIViewContentModeScaleAspectFill;
            rightImageView.image = rightImage;
            [self addSubview:rightImageView];
            [rightimageViewarray addObject:rightImageView];
        }
        
        
        FLAnimatedImageView * lastview;
        for (int b = 0; b < leftimageViewarray.count; b++) {
            FLAnimatedImageView * view = leftimageViewarray[b];
            if (!lastview) {
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(ws.mas_bottom).with.offset(-LENGTHHEIGHT(154));
                }];
            }else{
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(lastview.mas_top);
                }];
            }
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(leftImage.size.height/2);
                make.width.mas_equalTo(leftImage.size.width/2);

                make.left.mas_equalTo(ws);
//                make.right.mas_equalTo(ws);
            }];
            if (b == leftimageViewarray.count-1) {
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(ws.mas_top);
                }];
            }
            lastview = view;
        }
        
        FLAnimatedImageView * rightview;
        for (int b = 0; b < rightimageViewarray.count; b++) {
                FLAnimatedImageView * view = rightimageViewarray[b];
                if (!rightview) {
                    [view mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.bottom.equalTo(ws.mas_bottom).with.offset(-LENGTHHEIGHT(154));
                    }];
                }else{
                    [view mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.bottom.equalTo(rightview.mas_top);
                    }];
                }
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(rightImage.size.height/2);
                    make.width.mas_equalTo(rightImage.size.width/2);
                    make.right.mas_equalTo(ws);
                    //                make.right.mas_equalTo(ws);
                }];
                if (b == rightimageViewarray.count-1) {
                    [view mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(ws.mas_top);
                    }];
                }
                rightview = view;
        }
        
        for (GppdBookXinXingView * view in viewarray) {
            [self addSubview:view];
        }
        for (HomeMilestDuiHuaKuangView * view in dhkarray) {
            [self addSubview:view];
        }
    }
    
    
    
}
void getPointsFromBezier(void *info,const CGPathElement *element){
    NSMutableArray *bezierPoints = (__bridge NSMutableArray *)info;
    CGPathElementType type = element->type;
    CGPoint *points = element->points;
    
    if (type != kCGPathElementCloseSubpath) {
        [bezierPoints addObject:VALUE(0)];
        if ((type != kCGPathElementAddLineToPoint) && (type != kCGPathElementMoveToPoint)) {
            [bezierPoints addObject:VALUE(1)];
        }
    }
    
    if (type == kCGPathElementAddCurveToPoint) {
        [bezierPoints addObject:VALUE(2)];
    }
    
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    //    [self drawBody];
    [self addnewBody];
}
@end
