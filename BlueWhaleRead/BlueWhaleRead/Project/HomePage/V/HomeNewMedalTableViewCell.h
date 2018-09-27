//
//  HomeNewMedalTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface HomeNewMedalTableViewCell : BaseTableViewCell
@property (nonatomic, strong) NSMutableArray* itemarray;
@property(nonatomic,strong)NSString * str;
@property(nonatomic,strong) BadgeListModel * model;
@end
