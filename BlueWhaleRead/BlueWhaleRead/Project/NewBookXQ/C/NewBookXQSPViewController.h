//
//  NewBookXQSPViewController.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseViewController.h"
#import "NBXQReadTableView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^GenBlocks)(CGFloat flo,BOOL end);

@interface NewBookXQSPViewController : BaseViewController
@property (nonatomic, strong) NSMutableArray* itemarray;
@property(nonatomic,copy)GenBlocks blocks;
@property (strong, nonatomic) NBXQReadTableView *tableView;

@end

NS_ASSUME_NONNULL_END
