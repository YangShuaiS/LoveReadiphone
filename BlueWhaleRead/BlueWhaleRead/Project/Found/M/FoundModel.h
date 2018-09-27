//
//  FoundModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "FoundFriendBooKModel.h"
#import "FoundLikeBookModel.h"
#import "FoundGoodArticleModel.h"
#import "FoundbadgeRankModel.h"
#import "FoundUserModel.h"
#import "FoundMonthModel.h"
@interface FoundModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;

//@property (nonatomic, strong) NSMutableArray *badgeRank;
//@property (nonatomic, strong) NSMutableArray *friendLikeBook;

@property (nonatomic, strong) NSMutableArray *studentFriendList;//好友列表
@property (nonatomic, strong) NSMutableArray *myFriendBookList;//你的同学
@property (nonatomic, strong) FoundMonthModel *monthBadgeList;//你的同学
@property (nonatomic, strong) NSMutableArray *classBookList;//同学最爱
@property (nonatomic, strong) NSMutableArray *bookThoughtList;
+ (void)InitializeModel;

@end
