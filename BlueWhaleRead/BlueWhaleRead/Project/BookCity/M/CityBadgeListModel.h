//
//  CityBadgeListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface CityBadgeListModel : BaseModel
@property (nonatomic, copy) NSString * min_logo;//小logo
@property (nonatomic, copy) NSString * name;//勋章名
@property (nonatomic, copy) NSString * ssid;


@property (nonatomic, copy) NSString * badge_id;
@property (nonatomic, copy) NSString * logo;
@property (nonatomic, copy) NSString * level;


@end
