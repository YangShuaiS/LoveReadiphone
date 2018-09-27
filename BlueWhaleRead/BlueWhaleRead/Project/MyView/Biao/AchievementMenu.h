//
//  AchievementMenu.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^ClickTag)(NSInteger inter);

@interface AchievementMenu : BaseView
@property (nonatomic,copy)ClickTag clickTag;
- (void)donghuaxin:(NSInteger )inter;
@property(nonatomic,strong)AchievementModel * model;
@end
