//
//  HTaskWeekTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/10.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "HTaskWeekTableViewCell.h"
#import "HTaskWeekView.h"
@implementation HTaskWeekTableViewCell{
    HTaskWeekView * taskweekView;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    self.backgroundColor = [UIColor clearColor];
    WS(ws);
    taskweekView = [HTaskWeekView new];
    [self addSubview:taskweekView];
    [taskweekView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setModel:(NHTimeListModel *)model{
    _model = model;
    taskweekView.frien = _frien;
    taskweekView.ing = _ing;
    taskweekView.noweek = _noweek;
    taskweekView.colorarray = _colorarray;
    taskweekView.model = model;
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
