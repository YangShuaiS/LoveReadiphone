//
//  BuyMembersView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/24.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^BuyStyle)(BuyPackage * pack);

@interface BuyMembersView : BaseView
@property (nonatomic, strong) BuyAllModel * model;
@property(nonatomic,copy)BuyStyle buyStyle;

@end

NS_ASSUME_NONNULL_END
