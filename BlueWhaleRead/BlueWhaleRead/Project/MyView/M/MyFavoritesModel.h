//
//  MyFavoritesModel.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/21.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyFavoritesModel : BaseModel
@property (nonatomic, copy) NSNumber * code;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, strong) NSMutableArray *collectionList;
@property (nonatomic, strong) NSMutableArray *proverbList;

+ (void)InitializeModel;
@end

NS_ASSUME_NONNULL_END
