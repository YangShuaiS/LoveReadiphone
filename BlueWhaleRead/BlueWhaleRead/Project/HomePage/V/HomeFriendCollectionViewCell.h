//
//  HomeFriendCollectionViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface HomeFriendCollectionViewCell : BaseCollectionViewCell
@property(nonatomic,strong)BookFriendModel * model;
- (void)color;
@end
