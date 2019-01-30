//
//  HomeActivityHeaderView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/28.
//  Copyright © 2019年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeActivityHeaderView : UITableViewHeaderFooterView
@property(nonatomic,assign) NSInteger section;
@property (nonatomic, strong) NSMutableArray* itemarray;


@end

NS_ASSUME_NONNULL_END
