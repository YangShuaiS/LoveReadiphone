//
//  ZhiShiShuDownClickModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/2.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZhiShiShuDownClickModel : BaseModel
@property(nonatomic,strong)NSString * _id;//id
@property(nonatomic,strong)NSString * click_to_id;//id
@property(nonatomic,assign)NSInteger click_type;//id
@property(nonatomic,strong)NSString * created_at;//id
@property(nonatomic,assign)CGFloat height;//id
@property(nonatomic,strong)NSString * img;//id
@property(nonatomic,strong)NSString * updated_at;//id
@property(nonatomic,assign)CGFloat width;//id
@property(nonatomic,assign)CGFloat x_axis;//id
@property(nonatomic,assign)CGFloat y_axis;//id

@end

NS_ASSUME_NONNULL_END
