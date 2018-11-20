//
//  NBCchannelCollectionView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionView.h"

@interface NBCchannelCollectionView : BaseCollectionView
@property(nonatomic,assign)BOOL more;
@property(nonatomic,assign)BOOL zt;
@property(nonatomic,strong)NSMutableArray * itemArray;

@end

