//
//  ZhiShiShuModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuModel.h"

@implementation ZhiShiShuModel
+ (void)InitializeModel{
    [ZhiShiShuDataModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"point":@"ZhiShiShuNeiRongModel",@"relation":@"ZhiSHiShuXianModel",@"axis":@"ZhiShiShuTimeLineModel",@"line_type":@"ZhiShiShuLineModel",@"relation_type":@"ZhiShiShuViTypeModel",@"vi_type":@"ZhiShiShuViTypeModel"};
    }];
}
@end
