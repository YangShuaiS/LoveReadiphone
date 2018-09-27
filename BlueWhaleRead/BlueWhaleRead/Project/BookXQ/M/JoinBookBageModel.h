//
//  JoinBookBageModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/8/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "JoinBookBageXQModel.h"

@interface JoinBookBageModel : BaseModel
@property (nonatomic, strong) JoinBookBageXQModel * badgeinfo;
@property (nonatomic, strong) NSMutableArray * studentBadgeBook;
@end
