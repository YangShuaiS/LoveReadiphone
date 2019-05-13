//
//  LunBoTuXQModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "LunBoTuXQContentModel.h"
#import "knowledgeGradeModel.h"
#import "PingLunModel.h"
@interface LunBoTuXQModel : BaseView
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property(nonatomic,strong) LunBoTuXQContentModel * banner;
@property (nonatomic, assign) NSInteger is_collect;//0未收昂
@property (nonatomic, assign) NSInteger is_like;//0未收昂


@property (nonatomic, strong) NSMutableArray *knowledgeGrade;//体系title
@property (nonatomic, strong) NSMutableArray *bookList;//书
@property (nonatomic, strong) NSMutableArray *bannerKnowledgeList;//相关体系
@property (nonatomic, strong) NSMutableArray *studentCommentList;//评论model

@property(nonatomic,assign)NSInteger like_num;//点赞
@property(nonatomic,assign)NSInteger collection_num;//收藏个数
+ (void)InitializeModel;

@end
