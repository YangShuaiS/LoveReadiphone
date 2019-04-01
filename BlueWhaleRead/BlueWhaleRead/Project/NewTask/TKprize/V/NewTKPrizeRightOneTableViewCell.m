//
//  NewTKPrizeRightOneTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/28.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NewTKPrizeRightOneTableViewCell.h"
#import "NewTKPrizeRightTwoTableView.h"
@implementation NewTKPrizeRightOneTableViewCell{
    NewTKPrizeRightTwoTableView * tableView;
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
    tableView = [NewTKPrizeRightTwoTableView new];
    tableView.layer.masksToBounds=  YES;
    tableView.layer.cornerRadius = LENGTH(5);
    [self addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(0, LENGTH(11), LENGTH(17), LENGTH(17)));
    }];
}

- (void)setModel:(TKPListModel *)model{
    _model = model;
    tableView.model = model;
    CGFloat height = LENGTH(145)*model.prizeList.count + LENGTH(52);
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
