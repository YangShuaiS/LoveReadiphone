//
//  JoinBookModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/8/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "JoinBookBageModel.h"
@interface JoinBookModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) JoinBookBageModel * bookBadge;

+ (void)InitializeModel;
@end
