//
//  LunBoTuXQModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "LunBoTuXQModel.h"

@implementation LunBoTuXQModel

+ (void)InitializeModel{
    [LunBoTuXQModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"knowledgeGrade":@"knowledgeGradeModel",@"bookList":@"BookListModel",@"bannerKnowledgeList":@"NKRKnowledgeModel"};
    }];

}

@end
