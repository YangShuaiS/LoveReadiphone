//
//  HomeWorkTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"

@interface HomeWorkTableView : BaseTableView
@property (nonatomic, strong) NSMutableArray* itemarray;
- (void)Next:(NSInteger)inter;
- (void)OneCell:(NSInteger)inter;
@end
