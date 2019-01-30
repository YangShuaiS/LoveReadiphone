//
//  HTaskWeekTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/10.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTaskWeekTableView : BaseTableView
@property(nonatomic,assign) NSInteger frien;//0 自己 1他人
@property(nonatomic,assign) NSInteger ing;//0 1正在进行
@property(nonatomic,assign) NSInteger noweek;//0 当前 1 不是

@property (nonatomic , strong)NSMutableArray * itemarray;
@property(nonatomic,strong)NSMutableArray * colorarray;
@end

NS_ASSUME_NONNULL_END
