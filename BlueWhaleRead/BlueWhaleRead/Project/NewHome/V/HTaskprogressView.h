//
//  HTaskprogressView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/9.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTaskprogressView : BaseView
@property(nonatomic,assign)NSInteger inter;//0 首页  1 详情
@property(nonatomic,strong)NSMutableArray * colorarray;
@property(nonatomic,assign)NSInteger mission_type;
@property(nonatomic,assign)CGFloat jindu;//完成

@end

NS_ASSUME_NONNULL_END
