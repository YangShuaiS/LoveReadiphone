//
//  MingShiDDView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^ClickBlock)(void);//

@interface MingShiDDView : BaseView
//@property (nonatomic, strong) BookXQReadThoughtModel* model;
@property(nonatomic,strong)ClickBlock block;
@property (nonatomic, strong) BookXQReadThoughtModel * model;

@end
