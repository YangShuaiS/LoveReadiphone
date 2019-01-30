//
//  NHTimeListModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NHTimeListModel : BaseModel
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * glossary_is_completed;//识词量是否完成
@property (nonatomic, copy) NSString * literacy_is_completed;//识字量是否完成
@property (nonatomic, copy) NSString * book_is_completed;//书是否完成
@property (nonatomic, copy) NSString * share_is_completed;//：分享是否完成
@property (nonatomic, copy) NSString * book_Score;//：书分数
@property (nonatomic, copy) NSString * share_Score;//：分享分数
@property (nonatomic, copy) NSString * week;//周数

@property (nonatomic, copy) NSString * week_book_num;//周书
@property (nonatomic, copy) NSString * week_share_num;//周分享
@property (nonatomic, copy) NSString * allweek_book_num;
@property (nonatomic, copy) NSString * allweek_share_num;
@property (nonatomic, assign) NSInteger types;//1书 2 分享 3z识字 4 识词
@property (nonatomic, assign) NSInteger completed;//0未完成 1完成

@property (nonatomic, copy) NSString * book_num;//
@property (nonatomic, copy) NSString * share_num;//
@end

NS_ASSUME_NONNULL_END
