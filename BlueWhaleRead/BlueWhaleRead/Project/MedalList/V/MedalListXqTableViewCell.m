//
//  MedalListXqTableViewCell.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalListXqTableViewCell.h"
#import "BookCityXunZhang.h"

@implementation MedalListXqTableViewCell{
    FLAnimatedImageView * leftImage;
    BaseLabel * Title;
    BaseLabel * subtitle;
    BaseLabel * fuwenben;
    //    BaseView * downview;
    FLAnimatedImageView * RightImage;
    BaseButton * ComeOn;
    
    BookCityXunZhang * xunzhangone;
    
    BaseLabel * title;
    
    BaseLabel * like;
    BaseLabel * nolike;
    FLAnimatedImageView * likeimage;
    FLAnimatedImageView * nolikeimage;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    
    
    leftImage = [FLAnimatedImageView new];
    leftImage.contentMode = UIViewContentModeScaleAspectFit;
    leftImage.image = UIIMAGE(ZHANWEITUSHU);
    [self addSubview:leftImage];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(22) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Title];
    
    _jKStarDisplayView = [[JKStarDisplayView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.jKStarDisplayView.redValue = [@"4.3" floatValue];
    [self addSubview:self.jKStarDisplayView];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:subtitle];
    
    fuwenben = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentLeft Text:@"阅读分级: 99 分值: 80"];
    [self addSubview:fuwenben];
    
    WS(ws);
    [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(22));
        make.left.equalTo(ws).with.offset(LENGTH(24));
        make.width.mas_equalTo(LENGTH(95));
        make.height.mas_equalTo(LENGTH(133));
        //        make.height.equalTo(self->leftImage.mas_width).multipliedBy(1.5);
        make.bottom.equalTo(ws).with.offset(-LENGTH(22));
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->leftImage.mas_top).with.offset(LENGTH(3));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(27));
        make.right.equalTo(ws).with.offset(-12);
    }];
    
    [_jKStarDisplayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(15));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(27));
        make.width.mas_equalTo(LENGTH(80));
        make.height.mas_equalTo(LENGTH(14));
        //       make.right.equalTo(ws).with.offset(-12);
    }];
    
    
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.jKStarDisplayView.mas_bottom).with.offset(LENGTH(20));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(27));
        make.width.mas_equalTo(LENGTH(200));
    }];
    
    [fuwenben mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(15));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(27));
//        make.width.mas_equalTo(LENGTH(200));
        //        make.bottom.equalTo(self->leftImage.mas_bottom).with.offset(LENGTH(0));
    }];
    
//    [self updata];
//    [self addYiDu];
//    [self addXunZhang];
    
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
