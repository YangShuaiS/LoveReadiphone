//
//  BadgeListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface BadgeListModel : BaseModel
@property(nonatomic,copy)NSString * badgeNum;//点亮中人数
@property(nonatomic,copy)NSString * getBadgeNum;//获得勋章的人数
@property(nonatomic,copy)NSString * info;//信息
@property(nonatomic,copy)NSString * logo;//logo
@property(nonatomic,copy)NSString * name;//名
@property(nonatomic,copy)NSString * ssid;//勋章id


//@property(nonatomic,copy)NSString * badge_id;
//@property(nonatomic,copy)NSString * info;
//@property(nonatomic,copy)NSString * level;
//@property(nonatomic,copy)NSString * logo;
//@property(nonatomic,copy)NSString * name;
//@property(nonatomic,copy)NSString * num;
//@property(nonatomic,copy)NSString * receive_num;
//@property(nonatomic,copy)NSString * type;
@end
