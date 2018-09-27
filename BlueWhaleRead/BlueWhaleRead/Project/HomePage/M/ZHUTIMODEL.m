//
//  ZHUTIMODEL.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/24.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZHUTIMODEL.h"

@implementation ZHUTIMODEL
+ (void)InitializeModel{
    [ZhuTiTagModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"booklist":@"CityBookListModel"};
    }];
}
@end
