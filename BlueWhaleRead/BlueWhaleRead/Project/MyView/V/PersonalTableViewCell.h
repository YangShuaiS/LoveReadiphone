//
//  PersonalTableViewCell.h
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseTableViewCell.h"
typedef NS_ENUM(NSInteger, ViewStyle) {
    ViewTopStyle = 0,//上面视图
    ViewDownStyle = 1, //下面视图
    ViewDownClickStyle = 2,//可点击
    ViewDownSwith = 3,//swith
};
@interface PersonalTableViewCell : BaseTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier ViewStyle:(ViewStyle)styles;
@property (nonatomic, strong)NSString * title;
@property (nonatomic, strong)NSString * subtitle;


@property (nonatomic,strong)UIView * baseview;
@property(nonatomic,strong)MyZiLiaoModel * model;

@end
