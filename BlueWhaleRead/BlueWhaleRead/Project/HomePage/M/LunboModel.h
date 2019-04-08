//
//  LunboModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface LunboModel : BaseModel
@property(nonatomic,copy)NSString * banner_img;
@property(nonatomic,copy)NSString * ssid;
@property(nonatomic,copy)NSString * content;
@property(nonatomic,copy)NSString * item_id;
@property(nonatomic,copy)NSString * status;
@property(nonatomic,copy)NSString * title;
@property(nonatomic,assign)NSInteger related_type;


@property(nonatomic,strong)NSMutableArray * create_time;
@property(nonatomic,strong)NSMutableArray * update_time;


@property(nonatomic,assign)NSInteger banner_type; //1原先 2 新的
@property(nonatomic,copy)NSString * banner_foreword;

@end
