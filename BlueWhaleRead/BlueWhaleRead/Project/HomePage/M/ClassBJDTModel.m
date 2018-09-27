//
//  ClassBJDTModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ClassBJDTModel.h"

@implementation ClassBJDTModel
+ (void)InitializeModel{
    [ClassBJDTModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"classDynamic":@"DynamicListModel"};
    }];
}
@end
