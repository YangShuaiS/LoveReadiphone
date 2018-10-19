//
//  ZhiShiShuTimeLineModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface ZhiShiShuTimeLineModel : BaseModel
@property(nonatomic,strong)NSString * _id;//id
@property(nonatomic,strong)NSString * color;//颜色
@property(nonatomic,strong)NSString * created_at;//id
@property(nonatomic,assign)CGFloat end_y;//终点
@property(nonatomic,strong)NSString * name;//名字
@property(nonatomic,assign)CGFloat start_y;//起点
@property(nonatomic,strong)NSString * updated_at;//id

@end

