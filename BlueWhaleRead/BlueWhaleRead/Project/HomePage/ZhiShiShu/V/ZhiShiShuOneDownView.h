//
//  ZhiShiShuOneDownView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#pragma mark -------------- Nav样式
typedef NS_ENUM(NSInteger, DownStyle) {
    DownStyleJC = 0,//基础
    DownStyleZR = 1, //自然
    DownStyleRW = 2, //人文，
    DownStyleMX = 3, //美学，
    DownStyleKJ = 4, //科技
};
@interface ZhiShiShuOneDownView : BaseView
@property(nonatomic,assign)DownStyle downstyle;
@property(nonatomic,strong) ZhiShiShuFLOneModel * model;
@end
