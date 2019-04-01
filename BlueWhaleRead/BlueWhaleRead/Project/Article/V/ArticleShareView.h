//
//  ArticleShareView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArticleShareView : BaseView
@property(nonatomic,strong)LunBoTuXQModel * model;
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

@property(nonatomic,assign)NSInteger shareid;//id


@property(nonatomic,strong) UIViewController * vc;
@property(nonatomic,strong)NSString * atype;//


@property(nonatomic,assign)int inter;

@end

NS_ASSUME_NONNULL_END
