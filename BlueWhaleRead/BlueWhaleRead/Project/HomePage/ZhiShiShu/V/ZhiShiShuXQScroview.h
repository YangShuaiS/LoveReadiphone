//
//  ZhiShiShuXQScroview.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^GenBlock)(NSInteger page);

@interface ZhiShiShuXQScroview : BaseView<UIScrollViewDelegate>
@property(nonatomic,strong)UIPageControl*pageControl;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,copy)GenBlock block;

@property(nonatomic,strong)NSMutableArray* itemarray;

@end
