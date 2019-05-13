//
//  BuyInvitationView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/25.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^UpData)(NSInteger inter);

@interface BuyInvitationView : BaseView
@property(nonatomic,copy)UpData blocks;
@property (nonatomic, strong) BuyAllModel* model;
@property (nonatomic, strong) BuyPackage* package;

@end

NS_ASSUME_NONNULL_END
