//
//  ZhiShiShuClickModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/22.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZhiShiShuClickModel : BaseModel
@property(nonatomic,strong)NSString * _id;//id
@property(nonatomic,strong)NSString * arrow_words;//id
@property(nonatomic,strong)NSString * click_to_id;//id
@property(nonatomic,strong)NSString * click_type;//id
@property(nonatomic,strong)NSString * created_at;//id
@property(nonatomic,strong)NSString * knowledge_arrow_id;//id
@property(nonatomic,strong)NSString * knowledge_id;//id
@property(nonatomic,strong)NSString * left_img;//id
@property(nonatomic,strong)NSString * middle_img;//id
@property(nonatomic,strong)NSString * right_img;//id
@property(nonatomic,strong)NSString * updated_at;//id
@property(nonatomic,assign)CGFloat  x_axis;//id
@property(nonatomic,assign)CGFloat  y_axis;//id
@property(nonatomic,strong)NSString * arrow_words_color;//id
@property(nonatomic,strong)NSString * arrow_type;//1里面 2外面

@property(nonatomic,assign)NSInteger  banner_type;//id



@end

NS_ASSUME_NONNULL_END
