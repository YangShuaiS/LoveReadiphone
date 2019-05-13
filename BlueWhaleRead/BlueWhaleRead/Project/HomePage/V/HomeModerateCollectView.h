//
//  HomeModerateCollectView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionView.h"

@interface HomeModerateCollectView : BaseCollectionView
@property (nonatomic, strong) NSMutableArray* itemarray;

@property(nonatomic,assign) NSInteger foundinter;//发现页无数据专用

@property(nonatomic,assign) NSInteger starehiden;//是否隐藏心

@end
