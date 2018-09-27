//
//  PersonQingChuHUanCunView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^ClickBlock)(void);
@interface PersonQingChuHUanCunView : BaseView
@property (nonatomic,copy)ClickBlock block;//定义一个MyBlock属性

@end
