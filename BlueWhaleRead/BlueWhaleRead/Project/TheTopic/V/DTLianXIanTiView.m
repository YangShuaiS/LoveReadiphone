//
//  DTLianXIanTiView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTLianXIanTiView.h"
#import "DTLianXUanXIang.h"

@interface DTLianXIanTiView()

@property (nonatomic,assign) CGPoint currentP;

@end

@implementation DTLianXIanTiView{
    NSMutableArray * tiarray;
    NSMutableArray * xuanxiangarray;
    
    NSMutableArray * quedingarray;
    NSMutableArray * quedingallarray;
    
    NSMutableArray * pathsarray;
    
    NSMutableArray * yhxzallarray;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self createUI];
        
    }
    return self;
}
- (void)setTiitemarray:(NSMutableArray *)tiitemarray{
    _tiitemarray = tiitemarray;
    if (tiarray.count == 0) {
        WS(ws);
        DTLianXUanXIang *lastView;
        for (int i = 0; i<_tiitemarray.count; i++) {
            TiMuModel * timu = _tiitemarray[i];
            DTLianXUanXIang * view = [DTLianXUanXIang new];
            view.name = timu.DaAn;
            view.model = timu;
            view.tag = 100+i;
            [view weixuanzhong];
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                if (i == 0) {
                    make.top.mas_equalTo(ws).with.offset(LENGTH(0));
                    
                }else{
                    make.top.equalTo(lastView.mas_bottom).with.offset(LENGTH(5));
                }
                make.left.equalTo(ws).with.offset(LENGTH(0));
                make.width.mas_equalTo(LENGTH(146));
                make.height.mas_equalTo(LENGTH(64));
            }];
            if (i == _tiitemarray.count) {
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(ws).with.offset(0);
                }];
            }
            lastView = view;
            [tiarray addObject:view];
        }
    }
}

