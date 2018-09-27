//
//  NavigationMenuView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef NS_ENUM(NSInteger, NavMenuStyle) {
    NavMenuStyleGeneral = 0,//通用
    NavMenuStyleMore = 1,//右面为字和图加电价事件
    NavMenuStyleAll = 2, //右面字+点击事件
};
typedef void(^ClickBlock)(void);//

@interface NavigationMenuView : BaseView
@property(nonatomic,assign)NavMenuStyle style;
@property(nonatomic,strong)ClickBlock block;

@property(nonatomic,strong)NSString * leftTitle;
@property(nonatomic,strong)NSString * rightTitle;

- (void)remohyh;
@end
