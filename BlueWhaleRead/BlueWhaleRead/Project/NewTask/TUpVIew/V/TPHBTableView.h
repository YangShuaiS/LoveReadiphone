//
//  TPHBTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^click)(void);

@interface TPHBTableView : BaseTableView
@property(nonatomic,strong)NSMutableArray * itemArray;
@property(nonatomic,strong)NSString * bianse;

@property(nonatomic,strong)NSString * missionid;

@property(nonatomic,copy)click block;


@end

NS_ASSUME_NONNULL_END
