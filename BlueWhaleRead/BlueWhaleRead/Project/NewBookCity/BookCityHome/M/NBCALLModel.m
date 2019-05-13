//
//  NBCALLModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCALLModel.h"

@implementation NBCALLModel
+ (void)InitializeModel{
    [NBCALLModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"catalogList":@"NBCclassificationModel",@"rankList":@"NBCclassificationModel",@"themeTop":@"NBCclassificationModel",@"themeWeek":@"NBCclassificationModel",@"themeNew":@"TypeListModel",@"weekList":@"NBCclassificationModel",@"freeBookList":@"AllBookListModel",@"otherBookCatalogList":@"TypeListModel"};
    }];
    [NBCclassificationModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"bookList":@"UnreadBookModel"};
    }];
}
@end
