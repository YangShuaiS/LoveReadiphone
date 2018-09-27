//
//  SzScXXCollectionViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface SzScXXCollectionViewCell : BaseCollectionViewCell
@property (nonatomic,strong)SZLListModel * model;
- (void)color;
- (void)backcolor;
@end
