//
//  JoinBookCityView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "JoinDownView.h"
typedef void(^RemoQuXiao)(void);

@interface JoinBookCityView : BaseView
- (void)animationBegin;
@property (nonatomic,strong) NSMutableArray* itemarray;
@property(nonatomic,copy)RemoQuXiao block;

@property(nonatomic,strong) JoinDownView * joinDown;
@property(nonatomic,strong) MedalListXqModel * model;
@end
