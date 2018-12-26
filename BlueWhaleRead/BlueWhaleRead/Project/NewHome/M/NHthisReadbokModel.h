//
//  NHthisReadbokModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NHthisReadbokModel : BaseModel
@property (nonatomic, copy) NSString * read_time;
@property (nonatomic, copy) NSDate * timedate;
@property (nonatomic, copy) NSString * timeday;

@property (nonatomic, copy) NSString * book_num;


@property (nonatomic, assign)NSInteger type;//0:过去日期。 1:现在日期。 2:以后日期。 3:一读书。  4:开奖日
@property (nonatomic, assign)NSInteger types;//0:过去日期。 1:现在日期。 2:以后日期。 3:一读书。  4:开奖日

@property (nonatomic, copy) NSString * lottery_time;//开奖日
@property (nonatomic, copy) NSDate * lottery_timedate;
@property (nonatomic, copy) NSString * readbook;//一度📖数
@property (nonatomic, copy) NSString * periods_num;//第几期




@end

NS_ASSUME_NONNULL_END
