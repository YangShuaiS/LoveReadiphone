
//
//  FoundBanjiView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundBanjiView.h"
#import "FriendViewController.h"
static float radar_l  = 0;
static float center_w = 0;
static float center_h = 0;
@implementation FoundBanjiView
{
    BaseView * backView;
    NSMutableArray * onearray;
    NSMutableArray * twoarray;
//    NSMutableArray * threearray;
    NSMutableArray * buttonearray;
    NSMutableArray * butttwoarray;
//    NSMutableArray * buttthreearray;

    
}

-(instancetype)init{
    self = [super init];
    if (self) {
        onearray = [NSMutableArray array];
        twoarray = [NSMutableArray array];
//        threearray = [NSMutableArray array];
        
        buttonearray = [NSMutableArray array];
        butttwoarray = [NSMutableArray array];
//        buttthreearray = [NSMutableArray array];

        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.backgroundColor = [UIColor whiteColor];
    WS(ws);
    FLAnimatedImageView * bacImage = [FLAnimatedImageView new];
    bacImage.image = UIIMAGE(@"bg_发现_关系网");
    [self addSubview:bacImage];
    [bacImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    for (int i = 0; i < 1; i++) {
        FLAnimatedImageView * userimageOne = [FLAnimatedImageView new];
//        userimageOne.image = UIIMAGE(ZHANWEITUTX);
        userimageOne.layer.masksToBounds = YES;
        userimageOne.layer.cornerRadius = LENGTH(33);
        userimageOne.layer.borderColor = RGB(31,184,236).CGColor;
        userimageOne.layer.borderWidth = LENGTH(2);
        //        userimageOne.frame = CGRectMake(0, 0, LENGTH(50), LENGTH(50));
        [self addSubview:userimageOne];
        
        [userimageOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(ws);
            make.width.mas_equalTo(LENGTH(66));
            make.height.mas_equalTo(LENGTH(66));
        }];
        userimageOne.userInteractionEnabled = YES;
        BaseButton * oneButton = [BaseButton buttonWithType:UIButtonTypeCustom];
        [oneButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [userimageOne addSubview:oneButton];
        [oneButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(userimageOne);
        }];
        
        [onearray addObject:userimageOne];
        [buttonearray addObject:oneButton];
        for (int a = 0; a < 6; a++) {
            FLAnimatedImageView * userimageTwo = [FLAnimatedImageView new];
//            userimageTwo.image = UIIMAGE(ZHANWEITUTX);
            userimageTwo.layer.masksToBounds = YES;
            userimageTwo.layer.cornerRadius = LENGTH(22);
            userimageTwo.layer.borderColor = RGB(31,184,236).CGColor;
            userimageTwo.layer.borderWidth = LENGTH(2);
            [self addSubview:userimageTwo];
            if (a == 0) {
                [userimageTwo mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.mas_equalTo(userimageOne.mas_centerY).with.offset(-LENGTH(42));
                    make.centerX.mas_equalTo(userimageOne.mas_centerX).with.offset(LENGTH(66));
                    
                }];
            }else if (a == 1){
                [userimageTwo mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.mas_equalTo(userimageOne.mas_centerY).with.offset(LENGTH(0));
                    make.centerX.mas_equalTo(userimageOne.mas_centerX).with.offset(LENGTH(123));
                    
                }];
            }else if (a == 2){
                [userimageTwo mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.mas_equalTo(userimageOne.mas_centerY).with.offset(LENGTH(42));
                    make.centerX.mas_equalTo(userimageOne.mas_centerX).with.offset(LENGTH(66));
                    
                }];
            }else if (a == 3){
                [userimageTwo mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.mas_equalTo(userimageOne.mas_centerY).with.offset(-LENGTH(42));
                    make.centerX.mas_equalTo(userimageOne.mas_centerX).with.offset(-LENGTH(66));
                    
                }];
            }else if (a == 4){
                [userimageTwo mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.mas_equalTo(userimageOne.mas_centerY).with.offset(-LENGTH(0));
                    make.centerX.mas_equalTo(userimageOne.mas_centerX).with.offset(-LENGTH(123));
                    
                }];
            }else{
                [userimageTwo mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.mas_equalTo(userimageOne.mas_centerY).with.offset(LENGTH(42));
                    make.centerX.mas_equalTo(userimageOne.mas_centerX).with.offset(-LENGTH(66));
                    
                }];
            }
            
            [userimageTwo mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(LENGTH(44));
                make.height.mas_equalTo(LENGTH(44));
            }];
            userimageTwo.userInteractionEnabled = YES;
            BaseButton * twoButton = [BaseButton buttonWithType:UIButtonTypeCustom];
            [twoButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            [userimageTwo addSubview:twoButton];
            [twoButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(userimageTwo);
            }];
            [twoarray addObject:userimageTwo];
            [butttwoarray addObject:twoButton];
        }
    }
    
