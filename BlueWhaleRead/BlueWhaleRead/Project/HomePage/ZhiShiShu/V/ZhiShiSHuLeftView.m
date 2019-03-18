//
//  ZhiShiSHuLeftView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiSHuLeftView.h"

@implementation ZhiShiSHuLeftView{
    CAGradientLayer *gradient;
    
    NSMutableArray * labelviewarray;
    NSMutableArray * labelarray;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
}
- (void)addview{
    self.backgroundColor = [UIColor clearColor];
    self.layer.masksToBounds = YES;
    labelarray = [NSMutableArray array];
    labelviewarray = [NSMutableArray array];
    _axidataarry = [NSMutableArray array];
    
//    gradient = [CAGradientLayer layer];
//    [self.layer addSublayer:gradient];

}
//- (void)layoutSubviews{
//    [super layoutSubviews];
////    gradient.frame = self.bounds;
////    gradient.colors = [NSArray arrayWithObjects:
////                       (id)[UIColor magentaColor].CGColor,
////                       (id)[UIColor cyanColor].CGColor,
////                       (id)[UIColor greenColor].CGColor, nil];
//////    gradient.startPoint = CGPointMake(0, 0);
//////    gradient.endPoint = CGPointMake(1, 1);
////    gradient.locations = @[@0.0, @0.5, @1];
//
//}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

- (void)setAxidataarry:(NSMutableArray *)axidataarry{
    [_axidataarry addObjectsFromArray:axidataarry];
    WS(ws);
    for (NSInteger i = labelarray.count; i <_axidataarry.count; i++) {
        ZhiShiShuTimeLineModel * model = _axidataarry[i];
        CGFloat star = model.start_y;
        CGFloat end = model.end_y;
        if (star<=0) {
            star = 0;
        }
        BaseView * view = [BaseView new];
        view.backgroundColor = [BaseObject colorWithHexString:model.color];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws);
            make.width.mas_equalTo(ws);
            make.top.mas_equalTo(ws).with.offset(star*poinw);
            make.height.mas_equalTo((end-star)*poinw);
        }];
        
        BaseLabel * text = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor whiteColor] LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:model.name];
        text.numberOfLines = 0;
        [view addSubview:text];
        [text mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
//            make.centerY.mas_equalTo(10);
//            make.edges.mas_equalTo(view);
            make.left.and.right.mas_equalTo(view);
        }];
        [labelviewarray addObject:view];
        [labelarray addObject:text];
    }
    
}

- (void)setSizefloat:(CGFloat)sizefloat{
    _sizefloat = sizefloat;
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);
    __block ZhiShiSHuLeftView * blockSelf = self;
    dispatch_sync(queue, ^{
        for (int i = 0 ; i < blockSelf.axidataarry.count; i ++) {
            ZhiShiShuTimeLineModel * model =blockSelf.axidataarry[i];
            CGFloat star = model.start_y * poinw;
            CGFloat end = model.end_y * poinw;
            BaseLabel * label = blockSelf->labelarray[i];
            BaseView * view = blockSelf->labelviewarray[i];
            CGFloat downy = 0.0;
            if (star <= sizefloat && end > sizefloat){
                if (sizefloat + blockSelf.neirongheight < end) {
                    downy = sizefloat - star + blockSelf.neirongheight/2;
                }else{
                    downy = (end - blockSelf.sizefloat)/2+ blockSelf.sizefloat- star;
                }
            }
            if (star > sizefloat && end > sizefloat && end < sizefloat +blockSelf.neirongheight) {
                downy = (end-star)/2;
            }
            if (star > sizefloat && end > sizefloat + blockSelf.neirongheight ) {
                downy = (blockSelf.sizefloat + blockSelf.neirongheight - star)/2;
            }
            downy = downy- label.frame.size.height/2;
            dispatch_async(dispatch_get_main_queue(), ^{
                [label mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(view).with.offset(downy);
//                    make.centerY.mas_equalTo(downy);

                }];
            });

        }
    });

    
//    for (NSInteger i = 0; i <_axidataarry.count; i++) {
//        ZhiShiShuTimeLineModel * model = _axidataarry[i];
//        CGFloat star = model.start_y * poinw;
//        CGFloat end = model.end_y * poinw;
//        if (star < sizefloat && end > sizefloat) {
//            BaseLabel * label = labelarray[i];
//            BaseView * view = labelviewarray[i];
//
//            if (sizefloat + _neirongheight < end) {
//                CGFloat topcenty = sizefloat - star + _neirongheight/2;
//                [label mas_updateConstraints:^(MASConstraintMaker *make) {
//                    make.top.mas_equalTo(view).with.offset(topcenty);
//                }];
//            }else{
//                CGFloat topcenty = sizefloat - star + (end - sizefloat)/2;
//                [label mas_updateConstraints:^(MASConstraintMaker *make) {
//                    make.top.mas_equalTo(view).with.offset(topcenty);
//                }];
//                if (i != _axidataarry.count-1) {
//                    ZhiShiShuTimeLineModel * model1 = _axidataarry[i+1];
//                    CGFloat star1 = model1.start_y * poinw;
//                    CGFloat end1 = model1.end_y * poinw;
//
//                    BaseLabel * label1 = labelarray[i+1];
//                    BaseView * view1 = labelviewarray[i+1];
//                    CGFloat downy = 0.0;
//                    downy = (_sizefloat + _neirongheight - star1)/2;
//                    if (end < _sizefloat + _neirongheight && star1 < _sizefloat + _neirongheight) {
//                        downy = (_sizefloat + _neirongheight - star - star1)/2;
//                    }
//
//                    if (i + 2 < _axidataarry.count) {
//                        ZhiShiShuTimeLineModel * model2 = _axidataarry[i+2];
//                        CGFloat star2 = model1.start_y * poinw;
//                        CGFloat end2 = model2.end_y * poinw;
//                        BaseLabel * label2 = labelarray[i+2];
//                        BaseView * view2 = labelviewarray[i+2];
//                        if (end1 < _sizefloat + _neirongheight && star2 < _sizefloat + _neirongheight) {
//                            downy = (_sizefloat + _neirongheight - star1 - star2)/2;
//                        }
//                    }
//
//
//
//                    [label1 mas_updateConstraints:^(MASConstraintMaker *make) {
//                        make.top.mas_equalTo(view1).with.offset(downy);
//                    }];
//                }
//            }
//
//        }
//    }
    
}
@end
