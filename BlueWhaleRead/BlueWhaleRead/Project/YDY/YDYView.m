//
//  YDYView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "YDYView.h"
#import "YDYCollectView.h"
@implementation YDYView{
//    YDYCollectView * collectView;
    UIScrollView * scrollView;
    UIPageControl*pageControl;

}

- (instancetype)init
    {
        self = [super init];
        if (self) {
            [self addView];
        }
        return self;
    }
- (void)addView{
//    WS(ws);
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.itemSize = CGSizeMake(WIDTH,HEIGHT);
//    //定义每个UICollectionView 横向的间距
//    flowLayout.minimumLineSpacing = LENGTH(0);
//    //定义每个UICollectionView 纵向的间距
//    flowLayout.minimumInteritemSpacing = LENGTH(0);
//    //定义每个UICollectionView 的边距距
//    flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(0), 0, LENGTH(0));//上左下右
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//
//    collectView = [[YDYCollectView alloc]initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
//
//    [self addSubview:collectView];
//    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(ws).with.offset(0);
//        make.top.equalTo(ws).with.offset(LENGTH(0));
//        make.right.equalTo(ws).with.offset(0);
////        make.bottom.equalTo(ws).with.offset(LENGTH(0));
////        make.height.mas_equalTo(HEIGHT);
//        make.height.mas_equalTo(LENGTH(300));
//
//    }];
//
    NSMutableArray * arr = [NSMutableArray array];
    [arr addObject:@"引导页-1"];
    [arr addObject:@"引导页-2"];
    [arr addObject:@"引导页-3"];
//    collectView.array = arr;
    
    
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = RANDOMCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:scrollView];
    WS(ws);
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    scrollView.contentSize = CGSizeMake(WIDTH*3, HEIGHT);

    //过渡视图添加子视图
    FLAnimatedImageView *previousView =nil;
    BaseLabel * ljty;
    for (int i = 0; i < arr.count; i++) {
        FLAnimatedImageView * imageView  = [FLAnimatedImageView new];
        imageView.image = UIIMAGE(arr[i]);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [scrollView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws);
            make.bottom.equalTo(ws);
            make.width.mas_equalTo(WIDTH);
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
        if (i == 2) {
            ljty = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(135,135,135) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"立即体验"];
            ljty.layer.borderWidth = LENGTH(1);
            ljty.layer.borderColor = RGB(204, 204, 204).CGColor;
            [imageView addSubview:ljty];
            [ljty mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(imageView.mas_bottom).with.offset(-LENGTH(40));
                make.centerX.mas_equalTo(imageView.mas_centerX);
                make.height.mas_equalTo(36);
                make.width.mas_equalTo(140);
            }];
            imageView.userInteractionEnabled = YES;
            ljty.userInteractionEnabled = YES;
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneButton)];
            [ljty addGestureRecognizer:tap];
        }
    }
    
    BaseLabel * tiaoguo = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(166,166,166) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"跳过"];
    tiaoguo.layer.borderWidth = 1;
    tiaoguo.layer.borderColor = RGB(166,166,166).CGColor;
    tiaoguo.layer.masksToBounds = YES;
    tiaoguo.layer.cornerRadius = LENGTH(13);
    [self addSubview:tiaoguo];
    [tiaoguo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(40+LENGTH(10));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(28));
        make.width.mas_equalTo(LENGTH(66));
        make.height.mas_equalTo(LENGTH(26));
    }];
    
    pageControl = [UIPageControl new];
    pageControl.backgroundColor = [UIColor clearColor];
    pageControl.numberOfPages = 3;
    pageControl.tintColor = RGB(161,160,160);
    pageControl.pageIndicatorTintColor = RGB(216,215,215);
    pageControl.currentPageIndicatorTintColor= [UIColor blackColor];
//    [pageControl addTarget:self action:@selector(pageControlClicked) forControlEvents:UIControlEventValueChanged];
    [self addSubview:pageControl];
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(70));
        make.height.mas_equalTo(30);
    }];
    
    
    BaseButton * oneButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [oneButton addTarget:self action:@selector(oneButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:oneButton];
    [oneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(100));
        make.height.mas_equalTo(LENGTH(100));
    }];
    
}
//滑动停止时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //更新UIPageControl的当前页
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    if (offset.x / bounds.size.width == 2) {
        pageControl.hidden = YES;
    }else{
        pageControl.hidden = NO;
    }
    [pageControl setCurrentPage:offset.x / bounds.size.width];
}

//然后是点击UIPageControl时的响应函数pageTurn


- (void)pageTurn:(UIPageControl*)sender
{
    //令UIScrollView做出相应的滑动显示
    CGSize viewSize = scrollView.frame.size;
    CGRect rect = CGRectMake(sender.currentPage * viewSize.width, 0, viewSize.width, viewSize.height);
    [scrollView scrollRectToVisible:rect animated:YES];
}
- (void)pageControlClicked{
    
}
- (void)oneButton{
                    NSNotification *notification =[NSNotification notificationWithName:kNotificationDenglu object:nil userInfo:nil];
                    [[NSNotificationCenter defaultCenter] postNotification:notification];
}
@end
