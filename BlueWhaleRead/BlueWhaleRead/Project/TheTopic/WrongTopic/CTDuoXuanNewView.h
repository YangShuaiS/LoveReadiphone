//
//  CTDuoXuanNewView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "DTDownLasOrNextView.h"

@interface CTDuoXuanNewView : BaseView<UIScrollViewDelegate,DtDownDelegate>
@property (nonatomic,assign)DtLastOrNext dtdownstyle;
@property(nonatomic,strong) TiStyleModel * tiModel;

@property(nonatomic,strong) NSString * boname;

@end
