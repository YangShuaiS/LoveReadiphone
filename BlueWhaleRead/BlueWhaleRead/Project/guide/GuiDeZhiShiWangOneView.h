//
//  GuiDeZhiShiWangOneView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/27.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^click)(void);
@interface GuiDeZhiShiWangOneView : BaseView
@property(nonatomic,assign)CGRect frames;
@property(nonatomic,copy)click block;
@end

NS_ASSUME_NONNULL_END
