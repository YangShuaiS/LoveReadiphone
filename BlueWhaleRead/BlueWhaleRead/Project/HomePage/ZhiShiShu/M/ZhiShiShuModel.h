//
//  ZhiShiShuModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "ZhiShiShuDataModel.h"
#import "ZhiShiShuNeiRongModel.h"
#import "ZhiSHiShuXianModel.h"
#import "ZhiShiShuTimeLineModel.h"
#import "ZhiShiShuViTypeModel.h"
#import "ZhiShiShuLineModel.h"
@interface ZhiShiShuModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property(nonatomic,strong) ZhiShiShuDataModel * data;
+ (void)InitializeModel;
@end
