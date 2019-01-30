//
//  UpAppModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/22.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UpAppModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, copy) NSString * iosVersionName;
@property (nonatomic, copy) NSString * iosVersionCode;
@property (nonatomic, copy) NSString * ipadVersionName;
@property (nonatomic, copy) NSString * ipadVersionCode;
@property (nonatomic, copy) NSString * isForceUpdate;

@end

NS_ASSUME_NONNULL_END
