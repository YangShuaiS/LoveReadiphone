//
//  BookFriendModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface BookFriendModel : BaseModel
@property(nonatomic,copy)NSString * ssid;
@property(nonatomic,copy)NSString * cover;
@property(nonatomic,copy)NSString * name;
@property (nonatomic, strong) NSMutableArray *studentList;
@end
