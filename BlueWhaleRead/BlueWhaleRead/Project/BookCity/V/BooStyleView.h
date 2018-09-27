//
//  BooStyleView.h
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "BookTableView.h"
@protocol BooStyleViewDelegate <NSObject>

@optional
- (void)scrollFloat:(CGFloat)flo;
- (void)backbodys:(NSArray *)array;
@end
@interface BooStyleView : BaseView
@property (nonatomic,weak) id<BooStyleViewDelegate>delegete;
@property (nonatomic, strong) BookCityModel* model;

@property (strong, nonatomic) BookTableView *tableView;
@property(nonatomic,assign)NSInteger inter;

@end