//    for (int a = 0; a < twoarray.count; a++) {
//        FLAnimatedImageView * view = twoarray[a];
//        for (int i = 0; i<2; i++) {
//            FLAnimatedImageView * userimageThree = [FLAnimatedImageView new];
////            userimageThree.image = UIIMAGE(ZHANWEITUTX);
//            userimageThree.layer.masksToBounds = YES;
//            userimageThree.layer.cornerRadius = LENGTH(22);
//            userimageThree.layer.borderColor = RGB(31,184,236).CGColor;
//            userimageThree.layer.borderWidth = LENGTH(2);
//            [self addSubview:userimageThree];
//            if (i == 0) {
//                [userimageThree mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.centerY.mas_equalTo(view.mas_centerY).with.offset(-LENGTH(30));
//                }];
//            }else{
//                [userimageThree mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.centerY.mas_equalTo(view.mas_centerY).with.offset(LENGTH(30));
//                }];
//
//            }
//            if (a<3) {
//                [userimageThree mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.centerX.mas_equalTo(view.mas_centerX).with.offset(LENGTH(arc4random()%40+100));
//                }];
//            }else{
//                [userimageThree mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.centerX.mas_equalTo(view.mas_centerX).with.offset(-LENGTH(arc4random()%40+100));
//                }];
//            }
//
//            [userimageThree mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.width.mas_equalTo(LENGTH(44));
//                make.height.mas_equalTo(LENGTH(44));
//            }];
//            userimageThree.userInteractionEnabled = YES;
//            BaseButton * threeButton = [BaseButton buttonWithType:UIButtonTypeCustom];
//            [threeButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//            [userimageThree addSubview:threeButton];
//            [threeButton mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.edges.mas_equalTo(userimageThree);
//            }];
//
//            [threearray addObject:userimageThree];
//            [buttthreearray addObject:threeButton];
//
//        }
//    }
}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    //    [self drawBody];
    [self addnewBody];
}
- (void)addnewBody{
    FLAnimatedImageView * oneView = onearray[0];
    CGPoint point1 = oneView.center;
    
    for (int i = 0; i < twoarray.count; i++) {
        FLAnimatedImageView * twoView = twoarray[i];
        UIBezierPath *path = [UIBezierPath bezierPath];
        [[UIColor blueColor] setStroke];
        [path setLineWidth:10.0];
        [path setLineJoinStyle:kCGLineJoinRound];
        [path setLineCapStyle:kCGLineCapRound];
        
        CGPoint point2 = twoView.center;
        [path moveToPoint:point1];
        [path addLineToPoint:point2];
//        for (int b = 0 ; b < 2; b++) {
//            int c = 0;
//            if (b == 0) {
//                c = 1;
//            }
//            FLAnimatedImageView * threeView = threearray[c+2*i];
//            CGPoint point3 = threeView.center;
//            [path moveToPoint:point2];
//            [path addLineToPoint:point3];
//        }
        [self addanimal:path];
    }
    for (FLAnimatedImageView * view in onearray) {
        [self addSubview:view];
    }
    for (FLAnimatedImageView * view in twoarray) {
        [self addSubview:view];
    }
//    for (FLAnimatedImageView * view in threearray) {
//        [self addSubview:view];
//    }
}
- (void)drawBody{
    
    CGPoint point1 = CGPointMake(center_w, center_h);
    [onearray addObject:[NSValue valueWithCGPoint:point1]];
    
    for (int i = 0; i < 6; i++) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [[UIColor blueColor] setStroke];
        [path setLineWidth:10.0];
        [path setLineJoinStyle:kCGLineJoinRound];
        [path setLineCapStyle:kCGLineCapRound];
        
        float x   = 0;
        float y   = 0;
        
        double pi = (M_PI*2.0/(6))*(i+0.5);
        // 计算主干落点坐标
        Coordinate_2(pi, radar_l, center_w, center_h,&x, &y);
        CGPoint point2 = CGPointMake(x, y);
        [path moveToPoint:point1];
        [path addLineToPoint:point2];
        [twoarray addObject:[NSValue valueWithCGPoint:point2]];
        
//        if (x>center_w) {
//            for (int i = 0 ; i < 2; i++) {
//                [path moveToPoint:point2];
        
                //                UIBezierPath *paths = [UIBezierPath bezierPath];
                //                [[UIColor blueColor] setStroke];
                //                [paths setLineWidth:10.0];
                //                [paths setLineJoinStyle:kCGLineJoinRound];
                //                [paths setLineCapStyle:kCGLineCapRound];
                //                [paths moveToPoint:point2];
                
//                if (i == 0) {
//                    CGPoint point3 = CGPointMake(x +LENGTH(100), y - LENGTH(30));
//                    [path addLineToPoint:point3];
//                    [threearray addObject:[NSValue valueWithCGPoint:point3]];
//
//                }else{
//                    CGPoint point3 = CGPointMake(x +LENGTH(100), y + LENGTH(30));
//                    [path addLineToPoint:point3];
//                    [threearray addObject:[NSValue valueWithCGPoint:point3]];
//
//                }
                //                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                //
                //                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                //                    //执行事件
                //                    [self addanimal:paths];
                //
                //                });
//            }
//        }else{
//            for (int i = 0 ; i < 2; i++) {
//                [path moveToPoint:point2];
        
                //                UIBezierPath *paths = [UIBezierPath bezierPath];
                //                [[UIColor blueColor] setStroke];
                //                [paths setLineWidth:10.0];
                //                [paths setLineJoinStyle:kCGLineJoinRound];
                //                [paths setLineCapStyle:kCGLineCapRound];
                //                [paths moveToPoint:point2];
                
//                if (i == 0) {
//                    CGPoint point3 = CGPointMake(x -LENGTH(100), y - LENGTH(30));
//                    [path addLineToPoint:point3];
//                    [threearray addObject:[NSValue valueWithCGPoint:point3]];
//
//                }else{
//                    CGPoint point3 = CGPointMake(x -LENGTH(100), y + LENGTH(30));
//                    [path addLineToPoint:point3];
//                    [threearray addObject:[NSValue valueWithCGPoint:point3]];
//
//                }
                
                //                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                //
                //                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                //                    //执行事件
                //                    [self addanimal:paths];
                //
                //                });
                
//            }
        
//        }
        [self addanimal:path];
        
    }
    
    //    // 获取画布
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    //    // 划线颜色
    //    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    //
    //    CGContextSetLineWidth(context, 1);
    //    //    // 起点坐标
    //    //    CGContextMoveToPoint(context, center_w, center_h);
    //    //    // 第一条线
    //    //    CGContextAddLineToPoint(context, center_w, 20);
    //    //    // 添加元素名称
    //    //    BaseLabel *bodyLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(center_w-30, 0, 60, 13) LabelTxteColor:RGB(33, 33, 33) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:_items[0]];
    //    //    [self addSubview:bodyLabel];
    //
    //    for (int i = 0; i < 6; i++) {
    //        float x   = 0;
    //        float y   = 0;
    //
    //        double pi = (M_PI*2.0/(6))*(i+0.5);
    //        // 计算主干落点坐标
    //        Coordinate_2(pi, radar_l, center_w, center_h,&x, &y);
    //
    //        // 设置每次的初始点坐标
    //        CGContextMoveToPoint(context, center_w, center_h);
    //        // 设置终点坐标
    //        CGContextAddLineToPoint(context, x, y);
    //    }
    //    CGContextStrokePath(context);
