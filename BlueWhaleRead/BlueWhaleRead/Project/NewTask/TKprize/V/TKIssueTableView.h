//
//  TKIssueTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKIssueTableView : BaseTableView
@property(nonatomic,strong)NSMutableArray * itemArray;
@property(nonatomic,strong)TKPrizeModel * model;

@end

NS_ASSUME_NONNULL_END