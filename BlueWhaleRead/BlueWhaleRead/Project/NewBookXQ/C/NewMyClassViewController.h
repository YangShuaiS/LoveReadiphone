//
//  NewMyClassViewController.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseViewController.h"
#import "NBXQMyClassTableView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^GenBlocks)(CGFloat flo,BOOL end);

@interface NewMyClassViewController : BaseViewController
@property (nonatomic, strong) NSMutableArray* itemarray;

@property(nonatomic,copy)GenBlocks blocks;
@property (strong, nonatomic) NBXQMyClassTableView *tableView;


@property (nonatomic, assign) NSInteger inter;// 0 不可华 1 可滑动

@end

NS_ASSUME_NONNULL_END
