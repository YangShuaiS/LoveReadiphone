//
//  NBTXGMLTView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"
#import "HQFlowView.h"
#import "HQImagePageControl.h"
NS_ASSUME_NONNULL_BEGIN

@interface NBTXGMLTView : BaseView<HQFlowViewDelegate,HQFlowViewDataSource>
/**
 *  图片数组
 */
@property (nonatomic, strong) NSMutableArray *advArray;
/**
 *  轮播图
 */
@property (nonatomic, strong) HQFlowView *pageFlowView;
@property (nonatomic, strong) UIScrollView *scrollView; // 轮播图容器


@end

NS_ASSUME_NONNULL_END
