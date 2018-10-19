//
//  ZhiShiShuLineModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/18.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface ZhiShiShuLineModel : BaseModel
@property(nonatomic,strong)NSString * _id;//id
@property(nonatomic,strong)NSString * created_at;//
@property(nonatomic,strong)NSMutableArray * img;//图片
@property(nonatomic,strong)NSString * name;//title
@property(nonatomic,strong)NSString * updated_at;//更新时间
@property(nonatomic,strong)NSString * color;//颜色
@end

