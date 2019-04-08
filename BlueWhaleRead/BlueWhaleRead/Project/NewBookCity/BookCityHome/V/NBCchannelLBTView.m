//
//  NBCchannelLBTView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/16.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBCchannelLBTView.h"
#import "NBCThemeViewController.h"
#import "NBCMoreChannelViewController.h"
#import "NBCSearchView.h"

@interface NBCchannelLBTView ()<SDCycleScrollViewDelegate>

@end

@implementation NBCchannelLBTView{
    SDCycleScrollView * cycleScrollerView;
    BaseLabel * label;
    NBCSearchView * search;

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
    
    search = [NBCSearchView new];
    [self addSubview:search];
    [search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.right.and.left.mas_equalTo(ws);
    }];
    
    label = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"全部专题"];
    label.backgroundColor = RGB(91,199,198);
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(17));
        make.right.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(90));
        make.height.mas_equalTo(LENGTH(32));
    }];
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(allzt)];
    //将手势添加到需要相应的view中去
    [label addGestureRecognizer:tapviewtap];


}
- (void)allzt{
    NBCMoreChannelViewController * vc = [NBCMoreChannelViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:label.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(LENGTH(16), LENGTH(16))];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = label.bounds;
    maskLayer.path = maskPath.CGPath;
    label.layer.mask  = maskLayer;
}
- (void)setModel:(NBCALLModel *)model{
    _model = model;
    NSMutableArray * imagearray = [NSMutableArray array];
    for (int i = 0; i < _model.themeTop.count; i++) {
        if (i < 6) {
            NBCclassificationModel * model = _model.themeTop[i];
            NSString * url = [NSString stringWithFormat:@"%@%@",IMAGEURL,model.banner_img];
            [imagearray addObject:url];
        }
    }
    cycleScrollerView.imageURLStringsGroup = imagearray;
}
#pragma mark - 代理方法
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NBCclassificationModel * model = _model.themeTop[index];
    NBCThemeViewController * vc = [NBCThemeViewController new];
    vc.bannerid = model.ssid;
    vc.imageurl = [NSString stringWithFormat:@"%@%@",IMAGEURL,model.banner_img];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

@end
