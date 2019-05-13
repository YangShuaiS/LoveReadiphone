//
//  BuyYaoQingModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/6.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BuyYaoQingModel : BaseModel
@property (nonatomic, copy) NSString * difference_name;
@property (nonatomic, assign) NSInteger difference_num;
@property (nonatomic, copy) NSString * small_program_code;
@property (nonatomic, copy) NSMutableArray * invitedInfoList;
@property (nonatomic, copy) NSMutableArray * invitedStudentList;
@property (nonatomic, copy) NSMutableArray * preInvited;

@end

NS_ASSUME_NONNULL_END
