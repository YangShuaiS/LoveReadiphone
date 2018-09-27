//
//  MedalListTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalListTableViewCell.h"
#import "MedalListCellView.h"
@implementation MedalListTableViewCell{
    MedalListCellView * cellview;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    WS(ws);
    self.backgroundColor = [UIColor clearColor];
    cellview = [MedalListCellView new];
    cellview.layer.masksToBounds = YES;
//    cellview.layer.cornerRadius = LENGTH(20);
    [self addSubview:cellview];
    [cellview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setModel:(MedalBadgeListModel *)model{
    _model = model;
    cellview.nav = self.nav;
    cellview.model = model;
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
