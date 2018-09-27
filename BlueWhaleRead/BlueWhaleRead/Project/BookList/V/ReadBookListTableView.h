//
//  ReadBookListTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"

@interface ReadBookListTableView : BaseTableView
@property (nonatomic, strong) NSMutableArray* itemarray;
@property(nonatomic,assign)NSInteger inter;


- (void)UpDataHeight;
@end