//    for (int i = 0; i < onearray.count; i++) {
//        CGPoint center = [onearray[i] CGPointValue];
//        FLAnimatedImageView * userimage = [FLAnimatedImageView new];
//        userimage.backgroundColor = RANDOMCOLOR;
//        userimage.layer.masksToBounds = YES;
//        userimage.layer.cornerRadius = LENGTH(25);
//        userimage.frame = CGRectMake(0, 0, LENGTH(50), LENGTH(50));
//        userimage.center = center;
//        [self addSubview:userimage];
//    }
//    for (int i = 0; i < twoarray.count; i++) {
//        CGPoint center = [twoarray[i] CGPointValue];
//        FLAnimatedImageView * userimage = [FLAnimatedImageView new];
//        userimage.backgroundColor = RANDOMCOLOR;
//        userimage.layer.masksToBounds = YES;
//        userimage.layer.cornerRadius = LENGTH(20);
//        userimage.frame = CGRectMake(0, 0, LENGTH(40), LENGTH(40));
//        userimage.center = center;
//        [self addSubview:userimage];
//    }
//    for (int i = 0; i < threearray.count; i++) {
//        CGPoint center = [threearray[i] CGPointValue];
//        FLAnimatedImageView * userimage = [FLAnimatedImageView new];
//        userimage.backgroundColor = RANDOMCOLOR;
//        userimage.layer.masksToBounds = YES;
//        userimage.layer.cornerRadius = LENGTH(15);
//        userimage.frame = CGRectMake(0, 0, LENGTH(30), LENGTH(30));
//        userimage.center = center;
//        [self addSubview:userimage];
//    }
    //    for (int i = 0; i < allimagearray.count; i++) {
    //        CGPoint center = [allimagearray[i] CGPointValue];
    //        FLAnimatedImageView * userimage = [FLAnimatedImageView new];
    //        userimage.backgroundColor = RANDOMCOLOR;
    //        userimage.layer.masksToBounds = YES;
    //        if (i == 0) {
    //            userimage.layer.cornerRadius = LENGTH(25);
    //            userimage.frame = CGRectMake(0, 0, LENGTH(50), LENGTH(50));
    //        }else if (i<7){
    //            userimage.layer.cornerRadius = LENGTH(20);
    //            userimage.frame = CGRectMake(0, 0, LENGTH(40), LENGTH(40));
    //        }else{
    //            userimage.layer.cornerRadius = LENGTH(15);
    //            userimage.frame = CGRectMake(0, 0, LENGTH(30), LENGTH(30));
    //        }
    //
    //        userimage.center = center;
    //        [self addSubview:userimage];
    ////        [userimage mas_makeConstraints:^(MASConstraintMaker *make) {
    ////            make.center.mas_equalTo(center);
    ////            make.width.mas_equalTo(LENGTH(20));
    ////            make.height.mas_equalTo(LENGTH(20));
    ////
    ////        }];
    //    }
}
- (void)addanimal:(UIBezierPath*)path{
    CAShapeLayer * animLayer = [CAShapeLayer layer];
    animLayer.path = path.CGPath;
    //            animLayer.fillColor = [UIColor clearColor].CGColor;
    animLayer.lineWidth = 1.f;
    animLayer.strokeColor = RGB(31,184,236).CGColor;
    animLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:animLayer];
