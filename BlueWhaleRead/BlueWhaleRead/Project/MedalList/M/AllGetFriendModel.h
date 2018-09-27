//
//  AllGetFriendModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface AllGetFriendModel : BaseModel
@property (nonatomic, copy) NSString * author;
@property (nonatomic, copy) NSString * level;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) NSInteger read_book_num;
@property (nonatomic, copy) NSString * u_id;

@property (nonatomic, strong) NSMutableArray *friendBadgeList;//CityBadgeListModel?

@end
