//
//  ArticleScroDownView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"
#import "CommentsListView.h"
#import "ArticleShareView.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ArticleScroTopViewViewDelegate <NSObject>
@optional
- (void)ArticleScroTopViewShouCang;
- (void)ArticleScroTopViewDianZan;
@end
@interface ArticleScroDownView : BaseView<ArticleShareViewDelegate>
@property(nonatomic,strong)LunBoTuXQModel * model;
@property(nonatomic,strong)ZhiShiShuModel * ZhiShiSHUmodel;

@property (nonatomic , strong)CommentsListView * comlist;
@property(nonatomic,strong)NSString * sharetype;
@property(nonatomic,strong)ArticleShareView * share;
@property(nonatomic,strong)NSString * itemid;
@property (nonatomic, weak) id <ArticleScroTopViewViewDelegate> delegateArticleScroTop;
@property(nonatomic,assign)NSInteger sfzsw;//是否是知识网1

@property(nonatomic,assign)NSInteger Type;//1文章类型知识图 2 知识体系类型知识图 3脉络图

@end

NS_ASSUME_NONNULL_END
