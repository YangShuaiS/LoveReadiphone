//
//  UserForgetView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "UserForgetTextFileView.h"

typedef void(^BackText)(BOOL next);

@interface UserForgetView : BaseView
- (void)returnKeyboard;
@property(nonatomic,strong)BackText blocks;
@property(nonatomic,strong)  UserForgetTextFileView * zhanghao;
- (NSArray *)Whetherornotthesame;
@end
