//
//  TAKprizeView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TAKprizeView.h"
#import "NewTKPrizeViewController.h"
#import "TAKJPView.h"
#import <iCarousel.h>
@interface TAKprizeView ()<iCarouselDataSource, iCarouselDelegate>
@property (nonatomic, strong) iCarousel      *carousel;   // iCarousel
@end
@implementation TAKprizeView{
    NSMutableArray * array;
    NSTimer *timer;
    
    UIImageView * onejp;
    BaseLabel * onetitle;
    BaseLabel * onesubtitle;
    
    UIImageView * twojp;
    BaseLabel * twotitle;
    BaseLabel * twosubtitle;
    
    UIImageView * threejp;
    BaseLabel * threetitle;
    BaseLabel * threesubtitle;
    
    BaseLabel * alljp;
    NSInteger inter;
    UIView * backv;
    
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
    array = [NSMutableArray array];
//
//    iCarouselTypeLinear = 0,
//    iCarouselTypeRotary,
//    iCarouselTypeInvertedRotary,
//    iCarouselTypeCylinder,
//    iCarouselTypeInvertedCylinder,
//    iCarouselTypeWheel,
//    iCarouselTypeInvertedWheel,
//    iCarouselTypeCoverFlow,
//    iCarouselTypeCoverFlow2,
//    iCarouselTypeTimeMachine,
//    iCarouselTypeInvertedTimeMachine,
//    iCarouselTypeCustom
    self.carousel = [iCarousel new];
    self.carousel.backgroundColor = [UIColor clearColor];
    _carousel.layer.masksToBounds = YES;
    _carousel.type = iCarouselTypeRotary;
    _carousel.pagingEnabled = YES;
    _carousel.autoscroll = 0;
    _carousel.viewpointOffset = CGSizeMake(0, LENGTH(200));
    [self addSubview:_carousel];
    //    [_carousel setBackgroundColor:backgroundColor];
    [_carousel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(LENGTH(0), LENGTH(0), 0, LENGTH(0)));
        make.height.mas_equalTo(LENGTH(650));
    }];
    // 设置代理
    self.carousel.delegate   = self;
    self.carousel.dataSource = self;
    
    inter = 0;
    
    backv = [UIView new];
//    backv.backgroundColor = RANDOMCOLOR;
    backv.layer.masksToBounds = YES;
    backv.layer.cornerRadius  = LENGTH(18);
    [self addSubview:backv];
    [backv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(216)+LENGTH(80));
        make.centerX.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(36));
        make.width.mas_equalTo(LENGTH(125));
    }];
    
    
    UIView * bv = [UIView new];
    bv.backgroundColor = [UIColor clearColor];
    [self addSubview:bv];
    [bv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(216)+LENGTH(80));
        make.centerX.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(36));
        make.width.mas_equalTo(LENGTH(125));
    }];
    
    bv.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(qbjp)];
    //将手势添加到需要相应的view中去
    [bv addGestureRecognizer:tapviewtap];

    BaseLabel *  taskname= [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFontCu(16) TextAlignment:NSTextAlignmentLeft Text:@"全部奖品"];
    [bv addSubview:taskname];
    [taskname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(bv);
    }];
    
    UIImageView* jpjt = [UIImageView new];
    jpjt.contentMode = UIViewContentModeScaleAspectFit;
    UIImage * image = UIIMAGE(@"icon_个人资料_箭头");
    jpjt.image = image;
    jpjt.image = [jpjt.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    jpjt.tintColor = RGB(255, 255, 255);
    [bv addSubview:jpjt];
    [jpjt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(taskname);
        make.left.mas_equalTo(taskname.mas_right).with.offset(LENGTH(6));
        make.width.mas_equalTo(LENGTH(7));
        make.height.mas_equalTo(LENGTH(12));
    }];
    
    // 创建NSTimer对象
    timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(upanimal) userInfo:nil repeats:YES];
    // 加入RunLoop中
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer setFireDate:[NSDate distantPast]];

