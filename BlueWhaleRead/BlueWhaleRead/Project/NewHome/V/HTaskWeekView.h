//
//  HTaskWeekView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/10.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTaskWeekView : BaseView
@property(nonatomic,assign) NSInteger frien;//0 自己 1他人
@property(nonatomic,assign) NSInteger ing;//0 1正在进行
@property(nonatomic,assign) NSInteger noweek;//
@property (nonatomic , strong)NHTimeListModel * model;
@property(nonatomic,strong)NSMutableArray * colorarray;

@end

NS_ASSUME_NONNULL_END
