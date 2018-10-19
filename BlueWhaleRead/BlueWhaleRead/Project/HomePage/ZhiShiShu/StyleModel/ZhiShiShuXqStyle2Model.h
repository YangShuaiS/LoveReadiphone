//
//  ZhiShiShuXqStyle2Model.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface ZhiShiShuXqStyle2Model : BaseModel
@property(nonatomic,strong)NSString * _id;//id
@property(nonatomic,strong)NSString * created_at;//
@property(nonatomic,strong)NSString * desc;//
@property(nonatomic,strong)NSString * name;//名字
@property(nonatomic,strong)NSString * style_id;//样式id
@property(nonatomic,strong)NSString * updated_at;//

@property(nonatomic,strong)NSMutableArray * img;//图片数组


@end
