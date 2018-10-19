//
//  ZhiShiShuXQScroview.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuXQScroview.h"
#import "ZhiShiShuBookStyleView1All.h"
#import "ZhiShiShuXQImagesAndTitle.h"
@implementation ZhiShiShuXQScroview{
    UIScrollView * scrollView;
    NSMutableArray * viewarray;
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
//    self.backgroundColor = [UIColor whiteColor];
//    self.layer.masksToBounds = YES;
//    self.layer.cornerRadius = LENGTH(40);
//    self.layer.shadowOpacity = 1;
//    self.layer.shadowColor = RGB(1,149,151).CGColor;
//    self.layer.shadowRadius = 2.0f;
//    self.layer.shadowOffset = CGSizeMake(0,0);
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

//滑动停止时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //更新UIPageControl的当前页
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    self.block(offset.x / bounds.size.width);
}
- (void)setPage:(NSInteger)page{
    _page = page;
    //令UIScrollView做出相应的滑动显示
    CGSize viewSize = scrollView.frame.size;
    CGRect rect = CGRectMake(page * viewSize.width, 0, viewSize.width, viewSize.height);
    [scrollView scrollRectToVisible:rect animated:YES];
}



- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    WS(ws);
    viewarray = [NSMutableArray array];

    for (int i = 0; i < _itemarray.count; i++) {
        if ([_itemarray[i]isMemberOfClass:[ZhiShiShuXqStyle1Model class]]){
            ZhiShiShuXqStyle1Model * model = _itemarray[i];
            ZhiShiShuBookStyleView1All * style1 = [ZhiShiShuBookStyleView1All new];
            style1.model = model;
            [viewarray addObject:style1];
        }else if ([_itemarray[i]isMemberOfClass:[ZhiShiShuXqStyle2Model class]]){
            ZhiShiShuXqStyle2Model * model = _itemarray[i];
            ZhiShiShuXQImagesAndTitle * style1 = [ZhiShiShuXQImagesAndTitle new];
            style1.model = model;
            [viewarray addObject:style1];
        }
    }
    scrollView.contentSize = CGSizeMake(self.frame.size.width*viewarray.count, self.frame.size.height);

    //过渡视图添加子视图
    BaseView *previousView =nil;
    for (int i = 0; i < viewarray.count; i++) {
        BaseView * imageView  = viewarray[i];
        imageView.nav = self.nav;
        [scrollView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws);
            make.bottom.equalTo(ws);
            make.width.mas_equalTo(ws);
            if (previousView)
            {
                make.left.mas_equalTo(previousView.mas_right);
            }
            else
            {
                make.left.mas_equalTo(self->scrollView);
            }
            
        }];
        previousView = imageView;
    }
}
@end
