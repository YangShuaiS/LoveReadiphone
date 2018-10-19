//
//  ZhiShiShuNeiRongModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface ZhiShiShuNeiRongModel : BaseModel
@property(nonatomic,strong)NSString * _id;//id
@property(nonatomic,strong)NSString * created_at;//创建时间
@property(nonatomic,strong)NSString * desc;//？？
@property(nonatomic,assign)CGFloat height;//图片高
@property(nonatomic,strong)NSString * name;//text内容
@property(nonatomic,strong)NSString * pic;//图
@property(nonatomic,strong)NSString * updated_at;//更新时间
@property(nonatomic,strong)NSString * vi_logo;//text前图
@property(nonatomic,assign)CGFloat width;//图高
@property(nonatomic,assign)CGFloat x_axis;//中心点x
@property(nonatomic,assign)CGFloat y_axis;//中心点y

@property(nonatomic,strong)NSString * flag;//
@property(nonatomic,strong)NSMutableArray * underline;
@end
