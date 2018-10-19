//
//  ZhiShiShuFLOneModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/16.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "ZhiShiShuTwoModel.h"
@interface ZhiShiShuFLOneModel : BaseModel
@property(nonatomic,strong)NSString * _id;//id
@property(nonatomic,strong)NSString * icon;//三角
@property(nonatomic,strong)NSString * logo;//清楚
@property(nonatomic,strong)NSString * mini_logo;//模糊
@property(nonatomic,strong)NSString * name;//名字
@property(nonatomic,strong)ZhiShiShuTwoModel * knowledge;
@property(nonatomic,strong)NSMutableArray * children;
@end
