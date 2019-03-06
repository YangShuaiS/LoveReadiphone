//
//  ZhiShiShuTDListView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^rightscrviewblock)(void);
@interface ZhiShiShuTDListView : BaseView

@property(nonatomic,copy)rightscrviewblock block;

@property(nonatomic,assign)NSInteger style;

@end

NS_ASSUME_NONNULL_END
