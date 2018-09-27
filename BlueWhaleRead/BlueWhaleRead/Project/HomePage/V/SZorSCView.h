//
//  SZorSCView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "SzScXuanXiangCollectionView.h"
@interface SZorSCView : BaseView
@property (nonatomic,assign)DtLastOrNext dtdownstyle;
//@property(nonatomic,strong)ShiZiLiangModel * szorciitemarray;//识字或者识词文字and图model

@property(nonatomic,strong)ShiZiLiangModel * szorci;//识字或者识词文字and图model
@property(nonatomic,strong)SCLListMOdel * scorci;//识字或者识词文字and图model
@property(nonatomic,strong) NSString * titles;

@property(nonatomic,strong)SzScXuanXiangCollectionView * collectView;

@end
