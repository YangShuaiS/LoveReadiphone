//
//  ZhiShiShuAnimalView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/4.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^ClickNolock)(void);

@interface ZhiShiShuAnimalView : BaseView
@property(nonatomic,copy)ClickNolock block;

@end

NS_ASSUME_NONNULL_END
