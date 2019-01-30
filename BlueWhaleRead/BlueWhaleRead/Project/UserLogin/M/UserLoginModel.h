//
//  UserLoginModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "levelListModel.h"
@interface UserLoginModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) NSMutableDictionary * studentInfo;

@property (nonatomic, strong) NSMutableArray * levelList;

+ (void)InitializeModel;

@end
