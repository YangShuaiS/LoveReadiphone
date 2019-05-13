//
//  ShouCangTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/14.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShouCangTableViewCell : BaseTableViewCell
@property(nonatomic,strong) UIImageView * imageviewleft;

@property(nonatomic,assign) NSInteger xuanzhong;
@property (nonatomic, strong) NHProverbModel *model;//!< 点击按钮

@end

NS_ASSUME_NONNULL_END
