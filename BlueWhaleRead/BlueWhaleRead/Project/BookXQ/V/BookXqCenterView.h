//
//  BookXqCenterView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/29.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookXqCenterView : BaseView<UIScrollViewDelegate>
@property(nonatomic,strong) BookXQbookModel *model;

@end

NS_ASSUME_NONNULL_END
