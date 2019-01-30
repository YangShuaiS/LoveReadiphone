//
//  MMyViewCenterView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/16.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^GenBlock)(NSInteger inter);

@interface MMyViewCenterView : BaseView
@property(nonatomic,copy)GenBlock block;

@end

NS_ASSUME_NONNULL_END
