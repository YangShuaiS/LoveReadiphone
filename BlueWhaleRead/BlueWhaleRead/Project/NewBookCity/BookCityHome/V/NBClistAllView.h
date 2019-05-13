//
//  NBClistAllView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
#import "NBCBookDanCollectionView.h"
@interface NBClistAllView : BaseView<NBCBookDanPageControlDelegate>
@property(nonatomic,strong)NBCALLModel * model;

@end
