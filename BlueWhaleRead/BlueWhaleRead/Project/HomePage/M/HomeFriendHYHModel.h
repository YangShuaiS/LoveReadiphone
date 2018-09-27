//
//  HomeFriendHYHModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/31.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface HomeFriendHYHModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, copy) NSString * bookCount;//总书数
@property(nonatomic, assign)NSInteger totalCount;


@property(nonatomic, strong)NSMutableArray *friendBook;
+ (void)InitializeModel;

@end
