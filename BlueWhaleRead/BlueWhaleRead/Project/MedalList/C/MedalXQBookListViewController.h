//
//  MedalXQBookListViewController.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseViewController.h"
//@protocol MedalXQBookListViewDelegete <NSObject>
//
//@optional
//- (void)scrollFloat:(CGFloat)flo;
//
//@end
typedef void(^CgfloatBlock)(CGFloat flo);

@interface MedalXQBookListViewController : BaseViewController
//@property (nonatomic,weak) id<MedalXQBookListViewDelegete>delegete;
@property (nonatomic, strong) NSMutableArray* itemarray;
@property(nonatomic,copy)CgfloatBlock block;
@property(nonatomic,strong)MedalListBadgeInfoModel * model;
@end
