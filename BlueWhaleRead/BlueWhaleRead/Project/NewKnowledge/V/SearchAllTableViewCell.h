//
//  SearchAllTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^click)(NSString * string);
@interface SearchAllTableViewCell : BaseTableViewCell
@property(nonatomic,copy)click block;

@end

NS_ASSUME_NONNULL_END
