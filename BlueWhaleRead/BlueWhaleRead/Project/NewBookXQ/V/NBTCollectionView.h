//
//  NBTCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseCollectionView.h"
#import "NewBookTopClickModel.h"
typedef void(^click)(void);

NS_ASSUME_NONNULL_BEGIN

@interface NBTCollectionView : BaseCollectionView
@property(nonatomic,strong)NSMutableArray * itemArray;
@property(nonatomic,strong)NSString * bookid;
@property(nonatomic,copy)click block;
@property(nonatomic,assign)NSInteger is_read;
@property(nonatomic,strong) BookXQModel * model;

@end

NS_ASSUME_NONNULL_END
