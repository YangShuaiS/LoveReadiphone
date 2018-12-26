//
//  TKXQRLModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKXQRLModel : BaseModel
@property (nonatomic, copy) NSDate * day;//riqi、年月
@property (nonatomic, strong) NSMutableArray * itemarray;//riqi、年月
@property (nonatomic, assign) NSInteger qiwz;//起始位置
@property (nonatomic, copy) NSString * read_time;


@end

NS_ASSUME_NONNULL_END
