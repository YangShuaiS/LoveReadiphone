//
//  HomeNewMedalTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeNewMedalTableViewCell.h"
#import "GeneralMedalView.h"
@implementation HomeNewMedalTableViewCell{
    FLAnimatedImageView * leftImage;
    BaseLabel * Title;
//    BaseLabel * Time;
    BaseLabel * SubTitle;
//    FLAnimatedImageView * xunzhang;
//    BaseLabel * xunzhangshu;
    FLAnimatedImageView * rentou;
    BaseLabel * rentoushu;
    GeneralMedalView * MedalView;
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

    
    
    leftImage = [FLAnimatedImageView new];
    leftImage.image = UIIMAGE(@"bg_勋章背景_首页");
    leftImage.layer.masksToBounds = YES;
    leftImage.layer.cornerRadius = LENGTH(6);
    [self addSubview:leftImage];
    
    MedalView = [GeneralMedalView new];
    MedalView.upjl = LENGTH(6);
    [leftImage addSubview:MedalView];

    
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:Title];
    
//    Time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font17) TextAlignment:NSTextAlignmentLeft Text:@""];
//    [self addSubview:Time];
    
    SubTitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@""];
//    SubTitle.numberOfLines = 0;
    [self addSubview:SubTitle];
    
    
//    xunzhang = [FLAnimatedImageView new];
//    xunzhang.backgroundColor = RANDOMCOLOR;
//    [self addSubview:xunzhang];
//
    rentou = [FLAnimatedImageView new];
    rentou.image = UIIMAGE(@"icon_点亮人数");
    [self addSubview:rentou];
    
//    xunzhangshu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
//    [self addSubview:xunzhangshu];
    
    rentoushu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    [self addSubview:rentoushu];
    [self updata];
}

- (void)updata{
    WS(ws);
    [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(20));
        make.left.equalTo(ws).with.offset(LENGTH(14));
        make.width.mas_equalTo(LENGTH(100));
        make.height.mas_equalTo(LENGTH(66.5));

//        make.height.equalTo(self->leftImage.mas_width).multipliedBy(0.666);
        make.bottom.equalTo(ws).with.offset(-LENGTH(20));

    }];
    
    [MedalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->leftImage);
        make.width.mas_equalTo(LENGTH(60));
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->leftImage.mas_top).with.offset(LENGTH(5));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(11));
    }];
    
//    [Time mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self->Title.mas_centerY);
//        make.right.equalTo(ws).with.offset(-LENGTH(25));
//    }];
    
    [SubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(10));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(11));
        make.right.equalTo(ws).with.offset(-LENGTH(25));
    }];
//
//    [xunzhang mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->SubTitle.mas_bottom).with.offset(LENGTH(24));
//        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(21));
//        make.height.mas_equalTo(20);
//        make.width.mas_equalTo(20);
//    }];
//
//    [xunzhangshu mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self->xunzhang.mas_centerY);
//        make.left.equalTo(self->xunzhang.mas_right).with.offset(LENGTH(12));
//        make.width.mas_equalTo(50);
//    }];
    
    [rentou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(-LENGTH(94));
        make.height.mas_equalTo(LENGTH(12));
        make.width.mas_equalTo(LENGTH(12));
        make.centerY.mas_equalTo(self->Title.mas_centerY);
    }];
    
    [rentoushu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->rentou.mas_right).with.offset(LENGTH(9));
        make.centerY.mas_equalTo(self->Title.mas_centerY);

        //        make.bottom.equalTo(ws).with.offset(-20);
    }];
//    [self layoutIfNeeded];
//    if (rentou.frame.size.width>0) {
//        if (rentou.frame.origin.y+rentou.frame.size.height>leftImage.frame.origin.y+leftImage.frame.size.height) {
//            [rentou mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.bottom.equalTo(ws).with.offset(-20);
//            }];
//            //            [rentou layoutIfNeeded];
//        }else{
//            [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.bottom.equalTo(ws).with.offset(-20);
//            }];
//            //            [leftImage layoutIfNeeded];
//        }
//        //        [self layoutSubviews];
//    }
//    
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
//    int a = 10;
    //
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"剩余%d天",a]];
//    Time.attributedText = attributedString;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (void)setStr:(NSString *)str{
    SubTitle.text = str;
}
- (void)setModel:(BadgeListModel *)model{
    _model = model;
//    [leftImage sd_setImageWithURL:URLIMAGE(model.logo) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = model.name;
    SubTitle.text = model.info;
//    rentoushu.text = [NSString stringWithFormat:@"%@人已点亮 %@人点亮中",model.getBadgeNum,model.badgeNum];
    rentoushu.text = [NSString stringWithFormat:@"%@人点亮中",model.badgeNum];

    MedalView.images = model.logo;
}

@end
