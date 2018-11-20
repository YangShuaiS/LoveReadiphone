//
//  NBCCollectionViewFlowLayout.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "NBCCollectionViewFlowLayout.h"
@interface NBCCollectionViewFlowLayout()

@property (nonatomic, assign) UIEdgeInsets sectionInsets;
@property (nonatomic, assign) CGFloat miniLineSpace;
@property (nonatomic, assign) CGFloat miniInterItemSpace;
@property (nonatomic, assign) CGSize eachItemSize;
@property (nonatomic, assign) BOOL scrollAnimation;/**<是否有分页动画*/
@property (nonatomic, assign) CGPoint lastOffset;/**<记录上次滑动停止时contentOffset值*/
@end

@implementation NBCCollectionViewFlowLayout
/*初始化部分*/
- (instancetype)initWithSectionInset:(UIEdgeInsets)insets andMiniLineSapce:(CGFloat)miniLineSpace andMiniInterItemSpace:(CGFloat)miniInterItemSpace andItemSize:(CGSize)itemSize
{
    self = [self init];
    if (self) {
        //基本尺寸/边距设置
        self.sectionInsets = insets;
        self.miniLineSpace = miniLineSpace;
        self.miniInterItemSpace = miniInterItemSpace;
        self.eachItemSize = itemSize;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lastOffset = CGPointZero;
    }
    return self;
}

-(void)prepareLayout
{
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;// 水平滚动
    /*设置内边距*/
    self.sectionInset = _sectionInsets;
    self.minimumLineSpacing = _miniLineSpace;
    self.minimumInteritemSpacing = _miniInterItemSpace;
    self.itemSize = _eachItemSize;
    /**
     * decelerationRate系统给出了2个值：
     * 1. UIScrollViewDecelerationRateFast（速率快）
     * 2. UIScrollViewDecelerationRateNormal（速率慢）
     * 此处设置滚动加速度率为fast，这样在移动cell后就会出现明显的吸附效果
     */
    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
}
/**
 * 这个方法的返回值，就决定了collectionView停止滚动时的偏移量
 */
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat pageSpace = [self stepSpace];//计算分页步距
    CGFloat offsetMax = self.collectionView.contentSize.width - pageSpace;
    CGFloat offsetMin = 0;
    /*修改之前记录的位置，如果小于最小contentsize或者大于最大contentsize则重置值*/
    if (_lastOffset.x<offsetMin)
    {
        _lastOffset.x = offsetMin;
    }
    else if (_lastOffset.x>offsetMax)
    {
        _lastOffset.x = offsetMax;
    }
    
    CGFloat offsetForCurrentPointX = ABS(proposedContentOffset.x - _lastOffset.x);//目标位移点距离当前点的距离绝对值
    CGFloat velocityX = velocity.x;
    BOOL direction = (proposedContentOffset.x - _lastOffset.x) > 0;//判断当前滑动方向,手指向左滑动：YES；手指向右滑动：NO
    
    if (offsetForCurrentPointX > pageSpace/8. && _lastOffset.x>=offsetMin && _lastOffset.x<=offsetMax)
    {
        NSInteger pageFactor = 0;//分页因子，用于计算滑过的cell个数
        if (velocityX != 0)
        {
            /*滑动*/
            pageFactor = ABS(velocityX);//速率越快，cell滑过数量越多
        }
        else
        {
            /**
             * 拖动
             * 没有速率，则计算：位移差/默认步距=分页因子
             */
            pageFactor = ABS(offsetForCurrentPointX/pageSpace);
        }
        
        /*设置pageFactor上限为2, 防止滑动速率过大，导致翻页过多*/
        pageFactor = pageFactor<1?1:(pageFactor<3?1:2);
        
        CGFloat pageOffsetX = pageSpace*pageFactor;
        _lastOffset.x = _lastOffset.x + (direction?pageOffsetX+200:-pageOffsetX-200);
        proposedContentOffset = CGPointMake(_lastOffset.x, proposedContentOffset.y);
    }
    else
    {
        /*滚动距离，小于翻页步距一半，则不进行翻页操作*/
        proposedContentOffset = CGPointMake(_lastOffset.x, _lastOffset.y);
    }
    
    //记录当前最新位置
    return proposedContentOffset;
}

/**
 *计算每滑动一页的距离：步距
 */
-(CGFloat)stepSpace
{
    return WIDTH-LENGTH(22);
}


@end
