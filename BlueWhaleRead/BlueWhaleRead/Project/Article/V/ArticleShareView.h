//
//  ArticleShareView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"
#import "ArticleShareAnyOnelyView.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ArticleShareViewDelegate <NSObject>
@optional
- (void)ArticleSharShouCang;
- (void)ArticleSharDianZan;
@end

@interface ArticleShareView : BaseView
@property(nonatomic,strong)LunBoTuXQModel * model;
@property(nonatomic,strong)ZhiShiShuModel * ZSModel;

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
@property(nonatomic,assign)NSInteger Type;//1文章类型知识图 2 知识体系类型知识图 3脉络图


@property(nonatomic,assign)int inter;


@property(nonatomic,strong)NSString * itemid;

@property (nonatomic, weak) id <ArticleShareViewDelegate> delegateArticleShare;
@property(nonatomic,strong)ArticleShareAnyOnelyView * dz;
@property(nonatomic,strong)ArticleShareAnyOnelyView * sc;
@property(nonatomic,assign)NSInteger sfzsw;//是否是知识网1


@end

NS_ASSUME_NONNULL_END
