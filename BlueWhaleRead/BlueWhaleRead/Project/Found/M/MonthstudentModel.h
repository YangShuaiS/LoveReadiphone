//
//  MonthstudentModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface MonthstudentModel : BaseModel
@property (nonatomic, assign) NSInteger myRank;
@property (nonatomic, strong) NSMutableArray *studentList;

@end
