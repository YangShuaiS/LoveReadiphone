//
//  MyMedalTableViewCell.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyMedalTableViewCell.h"
#import "MyMedalView.h"
@implementation MyMedalTableViewCell{
    MyMedalView * view;
    
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
    view = [MyMedalView new];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = LENGTH(5);
//    view.itemarray = @"123";
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(LENGTH(0));
        make.left.mas_equalTo(ws).with.offset(LENGTH(15));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(15));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(10));
    }];
}
- (void)setModel:(MyBadgeXQModel *)model{
    _model = model;
    view.nav = self.nav;
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
