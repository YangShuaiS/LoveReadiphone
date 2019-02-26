//
//  SearchbookdataTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^push)(NSInteger inter);
@interface SearchbookdataTableViewCell : BaseTableViewCell
@property (nonatomic , strong)NSMutableArray * itemarray;
@property(nonatomic,copy)push pushblock;

@end

NS_ASSUME_NONNULL_END
