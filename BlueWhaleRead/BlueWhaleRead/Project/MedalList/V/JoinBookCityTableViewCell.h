//
//  JoinBookCityTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "JKStarDisplayView.h"
typedef void(^BlockModel)(void);

@interface JoinBookCityTableViewCell : BaseTableViewCell
@property(nonatomic,strong)AllBookListModel * allmodel;
@property(nonatomic,strong)JKStarDisplayView *jKStarDisplayView;
@property (nonatomic,copy)BlockModel block;

@end
