//
//  DTLianXian.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "DTDownLasOrNextView.h"

@interface DTLianXian : BaseView<UIScrollViewDelegate,DtDownDelegate>
@property(nonatomic,strong)BookProblemsModel * model;
@property (nonatomic,assign)DtLastOrNext dtdownstyle;
@property(nonatomic,strong) NSMutableArray *timuarray;
@property(nonatomic,strong) NSMutableArray *zqdaarray;
@property(nonatomic,strong) NSMutableArray *xzdaarray;

- (NSMutableArray * )zqdazarray;
- (NSMutableArray * )yhxzarray;
@end
