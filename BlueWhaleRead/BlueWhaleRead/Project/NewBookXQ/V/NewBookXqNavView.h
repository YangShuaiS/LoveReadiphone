//
//  NewBookXqNavView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewBookXqNavView : BaseView
@property(nonatomic,strong) BookXQModel * model;
- (void)scrodidsize:(CGFloat)size;
@end

NS_ASSUME_NONNULL_END
