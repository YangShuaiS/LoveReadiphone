
//
//  MonthPMModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MonthPMModel.h"

@implementation MonthPMModel
+ (void)InitializeModel{
    [MonthstudentModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"studentList":@"MyClassModel"};
    }];
    
}
@end
