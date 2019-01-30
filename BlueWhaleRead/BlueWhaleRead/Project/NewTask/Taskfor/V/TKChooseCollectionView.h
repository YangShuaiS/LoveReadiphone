//
//  TKChooseCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^click)(NSInteger inter);

@interface TKChooseCollectionView : BaseCollectionView
@property(nonatomic,strong)NSMutableArray * itemArray;
@property (assign, nonatomic) CGFloat time;
@property (assign, nonatomic) NSInteger booknum;
@property(nonatomic,strong)UIColor * neirongcolor;

@property (assign, nonatomic) BOOL open;
@property(nonatomic,copy)click block;


@property (nonatomic, assign) NSInteger now_week;

@end

NS_ASSUME_NONNULL_END
