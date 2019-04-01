//
//  NBookXQTopView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"
#import "JKStarDisplayView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NBookXQTopView : BaseView
@property(nonatomic,strong) JKStarDisplayView *jKStarDisplayView;
@property(nonatomic,strong) BookXQModel * model;

@end

NS_ASSUME_NONNULL_END
