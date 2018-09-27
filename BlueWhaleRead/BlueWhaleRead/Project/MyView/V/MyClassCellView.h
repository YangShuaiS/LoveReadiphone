//
//  MyClassCellView.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"

@interface MyClassCellView : BaseView
@property (nonatomic, strong) MyClassModel * model;
@property(nonatomic,assign)NSInteger type;//0文字，1图
@property(nonatomic,assign)NSInteger paimings;

@end
