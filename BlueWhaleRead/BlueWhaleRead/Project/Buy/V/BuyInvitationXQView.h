//
//  BuyInvitationXQView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/26.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BuyInvitationXQView : BaseView
@property(nonatomic,assign)NSInteger now;//2完成
@property(nonatomic,assign)BOOL layerhiden;//是否有阴影
@property (nonatomic, strong) BuyYaoQingModel * model;

@end

NS_ASSUME_NONNULL_END
