//
//  CommentsShareView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/9.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^Clicks)(NSInteger inger);

@interface CommentsShareView : BaseView
@property(nonatomic,assign)NSInteger zt;//1选中，0未选中
@property(nonatomic,assign)NSInteger styles;//0好友，1朋友圈
@property(nonatomic,copy)Clicks blocks;


@property(nonatomic,assign)NSInteger shareFS;//分享方式   0 文章  1  知识图  2 脉络图

@end

NS_ASSUME_NONNULL_END
