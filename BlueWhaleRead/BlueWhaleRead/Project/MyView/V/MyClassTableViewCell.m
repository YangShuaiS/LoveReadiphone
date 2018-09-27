//
//  MyClassTableViewCell.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyClassTableViewCell.h"
#import "MyClassCellView.h"
@implementation MyClassTableViewCell{
    MyClassCellView * view;
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
    view = [MyClassCellView new];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setType:(NSInteger)type{
    _type = type;
    view.type = type;
}
- (void)setPaiming:(NSInteger)paiming{
    _paiming = paiming;
    view.paimings = paiming;
}

- (void)setModel:(MyClassModel *)model{
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
- (void)setNav:(UINavigationController *)nav{
    view.nav = nav;
}
@end
