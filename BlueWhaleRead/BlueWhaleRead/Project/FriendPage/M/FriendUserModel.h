//
//  FriendUserModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/20.
//  Copyright © 2018年 YS. All rights reserved.
//  上面视图model

#import "BaseModel.h"

@interface FriendUserModel : BaseModel
@property (nonatomic, copy) NSString * avatar;
@property (nonatomic, copy) NSString * level;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * rank;
@property (nonatomic, copy) NSString * readNum;
@property (nonatomic, copy) NSString * score;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, copy) NSString * ssid;

//@property (nonatomic, copy) NSString * bookCount;
//@property (nonatomic, copy) NSString * class_seq;
//@property (nonatomic, copy) NSString * u_id;
//@property (nonatomic, copy) NSString * user_score;

@end
