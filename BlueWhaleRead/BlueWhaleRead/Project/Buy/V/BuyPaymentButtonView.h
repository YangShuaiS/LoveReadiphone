//
//  BuyPaymentButtonView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/25.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseView.h"
#import <StoreKit/StoreKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^Reloade)(void);

@interface BuyPaymentButtonView : BaseView<SKPaymentTransactionObserver,SKProductsRequestDelegate>
@property (nonatomic, strong) BuyPackage * model;
@property(nonatomic,copy)Reloade reloade;
@property (nonatomic, strong) BuyAllModel * models;

@end

NS_ASSUME_NONNULL_END
