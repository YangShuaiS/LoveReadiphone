//
//  TAKweeksInfoModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TAKweeksInfoModel : BaseModel
@property (nonatomic, copy) NSString * glossaryNum;//总识词次数
@property (nonatomic, copy) NSString * literacyNum;//总识字次数
@property (nonatomic, strong) NSMutableArray * read_time;
@property (nonatomic, strong) NSMutableArray * weeks;

@end

NS_ASSUME_NONNULL_END
