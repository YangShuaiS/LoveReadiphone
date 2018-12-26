//
//  TUpView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark -------------- 任务
typedef NS_ENUM(NSInteger, TUpViewStyle) {
    TUpViewStyleMore = 0,//更多天
    TUpViewStyleWeek = 1, //倒计时一周
};

@interface TUpView : BaseView
@property(nonatomic,assign)TUpViewStyle TUpStyel;
@property(nonatomic,strong)NewHomeModel* model;

@end

NS_ASSUME_NONNULL_END
