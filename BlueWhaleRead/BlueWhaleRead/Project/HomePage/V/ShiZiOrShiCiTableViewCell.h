//
//  ShiZiOrShiCiTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseCollectionViewCell.h"
typedef void(^Clickbtn)(PushModel *model);

@interface ShiZiOrShiCiTableViewCell : BaseCollectionViewCell<BaseViewDelegate>
@property (nonatomic,assign)DaTiStyle style;
@property (nonatomic,assign)NSInteger EndCell;

@property(nonatomic,strong)SZLListModel * szorci;//识字或者识词文字and图model
@property(nonatomic,strong)SCLListMOdel * scorci;//识字或者识词文字and图model

@property (nonatomic,copy)Clickbtn clickTag;

@end
