//
//  BookXQReadFriendModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface BookXQReadFriendModel : BaseModel
@property (nonatomic, copy) NSString * avatar;
@property (nonatomic, copy) NSString * level;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * readnum;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * score;//总积分

@property(nonatomic,strong) NSMutableArray * badgeList; // CityBadgeListModel

@end
