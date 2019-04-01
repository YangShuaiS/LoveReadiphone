//
//  NBXQMyClassTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBXQMyClassTableViewCell.h"

@implementation NBXQMyClassTableViewCell{
    FLAnimatedImageView * imageview;
    BaseLabel * Name;
    BaseLabel * Live;
    BaseLabel *YDLALL;
    BaseLabel * JFALL;
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
    imageview = [FLAnimatedImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.layer.masksToBounds = YES;
    imageview.layer.cornerRadius = LENGTH(20);
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(ws);
        make.top.mas_equalTo(ws).with.offset(LENGTH(18));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(18));
        make.left.mas_equalTo(ws).with.offset(LENGTH(25));
        make.size.mas_equalTo(CGSizeMake(LENGTH(40), LENGTH(40)));
    }];
    
    Name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(31,31,31) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:Name];
    
    Live = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(1,195,193) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:Live];
    
    YDLALL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(153,153,153) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:YDLALL];
    
    BaseLabel * JF = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(31,31,31) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentRight Text:@"积分："];
    [self addSubview:JF];
    
    JFALL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(254,165,78)LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:JFALL];
    
    [Name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageview);
        make.left.mas_equalTo(self->imageview.mas_right).with.offset(LENGTH(10));
    }];
    
    [Live mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->Name);
        make.left.mas_equalTo(self->Name.mas_right).with.offset(LENGTH(10));
    }];
    
    [YDLALL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->Name.mas_bottom).with.offset(LENGTH(2));
        make.left.mas_equalTo(self->imageview.mas_right).with.offset(LENGTH(10));
    }];
    
    [JF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(LENGTH(255));
    }];
    
    [JFALL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(JF);
        make.left.mas_equalTo(JF.mas_right).with.offset(LENGTH(0));
    }];
    
    UIView * xian = [UIView new];
    xian.backgroundColor = RGB(229,229,229);
    [self addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws).with.offset(-1);
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.height.mas_equalTo(1);
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
- (void)layoutSubviews{
    [super layoutSubviews];
}

- (void)setModel:(BookXQReadFriendModel *)model{
    [imageview sd_setImageWithURL:URLIMAGE(model.avatar) placeholderImage:UIIMAGE(ZHANWEITUTX)];
    Name.text = model.name;
    Live.text = [NSString stringWithFormat:@"Lv%@",model.level];
    
    YDLALL.text = [NSString stringWithFormat:@"阅读量：%@",model.readnum];
    JFALL.text = model.score;
    //    touxiang.itemarray = model.badgeList;
}
@end
