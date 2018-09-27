//
//  underLeftTableViewCell.h
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface underLeftTableViewCell : BaseTableViewCell
@property (nonatomic, strong) CityTypeListModel* TypeModel;
@property (nonatomic, strong) CityOrderBookModel* orderModel;
@property (nonatomic, strong) BookFenjiModel* fenjiModel;
- (void)cellclick;
- (void)backcellclick;
@end
