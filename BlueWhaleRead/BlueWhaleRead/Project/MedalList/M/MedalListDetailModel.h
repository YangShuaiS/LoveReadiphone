//
//  MedalListDetailModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MedalListDetailModel : BaseModel
@property (nonatomic, copy) NSString * badge_id;
@property (nonatomic, copy) NSString * descriptions;//系统关键字
@property (nonatomic, copy) NSString * friend_receiveNum;
@property (nonatomic, copy) NSString * info;
@property (nonatomic, copy) NSString * logo;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) NSInteger read_book_num;
@property (nonatomic, copy) NSString * receive_num;
@property (nonatomic, copy) NSString * status;

@property (nonatomic, strong) NSMutableArray *bookList;
@property (nonatomic, strong) NSMutableArray *friendList;
@property (nonatomic, strong) NSMutableArray *getFriendList;

@end
