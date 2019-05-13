//
//  BuyTemporaryView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/22.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseView.h"
#import <StoreKit/StoreKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BuyTemporaryView : BaseView<SKPaymentTransactionObserver,SKProductsRequestDelegate>

@end

NS_ASSUME_NONNULL_END
