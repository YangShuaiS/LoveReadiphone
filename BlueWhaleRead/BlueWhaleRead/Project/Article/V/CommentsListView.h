//
//  CommentsListView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/9.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseView.h"
#import "CommentsTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentsListView : BaseView
@property (nonatomic , strong)CommentsTableView * tableview;
@property (nonatomic , strong)NSMutableArray * itemarray;

@end

NS_ASSUME_NONNULL_END
