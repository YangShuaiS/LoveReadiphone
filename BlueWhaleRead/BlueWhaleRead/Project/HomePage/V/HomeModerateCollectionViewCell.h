//
//  HomeModerateCollectionViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionViewCell.h"
//#import "JKStarDisplayView.h"

@interface HomeModerateCollectionViewCell : BaseCollectionViewCell
@property(nonatomic,strong)BookListModel * model;
//@property(nonatomic,strong) JKStarDisplayView *jKStarDisplayView;
@property(nonatomic,assign) NSInteger starehiden;//是否隐藏心

@end
