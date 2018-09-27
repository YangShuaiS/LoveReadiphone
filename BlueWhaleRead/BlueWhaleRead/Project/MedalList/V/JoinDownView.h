//
//  JoinDownView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
typedef void(^ChooseMedalbool)(void);

@interface JoinDownView : BaseView
@property(nonatomic,strong)AllBookListModel * model;
@property(nonatomic,strong)NSMutableArray * itemarray;
@property(nonatomic,assign)NSInteger stylejia;//样式，1为带加号
@property(nonatomic,copy)ChooseMedalbool block;
@property(nonatomic,strong) MedalListXqModel * models;

@property(nonatomic,strong)TKJIEGUOMODEL * dtjgmodel;

@property(nonatomic,strong) JoinBookModel * joinmodel;//加入书架model。只有PopUpViewStyleBelong


@end
