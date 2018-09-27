//
//  HomeLBTView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeLBTView.h"
#import "LBTViewController.h"
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
    cycleScrollerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollerView.pageControlDotSize = CGSizeMake(20, 20);;
    cycleScrollerView.dotColor = RGBA(0xff, 0x5e, 0x4d, 1); // 自定义分页控件小圆标颜色
    //    cycleScrollerView.layer.cornerRadius = 10;
    //    cycleScrollerView.layer.masksToBounds = YES;
    [ws addSubview:cycleScrollerView];
    
    [cycleScrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.equalTo(ws.mas_width).multipliedBy(0.32552);
    }];
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    NSMutableArray * imageArray = [NSMutableArray array];
    for (LunboModel * model in itemArray) {
        NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,model.banner_img];
        [imageArray addObject:url];
    }
    cycleScrollerView.imageURLStringsGroup = imageArray;

}

#pragma mark - 代理方法
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    LBTViewController * vc = [LBTViewController new];
    LunboModel * model = _itemArray[index];
    vc.itemid = model.ssid;
    [self.nav pushViewController:vc animated:YES];
}

@end
