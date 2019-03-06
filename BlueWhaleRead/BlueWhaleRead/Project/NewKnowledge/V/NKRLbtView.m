//
//  NKRLbtView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NKRLbtView.h"
#import "NKRSearch.h"
#import "LBTViewController.h"

@interface NKRLbtView ()<SDCycleScrollViewDelegate>

@end

@implementation NKRLbtView{
    SDCycleScrollView * cycleScrollerView;
    NKRSearch * search;
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
    cycleScrollerView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    cycleScrollerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollerView.pageControlDotSize = CGSizeMake(20, 20);;
    cycleScrollerView.currentPageDotColor = RGB(130, 217, 216);// 自定义分页控件小圆标颜色
    cycleScrollerView.pageDotColor = RGBA(0xaa, 0xaa, 0xaa, 0.6);
    cycleScrollerView.autoScrollTimeInterval = 3;
    [ws addSubview:cycleScrollerView];
    
    [cycleScrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.equalTo(ws.mas_width).multipliedBy(0.573333333);
    }];
    
    search = [NKRSearch new];
    [self addSubview:search];
    [search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.right.and.left.mas_equalTo(ws);
    }];
}
#pragma mark - 代理方法
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
//    NBCclassificationModel * model = _model.themeTop[index];
//    NBCThemeViewController * vc = [NBCThemeViewController new];
//    vc.bannerid = model.ssid;
//    vc.imageurl = [NSString stringWithFormat:@"%@%@",IMAGEURL,model.banner_img];
//    [[self viewController].navigationController pushViewController:vc animated:YES];
    LBTViewController * vc = [LBTViewController new];
    vc.inter = 1;
    LunboModel * model = _itemArray[index];
    vc.itemid = model.ssid;
    vc.imageurl = cycleScrollerView.imageURLStringsGroup[index];
    [[self viewController].navigationController pushViewController:vc animated:YES];
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
@end