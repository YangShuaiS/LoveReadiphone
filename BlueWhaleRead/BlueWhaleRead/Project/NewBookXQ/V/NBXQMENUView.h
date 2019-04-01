//
//  NBXQMENUView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^GenBlock)(NSInteger inter);
typedef void(^BlockScrovewiY)(CGFloat scroY,BOOL end);

@interface NBXQMENUView : BaseView
@property (nonatomic, strong) NSArray *controllerArray;
@property (nonatomic, strong) NSArray *titarray;
@property(nonatomic,copy)GenBlock block;
@property(nonatomic,copy)BlockScrovewiY blocky;

@property (nonatomic, assign) NSInteger clickinter;

@property (nonatomic, assign) NSInteger nfclick; //0 可点 1 不可点

@end

NS_ASSUME_NONNULL_END
