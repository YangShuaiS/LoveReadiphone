//
//  GuideTaskOneView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^click)(void);
@interface GuideTaskOneView : BaseView
@property(nonatomic,copy)click block;

@end

NS_ASSUME_NONNULL_END
