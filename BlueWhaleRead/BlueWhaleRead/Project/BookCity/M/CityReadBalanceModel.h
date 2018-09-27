//
//  CityReadBalanceModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface CityReadBalanceModel : BaseModel
@property (nonatomic, assign) CGFloat balance;//平衡比例
@property (nonatomic, copy) NSString * catalog_id;//分类id
@property (nonatomic, copy) NSString * catalog_name;//分类名
@property (nonatomic, copy) NSString *   ssid;//分类id
@property (nonatomic, copy) NSString * status;//状态
@property (nonatomic, copy) NSString * student_id;//学生id

@end
