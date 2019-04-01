//
//  HomeLBTView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeLBTView.h"
#import "LBTViewController.h"
#import "ArticleViewController.h"
#import "LBTCollectionViewCell.h"
@implementation HomeLBTView{
    SDCycleScrollView * cycleScrollerView;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self AddView];
    }
    return self;
}
- (void)AddView{
    WS(ws);

    //轮播图
    cycleScrollerView = [SDCycleScrollView new];
    cycleScrollerView.delegate = self;
    cycleScrollerView.pageControlStyle = SDCycleScrollViewPageContolStyleNone;
//    cycleScrollerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
//    cycleScrollerView.pageControlDotSize = CGSizeMake(20, 20);;
//    cycleScrollerView.currentPageDotColor = RGB(130, 217, 216);// 自定义分页控件小圆标颜色
//    cycleScrollerView.pageDotColor = RGBA(0xaa, 0xaa, 0xaa, 0.6);
    cycleScrollerView.autoScrollTimeInterval = 3;

//    cycleScrollerView.backgroundColor = RGB(255, 255, 255);
    //    cycleScrollerView.layer.cornerRadius = 10;
    //    cycleScrollerView.layer.masksToBounds = YES;
    [ws addSubview:cycleScrollerView];
    
    [cycleScrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.equalTo(ws.mas_width).multipliedBy(0.573333333);
    }];
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    NSMutableArray * imageArray = [NSMutableArray array];
    for (LunboModel * model in itemArray) {
        NSString * url = [NSString stringWithFormat:@"%@%@",IMAGEURL,model.banner_img];
        [imageArray addObject:url];
    }
    cycleScrollerView.imageURLStringsGroup = imageArray;

}

#pragma mark - 代理方法
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    LunboModel * model = _itemArray[index];
    if (model.banner_type == 1) {
        LBTViewController * vc = [LBTViewController new];
        vc.inter = 1;
        vc.itemid = model.ssid;
        vc.imageurl = cycleScrollerView.imageURLStringsGroup[index];
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }else{
        ArticleViewController * vc = [ArticleViewController new];
        vc.itemid = model.ssid;
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }
}
- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view{
    if (view != cycleScrollerView) {
        return nil;
    }
    return [LBTCollectionViewCell class];
}

- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view
{
    LBTCollectionViewCell *myCell = (LBTCollectionViewCell *)cell;
    myCell.model = _itemArray[index];
}
@end
