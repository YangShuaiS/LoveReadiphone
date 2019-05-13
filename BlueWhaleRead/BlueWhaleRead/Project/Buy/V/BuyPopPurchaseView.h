//
//  BuyPopPurchaseView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/28.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^Remove)(void);

@interface BuyPopPurchaseView : BaseView
@property(nonatomic,copy)Remove remove;

@end

NS_ASSUME_NONNULL_END