//    // 创建Animation
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    animation.fromValue = @(0.0);
//    animation.toValue = @(1.0);
//    animLayer.autoreverses = NO;
//    animation.duration = 5.0;
////    animation.repeatCount = NSIntegerMax;
//        animation.repeatCount = 1;
//    
//    // 设置layer的animation
//    [animLayer addAnimation:animation forKey:nil];
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    FLAnimatedImageView * oneImage = onearray[0];
    BaseButton * butone = buttonearray[0];
    if (itemarray.count>0) {
        FoundUserModel * userModel = itemarray[0];
        UIImage * img;
        if (userModel.sex == 1) {
            img = UIIMAGE(ZHANWEITUTXN);
        }else{
            img = UIIMAGE(ZHANWEITUTXV);
        }
        [oneImage sd_setImageWithURL:URLIMAGE(userModel.avatar) placeholderImage:img];
        butone.tag = [userModel.ssid integerValue];
        for (int i = 0 ; i < userModel.myFriend.count; i++) {
            FLAnimatedImageView * twoImage = twoarray[i];
            FoundUserModel * model = userModel.myFriend[i];
            BaseButton * buttwo = butttwoarray[i];

            UIImage * img1;
            if (model.sex == 1) {
                img1 = UIIMAGE(ZHANWEITUTXN);
            }else{
                img1 = UIIMAGE(ZHANWEITUTXV);
            }
            [twoImage sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:img1];
            buttwo.tag = [model.ssid integerValue];
//            for (int b = 0; b < model.myFriend.count; b++) {
//                FLAnimatedImageView * threeImage = threearray[b+i*2];
//                FoundUserModel * models = model.myFriend[b];
//                BaseButton * threebut = buttthreearray[b+i*2];
//
//                UIImage * img2;
//                if (models.sex == 1) {
//                    img2 = UIIMAGE(ZHANWEITUTXN);
//                }else{
//                    img2 = UIIMAGE(ZHANWEITUTXV);
//                }
//                [threeImage sd_setImageWithURL:URLIMAGE(models.avatar) placeholderImage:img2];
//                threebut.tag = [models.ssid integerValue];
//            }
        }
    }

}
- (void)layoutSubviews{
    [super layoutSubviews];
    //    CGFloat cha = self.frame.size.width - self.frame.size.height;
    radar_l  = self.frame.size.height/2 - LENGTH(30);
    center_w = self.center.x;
    center_h = self.center.y;
}
- (void)click:(BaseButton *)button{
    NSLog(@"%ld",button.tag);
    FriendViewController * vc = [FriendViewController new];
    vc.itemid = [NSString stringWithFormat:@"%ld",button.tag];
    [self.nav pushViewController:vc animated:YES];
}
@end
