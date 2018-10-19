//
//  ZhiShiShuXqModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "ZhiShiShuXqStyle1Model.h"
#import "ZhiShiShuXqStyle2Model.h"
@interface ZhiShiShuXqModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property(nonatomic,strong) NSMutableArray * data;
+ (void)InitializeModel;
@end
