//
//  BuyPackageCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/24.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^BuyStyle)(BuyPackage * pack);

@interface BuyPackageCollectionView : BaseCollectionView
@property (nonatomic, strong) NSMutableArray* itemarray;
@property(nonatomic,copy)BuyStyle buyStyle;

@end
NS_ASSUME_NONNULL_END
