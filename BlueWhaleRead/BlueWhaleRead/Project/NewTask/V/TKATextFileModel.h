//
//  TKATextFileModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKATextFileModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, copy) NSString * lottert_id;
@property (nonatomic, copy) NSString * periods_num;
@property (nonatomic, copy) NSString * prize_level;
@property (nonatomic, strong) TAKJPModel * prize;

@end

NS_ASSUME_NONNULL_END
