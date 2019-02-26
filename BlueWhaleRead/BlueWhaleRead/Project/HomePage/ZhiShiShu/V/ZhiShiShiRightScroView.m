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
    scroviewhd = YES;
    self.backgroundColor = RGBA(0, 0, 0, 0.4);
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.bounces = NO;
    scrollView.directionalLockEnabled=YES;//定向锁定
//    scrollView.scrollEnabled = NO;
    //    scrollView.alwaysBounceHorizontal = YES;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
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
        if (scrollView.contentOffset.y<=alltopheights) {
            [view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self->scrollView).with.offset(-scrollView.contentOffset.y);
            }];
        }else{
            [view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self->scrollView).with.offset(-self->alltopheights);
            }];
        }
    }
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    view.itemarray = itemarray;
}
- (void)setScroy:(CGFloat)scroy{
    _scroy = scroy;
    scroviewhd = NO;
    [scrollView setContentOffset:CGPointMake(0, scroy) animated:NO];
    if (alltopheights == 0) {
        
    }else{
        if (scroy<=alltopheights) {
                [view mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self->scrollView).with.offset(-scroy);
                }];
        }else{
            [view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self->scrollView).with.offset(-self->alltopheights);
            }];
        }
    }

}
- (void)setAllheight:(CGFloat)allheight{
    _allheight = allheight;
    view.allheight = allheight;
}
- (void)setTopheight:(CGFloat)topheight{
    _topheight = topheight;
    view.topheight = topheight;
}
- (void)setLabelheight:(CGFloat)labelheight{
    alltopheights = labelheight;
}
@end
