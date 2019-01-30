//
//  TKPGAndReadView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKPGAndReadView : BaseView
@property(nonatomic,assign)TaxkXqStyele style;
@property (strong, nonatomic) TAKALLModel *model;
@property(nonatomic,strong)NSMutableArray * colorarray;
@property(nonatomic,assign) NSInteger frien;//0 自己 1他人
@property(nonatomic,assign) NSInteger ing;//0 1正在进行
@end

NS_ASSUME_NONNULL_END
