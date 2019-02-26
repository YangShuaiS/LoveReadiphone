//
//  NKRClassificationModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NKRClassificationModel : BaseModel
@property (nonatomic, copy) NSString * _id;
@property (nonatomic, copy) NSString * img;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * status;

@end

NS_ASSUME_NONNULL_END
