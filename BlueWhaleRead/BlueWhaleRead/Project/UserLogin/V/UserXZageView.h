//
//  UserXZageView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^clicks)(NSString * str);

@interface UserXZageView : BaseView
@property(nonatomic,copy)clicks block;

@end

NS_ASSUME_NONNULL_END
