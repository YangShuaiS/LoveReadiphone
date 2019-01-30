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
@property(nonatomic,strong)NSString * text_color;//字体颜色

@property(nonatomic,strong)NSString * status;//状态 1 可点击
@property(nonatomic,strong)NSString * n_logo;//不可点击图片



@property(nonatomic,strong)NSMutableArray * knowledge;
//@property(nonatomic,strong)ZhiShiShuTwoModel * knowledge;


@property(nonatomic,strong)NSMutableArray * children;
@end
