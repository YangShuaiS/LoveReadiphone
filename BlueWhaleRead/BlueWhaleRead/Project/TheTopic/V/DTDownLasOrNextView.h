//
//  DTDownLasOrNextView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
@protocol DtDownDelegate // 代理传值方法
@optional
- (void)DtDownClick:(PushModel *)model;
@end
@interface DTDownLasOrNextView : BaseView
@property (nonatomic,assign)DtLastOrNext dtdownstyle;
@property (nonatomic, weak) id <DtDownDelegate> delegate;
- (void)remoview;
@end
