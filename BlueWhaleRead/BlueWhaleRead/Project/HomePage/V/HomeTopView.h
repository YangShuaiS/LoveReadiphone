//
//  HomeTopView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//  首页最上面视图

#import "BaseView.h"
typedef void(^GenBlock)(void);

@interface HomeTopView : BaseView
@property(nonatomic,strong)HomeuserModel * model;
@property(nonatomic,copy)GenBlock block;
@end
