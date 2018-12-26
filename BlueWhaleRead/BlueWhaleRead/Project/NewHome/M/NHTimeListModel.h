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
@property (nonatomic, copy) NSString * week;//周数





@end

NS_ASSUME_NONNULL_END
