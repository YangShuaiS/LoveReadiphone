//
//  SearchCitBookModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "SearchCitBookModel.h"

@implementation SearchCitBookModel
+ (void)InitializeModel{
    
    [SearchCitBookModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"data":@"CityBookListModel"};
    }];
}
@end
