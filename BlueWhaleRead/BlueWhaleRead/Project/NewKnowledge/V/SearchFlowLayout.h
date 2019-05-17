//
//  SearchFlowLayout.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SearchFlowLayout;

@protocol  LMHWaterFallLayoutDeleaget<NSObject>

@required
/**
 * 每个item的高度
 */
- (CGFloat)waterFallLayout:(SearchFlowLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth;

@optional
/**
 * 有多少列
 */
- (NSUInteger)columnCountInWaterFallLayout:(SearchFlowLayout *)waterFallLayout;

/**
 * 每列之间的间距
 */
- (CGFloat)columnMarginInWaterFallLayout:(SearchFlowLayout *)waterFallLayout;

/**
 * 每行之间的间距
 */
- (CGFloat)rowMarginInWaterFallLayout:(SearchFlowLayout *)waterFallLayout;

/**
 * 每个item的内边距
 */
- (UIEdgeInsets)edgeInsetdInWaterFallLayout:(SearchFlowLayout *)waterFallLayout;


@end

@interface SearchFlowLayout : UICollectionViewFlowLayout
/** 代理 */
@property (nonatomic, weak) id<LMHWaterFallLayoutDeleaget> delegate;
@property (nonatomic, assign) CGFloat LMHDefaultColunmCount;
@property (nonatomic, assign) CGFloat LMHDefaultColunmMargin;
@property (nonatomic, assign) CGFloat LMHDefaultRowMargin;
@property (nonatomic, assign) UIEdgeInsets LMHDefaultEdgeInsets;

@end

NS_ASSUME_NONNULL_END
