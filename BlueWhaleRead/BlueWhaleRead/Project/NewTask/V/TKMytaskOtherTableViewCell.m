//
//  TKMytaskOtherTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "TKMytaskOtherTableViewCell.h"
#import "TKMytaskOTView.h"
@implementation TKMytaskOtherTableViewCell
{
    TKMytaskOTView * view;
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
    view = [TKMytaskOTView new];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
-(void)setModel:(TKMyListModel *)model{
    _model = model;
    view.model = model;
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
