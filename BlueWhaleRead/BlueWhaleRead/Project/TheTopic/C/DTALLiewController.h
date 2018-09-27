//
//  DTALLiewController.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseViewController.h"

@interface DTALLiewController : BaseViewController
@property (nonatomic,assign)JieGuoStyle style;
@property (nonatomic,strong)NSString * titles;


@property(nonatomic,strong) NSMutableArray * itemarray;


@property(nonatomic,strong)    TheTopPicModel * Topmodel;
@property(nonatomic,strong)    NSString * bookid;
@property(nonatomic,strong)    NSString * bookname;
@property(nonatomic,strong)    NSString * bookfenshu;


@end
