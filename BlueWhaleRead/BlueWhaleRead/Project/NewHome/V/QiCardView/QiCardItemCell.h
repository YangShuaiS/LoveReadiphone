//
//  QiCardItemCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/14.
//  Copyright © 2019 YS. All rights reserved.
//

#import "QiCardViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface QiCardItemCell : QiCardViewCell
@property (nonatomic, copy) void (^buttonClicked)(UIButton *);//!< 按钮点击回调
@property (nonatomic, strong) UIButton *button;//!< 点击按钮

@property (nonatomic, strong) NHProverbModel *model;//!< 点击按钮


@end

NS_ASSUME_NONNULL_END
