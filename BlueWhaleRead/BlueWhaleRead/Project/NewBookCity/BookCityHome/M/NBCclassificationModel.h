//
//  NBCclassificationModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//  新书城分类

#import "BaseModel.h"

@interface NBCclassificationModel : BaseModel
//分类
@property (nonatomic, copy) NSString * book_logo;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * ssid;

//书单
@property (nonatomic, copy) NSString * style_id;
@property (nonatomic, copy) NSString * theme_img;

//theme
@property (nonatomic, copy) NSString * banner_img;

@end
