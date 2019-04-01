//
//  NBXQDownView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^GenBlock)(NSInteger inter);
typedef void(^BlockScrovewiY)(CGFloat scroY,BOOL end);

@interface NBXQDownView : BaseView
@property (nonatomic, strong) NSArray * titarray;
@property (nonatomic, strong) NSMutableArray * controllerArray;
@property(nonatomic,copy)GenBlock block;
@property(nonatomic,copy)BlockScrovewiY blocky;


@property (nonatomic, assign) NSInteger clickinter;

@property (nonatomic, assign) NSInteger nfclick;

@end

NS_ASSUME_NONNULL_END
