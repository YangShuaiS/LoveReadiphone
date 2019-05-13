//
//  MyMedalTopTableViewCell.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyMedalTopTableViewCell.h"
#import "MyMedalTopView.h"
@implementation MyMedalTopTableViewCell{
    MyMedalTopView * topView;
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
    topView = [MyMedalTopView new];
    topView.layer.masksToBounds = YES;
    topView.layer.cornerRadius = LENGTH(10);
    topView.itemarray = @"123";
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(16));
        make.left.mas_equalTo(ws).with.offset(LENGTH(15));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(15));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(10));
    }];
}
- (void)setNav:(UINavigationController *)nav{
    topView.nav = nav;
}

- (void)setModel:(MyBadgeListModel *)model{
    _model = model;
//    topView.model = _model;
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
