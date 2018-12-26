//
//  TKJUserImageView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TKJUserImageView : BaseView
@property(nonatomic,strong)NSMutableArray * itemArray;
@property(nonatomic,assign)NSInteger inter;
@property(nonatomic,assign)NSInteger allinter;
@property(nonatomic,strong)TKXSHJPeopleModel * model;


@end

NS_ASSUME_NONNULL_END
