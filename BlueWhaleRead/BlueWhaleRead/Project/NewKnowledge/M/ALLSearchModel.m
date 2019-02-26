//
//  ALLSearchModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ALLSearchModel.h"

@implementation ALLSearchModel
+ (void)InitializeModel{
    [ALLSearchModel mj_setupObjectClassInArray:^NSDictionary *{
        
        return @{@"bannerdata":@"AllSearchWZModel",@"bookdata":@"CityBookListModel",@"knowledgedata":@"NKRKnowledgeModel",@"bookList":@"CityBookListModel"};
    }];
}
@end
