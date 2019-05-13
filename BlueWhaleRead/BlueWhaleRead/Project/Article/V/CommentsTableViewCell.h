//
//  CommentsTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/9.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^AddModel)(PingLunModel * model);

@interface CommentsTableViewCell : BaseTableViewCell

@property (nonatomic , strong)PingLunModel * model;
@property(nonatomic,copy)AddModel blocks;

@end

NS_ASSUME_NONNULL_END
