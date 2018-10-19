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
//            make.edges.mas_equalTo(view);
            make.top.and.left.and.right.mas_equalTo(view);
        }];
        [labelviewarray addObject:view];
        [labelarray addObject:text];
    }
    
}

- (void)setSizefloat:(CGFloat)sizefloat{
    _sizefloat = sizefloat;
    for (NSInteger i = 0; i <_axidataarry.count; i++) {
        ZhiShiShuTimeLineModel * model = _axidataarry[i];
        CGFloat star = model.start_y;
        CGFloat end = model.end_y;
        if (star*poinw<sizefloat&&end*poinw>sizefloat) {
            BaseLabel * label = labelarray[i];
            BaseView * view = labelviewarray[i];
            
            WS(ws);
            [label mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(view).with.offset(sizefloat-star*poinw);
            }];
            break;
        }
    }
    
}
@end
