//
//  FriendOrMedalImageCollectionViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface FriendOrMedalImageCollectionViewCell : BaseCollectionViewCell
@property(nonatomic,strong)ReadPeopleModel * model;
@property(nonatomic,strong)CityBadgeListModel * badgeModel;
@property(nonatomic,strong)BadgeOnlyImageModel * badgeimagemodel;


@end
