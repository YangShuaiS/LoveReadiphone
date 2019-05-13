//
//  MyFavoritesDownView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/21.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^click)(void);
typedef void(^clickallshanchu)(void);

@interface MyFavoritesDownView : BaseView
@property(nonatomic,copy)click block;
@property(nonatomic,copy)clickallshanchu blocks;

@property(nonatomic,strong) MyFavoritesModel * model;

@property(nonatomic,assign) NSInteger qxzt;
@property(nonatomic,assign) NSInteger nowinter;

@end

NS_ASSUME_NONNULL_END