//    __block NSInteger time = 59; //倒计时时间
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//
//    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),3.0*NSEC_PER_SEC, 0); //每秒执行
//
//    dispatch_source_set_event_handler(_timer, ^{
////        NSLog(@"123");
//    });
//    dispatch_resume(_timer);

    
//    onejp = [UIImageView new];
//    onejp.contentMode = UIViewContentModeScaleAspectFit;
//    [self addSubview:onejp];
//    [onejp mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(ws);
//        make.top.mas_equalTo(ws);
//        make.width.and.height.mas_equalTo(LENGTH(140));
//    }];
//    
//    onetitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(75,127,127) LabelFont:TextFontCu(17) TextAlignment:NSTextAlignmentCenter Text:@"一等奖奖品"];
//    [self addSubview:onetitle];
//    [onetitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->onejp.mas_bottom).with.offset(LENGTH(2));
//        make.centerX.mas_equalTo(self->onejp);
//    }];
//    
//    onesubtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(75,127,127) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"小米平衡车一台"];
//    [self addSubview:onesubtitle];
//    [onesubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->onetitle.mas_bottom).with.offset(LENGTH(2));
//        make.centerX.mas_equalTo(self->onejp);
//    }];
//    
//    twojp = [UIImageView new];
//    twojp.contentMode = UIViewContentModeScaleAspectFit;
//    twojp.image = UIIMAGE(@"车");
//    [self addSubview:twojp];
//    [twojp mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(ws).with.offset(LENGTH(22));
//        make.top.mas_equalTo(ws).with.offset(LENGTH(78));
//        make.width.and.height.mas_equalTo(LENGTH(100));
//    }];
//    
//    twotitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(75,127,127) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentCenter Text:@"二等奖奖品"];
//    [self addSubview:twotitle];
//    [twotitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->twojp.mas_bottom).with.offset(LENGTH(2));
//        make.centerX.mas_equalTo(self->twojp);
//    }];
//    
//    twosubtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(75,127,127) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentCenter Text:@"小米平衡车一台"];
//    [self addSubview:twosubtitle];
//    [twosubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->twotitle.mas_bottom).with.offset(LENGTH(2));
//        make.centerX.mas_equalTo(self->twojp);
//    }];
//    
//    
//    threejp = [UIImageView new];
//    threejp.contentMode = UIViewContentModeScaleAspectFit;
//    threejp.image = UIIMAGE(@"车");
//    [self addSubview:threejp];
//    [threejp mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(22));
//        make.top.mas_equalTo(ws).with.offset(LENGTH(78));
//        make.width.and.height.mas_equalTo(LENGTH(100));
//    }];
//    
//    threetitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(75,127,127) LabelFont:TextFontCu(15) TextAlignment:NSTextAlignmentCenter Text:@"三等奖奖品"];
//    [self addSubview:threetitle];
//    [threetitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->threejp.mas_bottom).with.offset(LENGTH(2));
//        make.centerX.mas_equalTo(self->threejp);
//    }];
//    
//    threesubtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(75,127,127) LabelFont:TextFont(10) TextAlignment:NSTextAlignmentCenter Text:@"小米平衡车一台"];
//    [self addSubview:threesubtitle];
//    [threesubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->threetitle.mas_bottom).with.offset(LENGTH(2));
//        make.centerX.mas_equalTo(self->threejp);
//        make.bottom.mas_equalTo(ws);
//    }];
//    
//    alljp = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,118,26) LabelFont:TextFontCu(14) TextAlignment:NSTextAlignmentCenter Text:@"全部奖品 >"];
//    [self addSubview:alljp];
//    [alljp mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(15));
//        make.top.mas_equalTo(ws).with.offset(LENGTH(29));
//    }];
//    
//    alljp.userInteractionEnabled = YES;
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(qbjp)];
//    //将手势添加到需要相应的view中去
//    [alljp addGestureRecognizer:tap];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CAGradientLayer *gradientLayer0 = [[CAGradientLayer alloc] init];
    gradientLayer0.cornerRadius = 17.5;
    gradientLayer0.frame = backv.bounds;
    gradientLayer0.colors = @[
                              (id)[UIColor colorWithRed:109.0f/255.0f green:211.0f/255.0f blue:255.0f/255.0f alpha:1.0f].CGColor,
                              (id)[UIColor colorWithRed:182.0f/255.0f green:174.0f/255.0f blue:138.0f/255.0f alpha:1.0f].CGColor,
                              (id)[UIColor colorWithRed:255.0f/255.0f green:136.0f/255.0f blue:20.0f/255.0f alpha:1.0f].CGColor,
                              (id)[UIColor colorWithRed:255.0f/255.0f green:193.0f/255.0f blue:46.0f/255.0f alpha:1.0f].CGColor];
    gradientLayer0.locations = @[@0, @0, @0, @1];
    [gradientLayer0 setStartPoint:CGPointMake(0, 0.5)];
    [gradientLayer0 setEndPoint:CGPointMake(1, 0.5)];
    [backv.layer addSublayer:gradientLayer0];
}

