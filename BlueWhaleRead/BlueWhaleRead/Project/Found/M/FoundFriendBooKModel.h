//
//  FoundFriendBooKModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface FoundFriendBooKModel : BaseModel
@property (nonatomic, copy) NSString * avatar;
@property (nonatomic, copy) NSString * level; 
@property (nonatomic, copy) NSString * score;
@property (nonatomic, copy) NSString * ssid;
@property (nonatomic, copy) NSString * name;//
@property (nonatomic, assign) NSInteger sex;


@property (nonatomic, strong) NSMutableArray *badgeList;
@property (nonatomic, strong) NSMutableArray *studentBook;

@end
