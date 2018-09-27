//
//  MyClassView.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface MyClassView : BaseView
@property (nonatomic, assign) NSInteger weizhi;

@property (nonatomic, strong) NSMutableArray* itemarray;
@property (nonatomic, strong) MyClassListModel * model;


@end
