//
//  FiendOrMedalView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface FiendOrMedalView : BaseView
- (instancetype)initWithLayOut:(UICollectionViewFlowLayout*)layout;
@property (nonatomic, strong) NSMutableArray* itemarray;
@property(nonatomic,assign) NSInteger inter;


@property(nonatomic,assign) NSInteger foundinter;//发现页无数据专用

- (void)BanSliding;//禁止滑动

@end
