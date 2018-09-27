//
//  HomeActivityTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"

@interface HomeActivityTableView : BaseTableView
@property (nonatomic, strong) NSMutableArray* itemarray;
@property(nonatomic,assign) BOOL hiden;
@property(nonatomic,strong) ZHUTIMODEL * model;
@end
