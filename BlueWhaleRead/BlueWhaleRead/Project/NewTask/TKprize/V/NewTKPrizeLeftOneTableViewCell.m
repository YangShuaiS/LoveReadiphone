//
//  NewTKPrizeLeftOneTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/28.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NewTKPrizeLeftOneTableViewCell.h"
#import "NewTKPrizeLeftTwoTableView.h"
@implementation NewTKPrizeLeftOneTableViewCell{
    NewTKPrizeLeftTwoTableView * tableView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    tableView = [NewTKPrizeLeftTwoTableView new];
    tableView.layer.masksToBounds=  YES;
    tableView.layer.cornerRadius = LENGTH(5);
    [self addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(0, LENGTH(11), LENGTH(17), LENGTH(17)));
    }];
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    tableView.itemArray = itemArray;
    tableView.inter = 1;
    CGFloat height = LENGTH(145)*itemArray.count;
    [tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
