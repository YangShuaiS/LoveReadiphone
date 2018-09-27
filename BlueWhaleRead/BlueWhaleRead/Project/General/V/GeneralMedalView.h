//
//  GeneralMedalView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/10.
//  Copyright © 2018年 YS. All rights reserved.
//  勋章进度

#import "BaseView.h"

@interface GeneralMedalView : BaseView
@property(nonatomic,strong)MedalBadgeListModel * model;
@property(nonatomic,strong)NSString * images;
@property(nonatomic,assign)CGFloat floatjidu;

@property(nonatomic,assign)NSInteger upjl;

@end
