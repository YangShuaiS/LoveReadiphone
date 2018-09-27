//
//  ShiCiLiangModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ShiCiLiangModel.h"

@implementation ShiCiLiangModel
+ (void)InitializeModel{
    [ShiCiLiangModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"glossary":@"SCLListMOdel"};
    }];
}
@end
