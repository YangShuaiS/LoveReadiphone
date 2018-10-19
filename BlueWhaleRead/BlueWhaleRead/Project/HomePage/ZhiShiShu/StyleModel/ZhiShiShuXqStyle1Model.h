//
//  ZhiShiShuXqStyle1Model.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/11.
//  Copyright © 2018年 YS. All rights reserved.
//

//书列表

#import "BaseModel.h"

@interface ZhiShiShuXqStyle1Model : BaseModel
@property(nonatomic,strong)NSString * _id;//id
@property(nonatomic,strong)NSString * created_at;//
@property(nonatomic,strong)NSString * name;//名字
@property(nonatomic,strong)NSString * style_id;//样式id
@property(nonatomic,strong)NSString * updated_at;//

@property(nonatomic,strong)NSMutableArray * books;//图书

@end

