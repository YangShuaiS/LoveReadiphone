//
//  CityTypeListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface CityTypeListModel : BaseModel
@property(nonatomic,strong) NSMutableArray * child;//二级分类

@property (nonatomic, copy) NSString * logo;//大分类logo
@property (nonatomic, copy) NSString * name;//大分类名
@property (nonatomic, copy) NSString * ssid;//大分类id
@property (nonatomic, copy) NSString * parent_id;//父级id
@property (nonatomic, assign) NSInteger status;//状态

@property (nonatomic, assign) NSInteger type;//点击状态，手写

@end
