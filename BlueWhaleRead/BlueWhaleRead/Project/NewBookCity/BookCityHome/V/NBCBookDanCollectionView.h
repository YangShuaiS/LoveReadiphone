//
//  NBCBookDanCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/11.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN
@protocol NBCBookDanPageControlDelegate <NSObject>

@optional
-(void)NBCBookDanPageControlindex:(NSInteger)clickIndex;

@end
@interface NBCBookDanCollectionView : BaseCollectionView
@property(nonatomic,strong)NSMutableArray * itemArray;
@property(nonatomic,weak)  id<NBCBookDanPageControlDelegate > delegatePage;

@end

NS_ASSUME_NONNULL_END
