//
//  DTTableViewCell.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTTableViewCell : UITableViewCell
@property (nonatomic,strong)NSString * name;
@property (nonatomic,assign)NSInteger style;
@property(nonatomic,strong) TiMuModel * model;
@end
