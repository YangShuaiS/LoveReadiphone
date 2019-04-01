//
//  MyFavoritesModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/21.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "MyFavoritesModel.h"

@implementation MyFavoritesModel
+ (void)InitializeModel{
    [MyFavoritesModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"collectionList":@"NKRKnowledgeModel"};
    }];
}
@end
