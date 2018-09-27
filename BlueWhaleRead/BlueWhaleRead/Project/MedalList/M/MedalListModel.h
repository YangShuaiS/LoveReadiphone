//
//  MedalListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "MedalBadgeListModel.h"
#import "MedalBageFriendModel.h"
@interface MedalListModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) NSMutableArray *badgeList;

+ (void)InitializeModel;
@end
