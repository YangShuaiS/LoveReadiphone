//
//  NBCBookDanTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/11.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NBCBookDanTableViewCell.h"

@implementation NBCBookDanTableViewCell{
    BaseLabel * title;
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
    UIView * leftyuan = [UIView new];
    leftyuan.backgroundColor = RGB(51, 51, 51);
    leftyuan.layer.masksToBounds = YES;
    leftyuan.layer.cornerRadius = LENGTH(2);
    [self addSubview:leftyuan];
    [leftyuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(LENGTH(19));
        make.centerY.mas_equalTo(ws);
        make.size.mas_equalTo(CGSizeMake(LENGTH(4), LENGTH(4)));
    }];
    
    title = [[BaseLabel alloc] initWithTxteColor:RGB(31, 31, 31) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"书名"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftyuan.mas_right).with.offset(LENGTH(8));
        make.top.mas_equalTo(ws).with.offset(LENGTH(2));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(2));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(19));
    }];
}
- (void)setModel:(UnreadBookModel *)model{
    _model = model;
    title.text = model.name;
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
