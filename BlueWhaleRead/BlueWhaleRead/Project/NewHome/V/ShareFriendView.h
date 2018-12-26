//
//  ShareFriendView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShareFriendView : BaseView
@property(nonatomic,strong)HTShareListModel * model;
@property(nonatomic,assign)int inter;
- (void)endshare;
@end

NS_ASSUME_NONNULL_END
