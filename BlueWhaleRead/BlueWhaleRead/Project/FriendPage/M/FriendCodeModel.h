//
//  FriendCodeModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/20.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "FriendUserModel.h"
@interface FriendCodeModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property(nonatomic,strong) FriendUserModel * friendInfo;
@property(nonatomic,strong) NSMutableArray * friendReadList;//学生读书
@property(nonatomic,strong) NSMutableArray * friendBadgeList;//学生勋章

@property(nonatomic,strong) NSMutableArray * badge;
+ (void)InitializeModel;

@end
