//
//  ZHUTIMODEL.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "ZhuTiTagModel.h"
@interface ZHUTIMODEL : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property(nonatomic,strong) ZhuTiTagModel * tag;
+ (void)InitializeModel;
@end
