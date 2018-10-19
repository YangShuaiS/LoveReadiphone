//
//  ZhiShiShuXqModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuXqModel.h"

@implementation ZhiShiShuXqModel
+ (void)InitializeModel{
    [ZhiShiShuXqStyle1Model mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"books":@"CityBookListModel"};
    }];
}
@end
