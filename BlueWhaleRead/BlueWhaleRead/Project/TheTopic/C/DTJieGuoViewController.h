//
//  DTJieGuoViewController.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//  答题结果

#import "BaseViewController.h"

@interface DTJieGuoViewController : BaseViewController
@property (nonatomic,assign)JieGuoStyle style;
@property (nonatomic,strong)NSMutableArray * timuarray;
@property(nonatomic,strong)TKJIEGUOMODEL * model;

@property(nonatomic,strong)NSString * secont;

@property(nonatomic,strong)    NSString * bookfenshu;

@end
