//
//  NewKnowledgeModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"
#import "NKRClassificationModel.h"
#import "NKRKnowledgeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewKnowledgeModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;

@property (nonatomic, copy) NSString * hotKnowledgeNum;
@property (nonatomic, strong) NSMutableArray *bannerList;//轮播图
@property (nonatomic, strong) NSMutableArray *knowledgeData;//知识网大分类
@property (nonatomic, strong) NSMutableArray *hotKnowledge;//热门知识图
@property (nonatomic, strong) NSMutableArray *myHistory;//我的视野
@property (nonatomic, strong) NSMutableArray *relatedRecommendations;//相关推荐
@property (nonatomic, strong) NSMutableArray *bookList;//书列表
@property (nonatomic, strong) NSMutableArray *goodBannerList;//文章推荐




+ (void)InitializeModel;

@end

NS_ASSUME_NONNULL_END
