//
//  CTPaiXuView.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "DTDownLasOrNextView.h"

@interface CTPaiXuView : BaseView<UIScrollViewDelegate,DtDownDelegate>
@property (nonatomic,assign)DtLastOrNext dtdownstyle;
@property(nonatomic,strong) TiStyleModel * tiModel;
@property(nonatomic,strong) NSString * boname;

@end
