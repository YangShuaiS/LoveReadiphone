//
//  CommentsView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/9.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CommentsViewDelegate <NSObject>
@optional
- (void)CommentsShouCang;
- (void)CommentsDianZan;
- (void)CommentsFenXiang;
- (void)CommentsPingLun;
- (void)CommentsShuRuKuang;
@end

typedef NS_ENUM(NSInteger, CommentsStyle) {
    CommentsStyle1 = 0,//4个
    CommentsStyle2 = 1, //3个
};

@interface CommentsView : BaseView
- (instancetype)initWithBackColor:(UIColor *)color
                            Style:(CommentsStyle)style
                         Original:(NSInteger)original;
@property (nonatomic, weak) id <CommentsViewDelegate> delegateComments;
@property(nonatomic,strong)LunBoTuXQModel * model;
@property(nonatomic,strong)ZhiShiShuModel * model1;

@end

NS_ASSUME_NONNULL_END
