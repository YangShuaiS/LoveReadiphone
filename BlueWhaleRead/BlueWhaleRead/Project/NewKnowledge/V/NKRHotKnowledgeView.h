//
//  NKRHotKnowledgeView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "BaseView.h"
#import "NKRHotKnowledgeCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NKRHotKnowledgeView : BaseView<NBCBookDanPageControlDelegate>
@property(nonatomic,strong)NSMutableArray * itemArray;

@end

NS_ASSUME_NONNULL_END
