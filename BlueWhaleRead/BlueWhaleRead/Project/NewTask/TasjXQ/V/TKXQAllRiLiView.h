//
//  TKXQAllRiLiView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKXQAllRiLiView : BaseView
@property(nonatomic,assign)TaxkXqStyele style;
@property (strong, nonatomic) TAKALLModel *model;
@property(nonatomic,strong)NSMutableArray * colorarray;
@end

NS_ASSUME_NONNULL_END
