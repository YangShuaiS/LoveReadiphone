//
//  ZhiShiShiRightScroView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/25.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ZhiShiShiRightScroView.h"
#import "ZhiShiShurightNriRongView.h"
@implementation ZhiShiShiRightScroView{
    UIScrollView * scrollView;
    ZhiShiShurightNriRongView * view;
    BOOL scroviewhd;//yes  zuo  no 右
    CGFloat alltopheights;
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

    if (@available(iOS 11.0, *)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    scroviewhd = YES;
//    self.backgroundColor = RGBA(0, 0, 0, 0.4);
//    BaseLabel * label = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"全部知识图"];
//    [self addSubview:label];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(ws).with.offset(StatusBar);
//        make.left.mas_equalTo(ws).with.offset(LENGTH(23));
//        make.height.mas_equalTo(NavHeight-StatusBar);
//    }];
//
//    UIView * xian = [UIView new];
//    xian.backgroundColor = [UIColor whiteColor];
//    [self addSubview:xian];
//    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(label.mas_bottom);
//        make.left.mas_equalTo(label);
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(17));
//        make.height.mas_equalTo(1);
//    }];
//
    
    scrollView = [UIScrollView new];
//    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.backgroundColor = RGBA(0, 0, 0, 0.4);
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.bounces = NO;
    scrollView.directionalLockEnabled=YES;//定向锁定
//    scrollView.scrollEnabled = NO;
    //    scrollView.alwaysBounceHorizontal = YES;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    view = [ZhiShiShurightNriRongView new];
    [scrollView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(ws);
        make.top.and.bottom.mas_equalTo(self->scrollView);
    }];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    scroviewhd = YES;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scroviewhd == YES) {
        self.blocks(scrollView.contentOffset.y);
    }
    if (alltopheights == 0) {
        
    }else{
//        WS(ws);
//        if (scrollView.contentOffset.y<=alltopheights) {
//            [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(ws).with.offset(NavHeight+ws.topheight-scrollView.contentOffset.y);
//            }];
////            [view mas_updateConstraints:^(MASConstraintMaker *make) {
////                make.top.mas_equalTo(self->scrollView).with.offset(-scrollView.contentOffset.y);
////            }];
//        }else{
//            [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(ws).with.offset(NavHeight+ws.topheight-self->alltopheights);
//            }];
////            [view mas_updateConstraints:^(MASConstraintMaker *make) {
////                make.top.mas_equalTo(self->scrollView).with.offset(-self->alltopheights);
////            }];
//        }
    }
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    view.backcolor = _backcolor;
    view.itemarray = itemarray;
}
- (void)setScroy:(CGFloat)scroy{
    _scroy = scroy;
    scroviewhd = NO;
    [scrollView setContentOffset:CGPointMake(0, scroy) animated:NO];
    if (alltopheights == 0) {
        
    }else{
//        if (scroy<=alltopheights) {
//            WS(ws);
//            [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(ws).with.offset(NavHeight+ws.topheight-scroy);
//            }];
////                [view mas_updateConstraints:^(MASConstraintMaker *make) {
////                    make.top.mas_equalTo(self->scrollView).with.offset(-scroy);
////                }];
//        }else{
//            WS(ws);
//            [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(ws).with.offset(NavHeight+ws.topheight-self->alltopheights);
//            }];
////            [view mas_updateConstraints:^(MASConstraintMaker *make) {
////                make.top.mas_equalTo(self->scrollView).with.offset(-self->alltopheights);
////            }];
//        }
    }

}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    self.blockss();
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.blockss();
}
- (void)setAllheight:(CGFloat)allheight{
    _allheight = allheight;
    view.allheight = allheight;
}
- (void)setTopheight:(CGFloat)topheight{
    _topheight = topheight-LENGTH(10);
    view.topheight = topheight-LENGTH(10);
}
- (void)setLabelheight:(CGFloat)labelheight{
    _labelheight = labelheight;
    alltopheights = labelheight;
    WS(ws);
    [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(NavHeight+ws.topheight-self->alltopheights);
    }];

}
@end
