//
//  NewTFameTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/28.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseTableView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^GenBlocks)(CGFloat floa);

@interface NewTFameTableView : BaseTableView
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * missionid;
@property(nonatomic,copy)GenBlocks blocks;

@end

NS_ASSUME_NONNULL_END
