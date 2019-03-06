//
//  ZhiShiShiRightScroView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/25.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^clickssss)(CGFloat scroy);
typedef void(^endanimaal)(void);

@interface ZhiShiShiRightScroView : BaseView<UIScrollViewDelegate>
@property (nonatomic , strong)NSMutableArray * itemarray;
@property (nonatomic , assign)CGFloat scroy;
@property (nonatomic , assign)CGFloat allheight;
@property (nonatomic , assign)CGFloat topheight;
@property (nonatomic , assign)CGFloat labelheight;


@property(nonatomic,copy)clickssss blocks;
@property(nonatomic,copy)endanimaal blockss;

@end

NS_ASSUME_NONNULL_END
