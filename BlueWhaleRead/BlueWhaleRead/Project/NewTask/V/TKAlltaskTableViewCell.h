//
//  TKAlltaskTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^click)(void);
@interface TKAlltaskTableViewCell : BaseTableViewCell
//@property(nonatomic,assign)TKAlltaskStyle askStyle;
@property(nonatomic,strong)TKTaskListModel * model;
@property(nonatomic,copy)click block;

@end

NS_ASSUME_NONNULL_END
