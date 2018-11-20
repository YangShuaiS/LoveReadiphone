//
//  NBCGoodBoookListTabView.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableView.h"


@interface NBCGoodBoookListTabView : BaseTableView
@property(nonatomic,strong)NBCALLModel * model;
@property (nonatomic, strong) NSMutableArray* itemarray;

@end

