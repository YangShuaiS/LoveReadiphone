//
//  CommentsShuRuKuangView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/9.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^AddModel)(PingLunModel * model);

@interface CommentsShuRuKuangView : BaseView<UITextViewDelegate>
@property(nonatomic,assign)NSInteger comment_type;// 1 文章类型知识图 2 知识体系类型知识图 3脉络图
@property(nonatomic,strong)NSString * itemid;//
@property(nonatomic,copy)AddModel blocks;

@property(nonatomic,strong)LunBoTuXQModel *nmodel;
@property(nonatomic,assign)NSInteger sfShare;//是否能分享

@property(nonatomic,strong)ZhiShiShuModel *zhishishumodel;

@end

NS_ASSUME_NONNULL_END
