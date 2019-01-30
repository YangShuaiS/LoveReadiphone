//
//  GuideKnowledgeOneView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/21.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^click)(void);

@interface GuideKnowledgeOneView : BaseView
@property(nonatomic,copy)click block;

@end

NS_ASSUME_NONNULL_END
