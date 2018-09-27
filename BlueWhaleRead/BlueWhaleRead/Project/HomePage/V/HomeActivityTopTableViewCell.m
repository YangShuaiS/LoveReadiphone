//
//  HomeActivityTopTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeActivityTopTableViewCell.h"
#import "HomeActivityTopView.h"
@implementation HomeActivityTopTableViewCell{
    HomeActivityTopView * view;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addview];
    }
    return self;
}
- (void)addview{
    view = [HomeActivityTopView new];
    [self addSubview:view];
    WS(ws);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setHiden:(BOOL)hiden{
    _hiden =hiden;
    view.hidden = _hiden;
}
- (void)setModel:(ZhuTiTagModel *)model{
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
