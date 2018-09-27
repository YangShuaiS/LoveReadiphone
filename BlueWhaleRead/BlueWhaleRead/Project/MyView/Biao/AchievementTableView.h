//
//  AchievementTableView.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"
typedef void(^ClickTag)(NSInteger inter);
typedef void(^Clickfloat)(CGFloat floa);

@interface AchievementTableView : BaseTableView
@property (nonatomic,copy)ClickTag clickTag;
@property (nonatomic,copy)Clickfloat floa;

@property (nonatomic,assign)NSInteger downinter;
@property (nonatomic,assign)NSInteger tiao;

@property(nonatomic,strong)AchievementModel * model;

@end
