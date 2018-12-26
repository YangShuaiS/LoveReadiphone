//
//  NHthisWeekInfoModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "NHthisReadbokModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NHthisWeekInfoModel : BaseModel
@property (nonatomic, copy) NSString * book_is_completed;//完成
@property (nonatomic, copy) NSString * book_Score;
@property (nonatomic, copy) NSString * completed_time;
@property (nonatomic, copy) NSString * glossary_is_completed;
@property (nonatomic, copy) NSString * literacy_is_completed;
@property (nonatomic, copy) NSString * lottery_time;
@property (nonatomic, copy) NSString * rankinfo;//1上升
@property (nonatomic, copy) NSString * received_time;
@property (nonatomic, copy) NSString * share_is_completed;
@property (nonatomic, strong) NSMutableArray * readBookInfo;

@end

NS_ASSUME_NONNULL_END
