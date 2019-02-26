//
//  ZhiSHiShuXianModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
@interface ZhiSHiShuXianModel : BaseModel
@property(nonatomic,strong)NSString * _id;//id
@property(nonatomic,strong)NSString * color;//线颜色
@property(nonatomic,strong)NSString * created_at;//创建时间
@property(nonatomic,assign)CGFloat end_x;//id
@property(nonatomic,assign)CGFloat end_y;//CGFloat
@property(nonatomic,assign)CGFloat start_x;//id
@property(nonatomic,assign)CGFloat start_y;//id
@property(nonatomic,strong)NSString * updated_at;//更新时间

@property(nonatomic,assign)NSInteger line_arrow_direction;//0 无箭头   1  左箭头   2  右箭头   3  双箭头
@property(nonatomic,assign)CGFloat line_thickness;//现款
@property(nonatomic,strong)NSString * line_words;//文本

@end
