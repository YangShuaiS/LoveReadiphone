//
//  UnderTableViewCell.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface UnderTableViewCell : BaseTableViewCell
@property (nonatomic, strong) CityTypeListModel* TypeModel;
@property (nonatomic, strong) CityOrderBookModel* orderModel;
@property (nonatomic, strong) BookFenjiModel* fenjiModel;

@end
