//
//  FoundMonthModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface FoundMonthModel : BaseModel
@property (nonatomic, assign) NSInteger  myRank;
@property (nonatomic, assign) NSInteger  sex;

@property (nonatomic, strong) NSMutableArray *studentList;//你的同学
@property (nonatomic, copy) NSString *myAvatar;//你的同学

@end
