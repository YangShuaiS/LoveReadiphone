//
//  NBTXGMLTView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBTXGMLTView.h"
#import "ZhiShiShuShuViewController.h"
@implementation NBTXGMLTView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    self.backgroundColor = RGB(255, 255, 255);
    self.layer.masksToBounds = YES;
    WS(ws);
    UIImageView * leftimageview = [UIImageView new];
    leftimageview.contentMode = UIViewContentModeScaleAspectFit;
    leftimageview.image = UIIMAGE(@"椭圆2");
    [self addSubview:leftimageview];
    [leftimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(12));
        make.right.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(leftimageview.image.size.width), LENGTH(leftimageview.image.size.height)));
    }];
    
    BaseLabel * jj = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@"相关脉络图"];
    [self addSubview:jj];
    [jj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(12));
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
    }];
    
    _scrollView = [UIScrollView new];
    _scrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(jj.mas_bottom).with.offset(LENGTH(13));
        make.left.and.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(19));
        make.height.mas_equalTo(LENGTH(94));
    }];
    
    _pageFlowView = [[HQFlowView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, LENGTH(94))];
    _pageFlowView.delegate = self;
    _pageFlowView.dataSource = self;
    _pageFlowView.minimumPageAlpha = 0.3;
    _pageFlowView.leftRightMargin = LENGTH(30);
    _pageFlowView.topBottomMargin = LENGTH(7);
    _pageFlowView.isOpenAutoScroll = YES;
    _pageFlowView.autoTime = 5.0;
    _pageFlowView.orientation = HQFlowViewOrientationHorizontal;
    [_scrollView addSubview:_pageFlowView];


}
- (void)setAdvArray:(NSMutableArray *)advArray{
    _advArray = advArray;
    _pageFlowView.orginPageCount = _advArray.count;
    [self.pageFlowView reloadData];//刷新轮播
    if (advArray.count == 0) {
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }

}

#pragma mark JQFlowViewDelegate
- (CGSize)sizeForPageInFlowView:(HQFlowView *)flowView
{
    return CGSizeMake(LENGTH(321), LENGTH(94));
}

- (void)didSelectCell:(UIView *)subView withSubViewIndex:(NSInteger)subIndex
{
    knowledgeTXListModel * model = _advArray[subIndex];
    ZhiShiShuShuViewController * vc = [ZhiShiShuShuViewController new];
    vc.itemid = model.ssid;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
#pragma mark JQFlowViewDatasource
- (NSInteger)numberOfPagesInFlowView:(HQFlowView *)flowView
{
    return self.advArray.count;
}
- (HQIndexBannerSubview *)flowView:(HQFlowView *)flowView cellForPageAtIndex:(NSInteger)index
{
    HQIndexBannerSubview *bannerView = (HQIndexBannerSubview *)[flowView dequeueReusableCell];
    knowledgeTXListModel * model = _advArray[index];
    if (!bannerView) {
        bannerView = [[HQIndexBannerSubview alloc] initWithFrame:CGRectMake(0, 0, self.pageFlowView.frame.size.width, self.pageFlowView.frame.size.height)];
        bannerView.layer.cornerRadius = 5;
        bannerView.layer.masksToBounds = YES;
        bannerView.coverView.backgroundColor = [UIColor clearColor];
        bannerView.mainImageView.contentMode = UIViewContentModeScaleAspectFill;
//        UIView * backviews = [[UIView alloc] initWithFrame:CGRectMake(0, LENGTH(131)-LENGTH(66), WIDTH, LENGTH(66))];
//        [bannerView addSubview:backviews];
//        CAGradientLayer *gradient = [CAGradientLayer layer];
//        gradient.frame = backviews.bounds;
//        //    gradient.colors = @[(id)RGBA(0, 0, 0, 1),RGBA(0, 0, 0, 0)];
//        UIColor * color1 = RGBA(3, 0, 0, 0.5);
//        UIColor * color2 = RGBA(0, 0, 0, 0);
//        gradient.colors = @[(id)color2.CGColor,(id)color1.CGColor];
//        gradient.locations = @[@0, @1];
//        gradient.startPoint = CGPointMake(0.5, 0);
//        gradient.endPoint = CGPointMake(0.5, 1);
//        [backviews.layer addSublayer:gradient];
        
//        BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFontCu(16) TextAlignment:NSTextAlignmentLeft Text:model.title];
//        [backviews addSubview:title];
//        [title mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.mas_equalTo(backviews).with.offset(-LENGTH(25));
//            make.left.mas_equalTo(backviews).with.offset(LENGTH(7));
//            make.right.mas_equalTo(backviews).with.offset(-LENGTH(7));
//        }];
//
//        BaseLabel * subtitle = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:model.banner_foreword];
//        [backviews addSubview:subtitle];
//        [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.mas_equalTo(backviews).with.offset(-LENGTH(4));
//            make.left.mas_equalTo(backviews).with.offset(LENGTH(7));
//            make.right.mas_equalTo(backviews).with.offset(-LENGTH(7));
//        }];
    }
    //在这里下载网络图片
    [bannerView.mainImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTXIMAGEURL,model.banner_img]] placeholderImage:nil];

//        [bannerView.mainImageView sd_setImageWithURL:URLIMAGE(model.banner_img) placeholderImage:nil];
    //加载本地图片
//    bannerView.mainImageView.image = [UIImage imageNamed:self.advArray[index]];
    
    return bannerView;
}

- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(HQFlowView *)flowView
{
    [self.pageFlowView.pageControl setCurrentPage:pageNumber];
}
#pragma mark --旋转屏幕改变JQFlowView大小之后实现该方法
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id)coordinator
{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
        [coordinator animateAlongsideTransition:^(id context) { [self.pageFlowView reloadData];
        } completion:NULL];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void)dealloc
{
    self.pageFlowView.delegate = nil;
    self.pageFlowView.dataSource = nil;
    [self.pageFlowView stopTimer];
}

@end
