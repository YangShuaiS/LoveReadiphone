//
//  NBCCollectionViewFlowLayout.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NBCCollectionViewFlowLayout : UICollectionViewFlowLayout
- (instancetype)initWithSectionInset:(UIEdgeInsets)insets andMiniLineSapce:(CGFloat)miniLineSpace andMiniInterItemSpace:(CGFloat)miniInterItemSpace andItemSize:(CGSize)itemSize;

@end

