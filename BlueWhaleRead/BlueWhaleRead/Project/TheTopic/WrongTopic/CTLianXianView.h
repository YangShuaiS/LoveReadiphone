//
//  CTLianXianView.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "DTDownLasOrNextView.h"

@interface CTLianXianView : BaseView<UIScrollViewDelegate,DtDownDelegate>
@property (nonatomic,assign)DtLastOrNext dtdownstyle;
@property(nonatomic,strong) TiStyleModel * tiModel;
@property(nonatomic,strong) NSString * boname;
@end
