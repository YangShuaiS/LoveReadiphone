//
//  NKRArmPBLCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/14.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NKRArmPBLCollectionView : BaseCollectionView
@property (nonatomic,assign)  NSInteger style;
@property (nonatomic, strong) NSMutableArray* itemarray;
@property (nonatomic , assign)NSInteger allinter;

//@property (nonatomic , assign)NSInteger push;//0 根࿆据࿆type判࿆断࿆  1 文࿆章࿆ 2 脉࿆络࿆图࿆
@property (nonatomic , assign)NSInteger bkzt;//编辑状态
@property (nonatomic , assign)NSInteger sfsj;//是否是随机数
@end

NS_ASSUME_NONNULL_END