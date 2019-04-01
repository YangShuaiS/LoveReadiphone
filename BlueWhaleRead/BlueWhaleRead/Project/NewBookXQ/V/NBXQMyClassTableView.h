//
//  NBXQMyClassTableView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseTableView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^GenBlocks)(CGFloat floa,BOOL end);
@interface NBXQMyClassTableView : BaseTableView
@property (nonatomic, strong) NSMutableArray* itemarray;
@property(nonatomic,copy)GenBlocks blocks;

@property (nonatomic, assign) NSInteger inter;// 0 不可华 1 可滑动

@end

NS_ASSUME_NONNULL_END
