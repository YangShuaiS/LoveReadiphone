//
//  TKPWQpastLottery1InfoModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "TKPstudentListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TKPWQpastLottery1InfoModel : BaseModel
@property (nonatomic, copy) NSString * prize_img;//时间
@property (nonatomic, copy) NSString * ssid;//期数
@property (nonatomic, strong) NSMutableArray *studentList;//学生数组
@end

NS_ASSUME_NONNULL_END
