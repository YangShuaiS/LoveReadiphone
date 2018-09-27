
//
//  ShiZiLiangModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ShiZiLiangModel.h"

@implementation ShiZiLiangModel
+ (void)InitializeModel{
    [ShiZiLiangModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"FakeWord":@"SZLListModel"};
    }];
}
@end
