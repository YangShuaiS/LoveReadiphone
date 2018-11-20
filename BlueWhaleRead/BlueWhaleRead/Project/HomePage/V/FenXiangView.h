//
//  FenXiangView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/2.
//  Copyright © 2018年 YS. All rights reserved.
//
#import "BaseView.h"

typedef void(^GenBlock)(FenXiangModel * model,ShareStyle sharestyle);

@interface FenXiangView : BaseView
@property(nonatomic,copy)GenBlock block;
@property(nonatomic,assign)ShareStyle sharestyle;

@property(nonatomic,strong)NSString * Text;
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSString * imageurl;

//#   书名    ##   人名   ###  勋章名    ####  年级    #####   n个勋章中的n    *     文章标题    **  书单名    ***  文章内容   ****   书单简介
@property(nonatomic,strong)NSString * bookname;//#   书名
@property(nonatomic,strong)NSString * peoplename;//##   人名
@property(nonatomic,strong)NSString * bolistname;//###  勋章名
@property(nonatomic,strong)NSString * classname;//####  年级
@property(nonatomic,strong)NSString * balistgs;//#####   n个勋章中的n
@property(nonatomic,strong)NSString * wzbt;//*     文章标题
@property(nonatomic,strong)NSString * sdm;//**  书单名
@property(nonatomic,strong)NSString * wznr;//***  文章内容
@property(nonatomic,strong)NSString * sdjj;//****   书单简介
@property(nonatomic,strong)NSString * yidgh;//#####   以读书个数
@property(nonatomic,strong)NSString * studentnum;//   排名

@property(nonatomic,strong)NSString * textid;//文章分享id


@property(nonatomic,strong) UIViewController * vc;
@property(nonatomic,strong)NSString * atype;//

@end

