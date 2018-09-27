//
//  JoinBookCitytableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"
typedef void(^BlockModelInter)(NSInteger inter);

@interface JoinBookCitytableView : BaseTableView
@property (nonatomic,strong) NSMutableArray* itemarray;
@property (nonatomic,copy)BlockModelInter block;
@property(nonatomic,strong) MedalListBadgeInfoModel * model;

@end
