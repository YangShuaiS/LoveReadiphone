//
//  TagModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface TagModel : BaseModel
@property(nonatomic,assign)NSInteger item_id;
@property(nonatomic,copy)NSString * iconImg;
@property(nonatomic,copy)NSString * iconName;
@property(nonatomic,assign)NSInteger seq;
@property(nonatomic,copy)NSString * ssid;

@end
