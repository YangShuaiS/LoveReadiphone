//
//  ShouCangTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/14.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseTableView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^ClickInter)(NSInteger now);

@interface ShouCangTableView : BaseTableView
@property(nonatomic,strong) NSMutableArray * itemarray;
@property(nonatomic,assign) NSInteger intertype;
@property(nonatomic,copy)ClickInter blocks;

@end

NS_ASSUME_NONNULL_END
