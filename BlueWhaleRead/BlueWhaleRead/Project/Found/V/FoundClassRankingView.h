//
//  FoundClassRankingView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef NS_ENUM(NSInteger, RankingStyle) {
    RankingStyleAll = 0,//全部
    RankingStyleSmall = 1, //部分
};
@interface FoundClassRankingView : BaseView
@property (nonatomic, strong) FoundMonthModel *monthBadgeList;//你的同学

@property (nonatomic, strong) MonthstudentModel *monthList;//你的同学

@property(nonatomic,assign) RankingStyle styles;
-(NSInteger)backheight;
@end

