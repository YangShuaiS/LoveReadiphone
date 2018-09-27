//
//  CTTableViewCell.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTTableViewCell : UITableViewCell
@property (nonatomic,strong)NSString * name;
@property (nonatomic,assign)NSInteger style;

@property(nonatomic,strong) TiMuModel * timodel;
@end
