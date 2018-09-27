//
//  BookXQTopView.h
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "JKStarDisplayView.h"

@interface BookXQTopView : BaseView<UIScrollViewDelegate>
@property(nonatomic,strong) BookXQbookModel *model;

@property(nonatomic,strong) JKStarDisplayView *jKStarDisplayView;
@property (nonatomic, assign) BookReadingStyle status;

@property(nonatomic,strong) CityBadgeListModel*citymodel;

@end
