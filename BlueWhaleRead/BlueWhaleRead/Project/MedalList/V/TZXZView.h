//
//  TZXZView.h
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^MyBlock)(void);//block写法比较特殊，一般重命名一下
typedef void(^TZXZBlock)(void);


@interface TZXZView : BaseView
@property (nonatomic,copy)MyBlock block;//定义一个MyBlock属性
@property (nonatomic,copy)TZXZBlock tzxzBlock;

@property(nonatomic,strong) MedalListDetailModel * model;
@end
