//
//  ZhiShiShuRightTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/14.
//  Copyright © 2019 YS. All rights reserved.
//

#import "ZhiShiShuRightTableViewCell.h"
#import "ZSSRightNRView.h"
@implementation ZhiShiShuRightTableViewCell{
    ZSSRightNRView * view;
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
    self.backgroundColor = [UIColor clearColor];
    view = [ZSSRightNRView new];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(14));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(14));
        make.top.mas_equalTo(ws).with.offset(LENGTH(4));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(4));
    }];
}
- (void)setModes:(ZhiShiShuClickModel *)modes{
    _modes = modes;
    view.model = modes;
}
- (void)setBackcolor:(UIColor *)backcolor{
    _backcolor = backcolor;
    view.backcolor = backcolor;
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
