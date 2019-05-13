//
//  NewKnowledgeModel.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NewKnowledgeModel.h"

@implementation NewKnowledgeModel
+ (void)InitializeModel{
    [NewKnowledgeModel mj_setupObjectClassInArray:^NSDictionary *{
        
        return @{@"bannerList":@"LunboModel",@"knowledgeData":@"NKRClassificationModel",@"hotKnowledge":@"NKRKnowledgeModel",@"myHistory":@"NKRKnowledgeModel",@"relatedRecommendations":@"NKRKnowledgeModel",@"bookList":@"BookListModel",@"goodBannerList":@"AllSearchWZModel",@"bannerknowledgeList":@"NKRKnowledgeModel",@"proverb":@"NHProverbModel",@"knowledges":@"NKRKnowledgeModel"};
    }];
}
@end
