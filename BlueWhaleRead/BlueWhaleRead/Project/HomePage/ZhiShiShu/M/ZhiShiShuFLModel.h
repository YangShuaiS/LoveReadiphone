//
//  ZhiShiShuFLModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/16.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "ZhiShiShuFLOneModel.h"
@interface ZhiShiShuFLModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property(nonatomic,strong) NSMutableArray * data;
+ (void)InitializeModel;

@end