- (void)setDaanitemarray:(NSMutableArray *)daanitemarray{
    _daanitemarray = daanitemarray;
    
    WS(ws);
    if (xuanxiangarray.count == 0) {
        DTLianXUanXIang *lastViews;
        for (int i = 0; i<_daanitemarray.count; i++) {
            TiMuModel * timu = _daanitemarray[i];
            DTLianXUanXIang * view = [DTLianXUanXIang new];
            view.name = timu.DaAn;
            view.model = timu;
            [view weixuanzhong];
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                if (i == 0) {
                    make.top.mas_equalTo(ws).with.offset(LENGTH(0));
                    
                }else{
                    make.top.equalTo(lastViews.mas_bottom).with.offset(LENGTH(5));
                }
                make.right.equalTo(ws).with.offset(0);
                make.width.mas_equalTo(LENGTH(146));
                make.height.mas_equalTo(LENGTH(64));
            }];
            if (i == 5) {
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(ws).with.offset(0);
                }];
            }
            lastViews = view;
            [xuanxiangarray addObject:view];
        }
    }
}
- (void)createUI{
    WS(ws);
    tiarray = [NSMutableArray array];
    xuanxiangarray = [NSMutableArray array];
    pathsarray = [NSMutableArray array];
    quedingarray = [NSMutableArray array];
    quedingallarray = [NSMutableArray array];
    //给view添加一个是手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]init];
    
    [panGesture addTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:panGesture];
    
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(quxiao:)];
    //将手势添加到需要相应的view中去
    [self addGestureRecognizer:tapGesture];
}
-(void)quxiao:(UITapGestureRecognizer *)quxiao{
    
    
    CGPoint point = [quxiao locationInView:self];
    int i = 0;
    int b = 9999;
    for (NSMutableArray * array in quedingallarray) {
        for (DTLianXUanXIang * view in array) {
            if(CGRectContainsPoint(view.frame,point)){
                for (DTLianXUanXIang *view in array) {
                    view.zhuangtai = NO;
                    [view weixuanzhong];
                }
                b = i;
            }
        }
        i++;
    }
    if (b != 9999) {
        [quedingallarray removeObjectAtIndex:b];
        [self setNeedsDisplay];
    }
    
    
    if (quedingarray.count == 2) {
        quedingarray = [NSMutableArray array];
    }
    //获取当前点
    self.currentP = [quxiao locationInView:self];
    //判断触摸点在不在按钮上
    for (DTLianXUanXIang *view in tiarray) {
        //判断点在不在某个范围内,按钮有没有选中
        if(CGRectContainsPoint(view.frame,self.currentP)&&view.zhuangtai==NO){
            if (quedingarray.count == 0) {
                view.zhuangtai = YES;
                [view xuanzhong];
                [quedingarray addObject:view];
            }
        }
    }
    if (quedingarray.count == 1) {
        for (DTLianXUanXIang *view in xuanxiangarray) {
            //判断点在不在某个范围内,按钮有没有选中
            if(CGRectContainsPoint(view.frame,self.currentP)&&view.zhuangtai==NO){
                if (quedingarray.count == 1) {
                    view.zhuangtai = YES;
                    [view xuanzhong];
                    [quedingarray addObject:view];
                    [quedingallarray addObject:quedingarray];
                    [self setNeedsDisplay];
                    
                }
            }
        }
    }
}
-(void)pan:(UIPanGestureRecognizer *)pan{
    if(pan.state == UIGestureRecognizerStateBegan){
        if (quedingarray.count == 2) {
            quedingarray = [NSMutableArray array];
            
        }
    }
    
    //获取当前点
    self.currentP = [pan locationInView:self];
//    NSLog(@"x=%f,y=%f",self.currentP.x,self.currentP.y);
    //判断触摸点在不在按钮上
    for (DTLianXUanXIang *view in tiarray) {
        //判断点在不在某个范围内,按钮有没有选中
        if(CGRectContainsPoint(view.frame,self.currentP)&&view.zhuangtai==NO){
            if (quedingarray.count == 0) {
                view.zhuangtai = YES;
                [view xuanzhong];
                [quedingarray addObject:view];
            }
        }
    }
    if (quedingarray.count == 1) {
        for (DTLianXUanXIang *view in xuanxiangarray) {
            //判断点在不在某个范围内,按钮有没有选中
            if(CGRectContainsPoint(view.frame,self.currentP)&&view.zhuangtai==NO){
                if (quedingarray.count == 1) {
                    view.zhuangtai = YES;
                    [view xuanzhong];
                    [quedingarray addObject:view];
                    [quedingallarray addObject:quedingarray];
                }
            }
        }
    }
    
    //重绘
    [self setNeedsDisplay];
    
    if(pan.state == UIGestureRecognizerStateEnded){

        
    }
    
}
-(void)drawRect:(CGRect)rect{
    if (quedingallarray.count == 0&&quedingarray.count==0) return;
    for (NSMutableArray * array in quedingallarray) {
        //把所有选中按钮中心连接
        UIBezierPath *path = [UIBezierPath bezierPath];
        DTLianXUanXIang * starview = array[0];
        DTLianXUanXIang * endview = array[1];
        CGPoint point = CGPointMake(CGRectGetMaxX(starview.frame)+LENGTH(5), starview.center.y);
        CGPoint points = CGPointMake(CGRectGetMinX(endview.frame)-LENGTH(5), endview.center.y);
        
//        [path moveToPoint:starview.center];
        [path moveToPoint:point];
        [path addLineToPoint:points];
//        [path addLineToPoint:endview.center];
        [RGB(254,165,79) setStroke];
        [path setLineWidth:2.0];
        [path setLineJoinStyle:kCGLineJoinRound];
        [path setLineCapStyle:kCGLineCapRound];
        [path stroke];
        
    }
    if (quedingarray.count == 1) {
        UIBezierPath * path = [UIBezierPath bezierPath];
        DTLianXUanXIang * starview = quedingarray[0];
        
        [path moveToPoint:starview.center];
        [path addLineToPoint:self.currentP];
        [RGB(254,165,79) setStroke];
        [path setLineWidth:2.0];
        [path setLineJoinStyle:kCGLineJoinRound];
        [path setLineCapStyle:kCGLineCapRound];
        [path stroke];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
}

//- (NSMutableArray *)zqdazarray{
//
//}

- (NSMutableArray *)yhxzarray{
    yhxzallarray = [NSMutableArray array];
    for (NSMutableArray * array in quedingallarray) {
        DTLianXUanXIang * starview = array[0];
        DTLianXUanXIang * endview = array[1];
        NSMutableArray * arr = [NSMutableArray array];
        [arr addObject:starview.model];
        [arr addObject:endview.model];
        [yhxzallarray addObject:arr];
    }
    
    // 利用block进行排序
    NSMutableArray * arra = [NSMutableArray array];
    for (NSMutableArray * modelarray in yhxzallarray) {
        TiMuModel * mod = modelarray[0];
        if ([mod.TiMu isEqualToString:@"option1"]) {
            [arra addObject:modelarray];
            for (NSMutableArray * modelarray in yhxzallarray) {
                TiMuModel * mod = modelarray[0];
                if ([mod.TiMu isEqualToString:@"option3"]) {
                    [arra addObject:modelarray];
                    for (NSMutableArray * modelarray in yhxzallarray) {
                        TiMuModel * mod = modelarray[0];
                        if ([mod.TiMu isEqualToString:@"option5"]) {
                            [arra addObject:modelarray];
                            for (NSMutableArray * modelarray in yhxzallarray) {
                                TiMuModel * mod = modelarray[0];
                                if ([mod.TiMu isEqualToString:@"option7"]) {
                                    [arra addObject:modelarray];
                                    for (NSMutableArray * modelarray in yhxzallarray) {
                                        TiMuModel * mod = modelarray[0];
                                        if ([mod.TiMu isEqualToString:@"option9"]) {
                                            [arra addObject:modelarray];
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    //临时
    
    // 利用block进行排序
//    NSArray *array2 = [yhxzallarray sortedArrayUsingComparator:
//                       ^NSComparisonResult(NSMutableArray *obj1, NSMutableArray *obj2) {
//                           //                           NSComparisonResult result = [obj1.catalogNum compare:obj2.catalogNum];
//                           NSComparisonResult result = [obj2.catalogNum compare:obj1.catalogNum];
//                           return result;
//                       }];

//    NSArray *result = [yhxzallarray sortedArrayUsingComparator:^NSComparisonResult(NSMutableArray* obj1, NSMutableArray* obj2) {
//
//        DTLianXUanXIang * starview = obj1[0];
//        DTLianXUanXIang * endview = obj2[0];
//        TiMuModel * model1 = starview.model;
//        TiMuModel * model2 = endview.model;
//
//
//        return [obj1[0] compare:obj2[0]]; //升序
//
//    }];
//    NSSortDescriptor *ageSD = [NSSortDescriptor sortDescriptorWithKey:@"TiMu" ascending:YES];
//    yhxzallarray  = [[yhxzallarray sortedArrayUsingDescriptors:@[ageSD]] mutableCopy];
//
//    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"TiMu" ascending:YES comparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//
//        if (obj1 == obj2) {
//            return NSOrderedSame;
//        } else if (obj1 > obj2){
//            // 当obj1大于obj2时, 本应该返回 NSOrderedDescending , 这里反转其结果, 使返回 NSOrderedAscending
//            return NSOrderedAscending;
//        } else {
//            return NSOrderedDescending;
//        }
//    }];
//
//    [yhxzallarray sortUsingDescriptors:@[sort]];

    return arra;
 
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
