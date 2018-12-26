//
//  TAKmissionRoleModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TAKmissionRoleModel : BaseModel
@property (nonatomic, copy) NSString * glossary_num;//规定的识词量次数
@property (nonatomic, copy) NSString * ssid;//规则id
@property (nonatomic, copy) NSString * literacy_num;//识字量次数
@property (nonatomic, copy) NSString * mission_duration;//周期
@property (nonatomic, copy) NSString * mission_id;//任务id
@property (nonatomic, copy) NSString * week_book_num;//每周读书数
@property (nonatomic, copy) NSString * week_share_num;//每周分享数
@property (nonatomic, copy) NSString * share_score;//规则id
@property (nonatomic, copy) NSString * literacy_score;//规则id
@property (nonatomic, copy) NSString * glossary_score;//规则id

@property (nonatomic, copy) NSString * high_grade;//规则id


@end

NS_ASSUME_NONNULL_END