- (void)qbjp{
    NewTKPrizeViewController * vc = [NewTKPrizeViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
- (void)setModel:(TAKALLModel *)model{
    _model = model;
}




#pragma mark -
#pragma mark iCarousel methods
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    // 元素个数
    return 3;
}

- (UIView *)carousel:(iCarousel *)carousel
  viewForItemAtIndex:(NSInteger)index      // view的标志
         reusingView:(UIView *)view         // 重用的view
{
    if (view == nil)
    {
        view = [[TAKJPView alloc] initWithFrame:CGRectMake(0, 0, LENGTH(168), LENGTH(216))];
        [array addObject:view];
        if (array.count == 3) {
            for (int i = 0 ; i < array.count; i++) {
                TAKJPView * view = array[i];
                if (i == 0) {
                    view.image = _model.mission.first_prize.prize_img;
                    view.name = [NSString stringWithFormat:@"%@%@台",_model.mission.first_prize.prize_name,_model.mission.first_prize_num];
                    view.titles = @"一等奖";
                }
                if (i == 1) {
                    view.image = _model.mission.second_prize.prize_img;
                    view.name = [NSString stringWithFormat:@"%@%@台",_model.mission.second_prize.prize_name,_model.mission.second_prize_num];
                    view.titles = @"二等奖";
                }
                if (i == 2) {
                    view.image = _model.mission.third_prize.prize_img;
                    view.name = [NSString stringWithFormat:@"%@%@台",_model.mission.third_prize.prize_name,_model.mission.third_prize_num];
                    view.titles = @"三等奖";
                }
            }
        }
    }

    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel
     valueForOption:(iCarouselOption)option
        withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.4f;
    }
    
    return value;
}

- (void)carousel:(__unused iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    //点击第几个
    //    [_carousel scrollToItemAtIndex:3 animated:YES];
    NSLog(@"Tapped view number: %ld", (long)index);
    

}

- (void)carouselCurrentItemIndexDidChange:(__unused iCarousel *)carousel {
    NSLog(@"%ld",carousel.currentItemIndex);
    inter = carousel.currentItemIndex;
}
//- (CGFloat)carouselItemWidth:(iCarousel *)carousel
//{
//    return LENGTH(200);
//}
//- (CGFloat)carouselItemWidth:(iCarousel *)carousel
//{
//    return WIDTH;
//}
- (void)dealloc{
    _carousel.delegate = nil;
    [_carousel removeFromSuperview];
}

- (void)upanimal{
    if (inter >= 0 && inter<2) {
        inter++;
        [_carousel scrollToItemAtIndex:inter animated:YES];
    }else if (inter == 2) {
        inter = 0;
        [_carousel scrollToItemAtIndex:inter animated:YES];
    }

}

- (void)xiaohui{
    [timer setFireDate:[NSDate distantFuture]];
    [timer invalidate];
    timer = nil;
}
@end
