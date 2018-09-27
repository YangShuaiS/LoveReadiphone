//
//  AcherPowerreadNumModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

@interface AcherPowerreadNumModel : BaseModel
@property(nonatomic,copy)NSString * classAllNum;
@property(nonatomic,copy)NSString * myReadNum;
@property(nonatomic,copy)NSString * maxBookNum;
@property(nonatomic,strong) NSMutableArray * classBook;
@property(nonatomic,strong) NSMutableArray * myMonthReadNum;

@end
