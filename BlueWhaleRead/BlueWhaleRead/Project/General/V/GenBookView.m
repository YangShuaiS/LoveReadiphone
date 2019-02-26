//
//  GenBookView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GenBookView.h"
@implementation GenBookView{
    FLAnimatedImageView * leftImage;
    BaseLabel * Title;
    BaseLabel * subtitle;
    BaseLabel * fuwenben;
    BaseLabel * zxyd;
    UIImageView * huo;
    BaseLabel * ydcs;
    //    BaseView * downview;
    FLAnimatedImageView * RightImage;
    BaseButton * ComeOn;
    
    BaseLabel * title;
    
    BaseLabel * like;
    BaseLabel * nolike;
    UIView * yy;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)addView{
    WS(ws);
    UIView * yinyig = [UIView new];
    yinyig.backgroundColor = [UIColor whiteColor];
    [self addSubview:yinyig];
    [yinyig mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(27));
        make.left.equalTo(ws).with.offset(LENGTH(24));
        make.width.mas_equalTo(LENGTH(95));
        make.height.mas_equalTo(LENGTH(133));
        //        make.height.equalTo(self->leftImage.mas_width).multipliedBy(1.5);
        make.bottom.equalTo(ws).with.offset(-LENGTH(26));
    }];
    yinyig.layer.shadowOpacity = 0.16;
    yinyig.layer.shadowColor = [UIColor blackColor].CGColor;
    yinyig.layer.shadowRadius = LENGTH(4);
    yinyig.layer.shadowOffset = CGSizeMake(0,0);
    yinyig.layer.cornerRadius = LENGTH(5);
    
    yy = [UIView new];
    yy.backgroundColor = [UIColor whiteColor];
    [self addSubview:yy];
    [yy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(27));
        make.left.equalTo(ws).with.offset(LENGTH(24));
        make.width.mas_equalTo(LENGTH(95));
        make.height.mas_equalTo(LENGTH(133));
        //        make.height.equalTo(self->leftImage.mas_width).multipliedBy(1.5);
        make.bottom.equalTo(ws).with.offset(-LENGTH(26));
    }];
    
    leftImage = [FLAnimatedImageView new];
    [yy addSubview:leftImage];
    UIImageView * xian = [UIImageView new];
    xian.image = UIIMAGE(@"书线");
    [yy addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.and.left.mas_equalTo(self->yy);
        make.width.mas_equalTo(LENGTH(9));
    }];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font17) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Title];
    
    UIView * backxx = [UIView new];
    backxx.backgroundColor = RGBA(0, 0, 0, 0.6);
    [leftImage addSubview:backxx];
    _jKStarDisplayView = [[JKStarDisplayView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.jKStarDisplayView.redValue = [@"4.3" floatValue];
    [leftImage addSubview:self.jKStarDisplayView];
    [backxx mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.jKStarDisplayView).with.insets(UIEdgeInsetsMake(-LENGTH(2), -LENGTH(2), -LENGTH(2), -LENGTH(2)));
    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:subtitle];
    
    fuwenben = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:@"阅读分级: Lv99 分值: 80"];
    [self addSubview:fuwenben];
    
    zxyd = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(240,179,0) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"可在线阅读"];
    [self addSubview:zxyd];
    
    huo = [UIImageView new];
    huo.contentMode = UIViewContentModeScaleAspectFit;
    huo.image = UIIMAGE(@"阅读次数-火");
    [self addSubview:huo];
    
    ydcs = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(83,83,83) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"1000次阅读"];
    [self addSubview:ydcs];
    
    [self updata];
    [self addYiDu];
}
- (void)setBookCase:(BookCaseStyle)bookCase{
    _bookCase = bookCase;
    switch (bookCase) {
        case BookCaseStyleWD:
            
            break;
        case BookCaseStyleYD:
            break;
        case BookCaseStyleHomeWD:
            
            break;
        case BookCaseStyleHomeYD:
            
            break;
        case BookCaseStyleSJWD:
            RightImage.hidden = YES;
            [self addSJWD];
            
            break;
        case BookCaseStyleSJYD:
//            [self likeYD];
            break;
        default:
            break;
    }
}
- (void)addYiDu{
    WS(ws);
    RightImage = [FLAnimatedImageView new];
    RightImage.backgroundColor = RANDOMCOLOR;
    [self addSubview:RightImage];
    
    [RightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(-LENGTH(30));
        make.height.mas_equalTo(LENGTH(37));
        make.width.mas_equalTo(LENGTH(30));
        
    }];
}

- (void)addWeiDu{
    WS(ws);
    
    ComeOn = [BaseButton buttonWithType:UIButtonTypeCustom];
    [ComeOn setTitle:@"未读" forState:UIControlStateNormal];
    [ComeOn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ComeOn addTarget:self action:@selector(ComeOn) forControlEvents:UIControlEventTouchUpInside];
    ComeOn.layer.borderWidth = 1;
    ComeOn.layer.borderColor = [UIColor blackColor].CGColor;
    ComeOn.layer.cornerRadius = 5;
    ComeOn.layer.masksToBounds = YES;
    [self addSubview:ComeOn];
    
    [ComeOn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(-12);
    }];
}
-(void)ComeOn{
    
}
- (void)updata{
    WS(ws);
    [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->yy);
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->leftImage.mas_top).with.offset(LENGTH(7));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(27));
        make.right.equalTo(ws).with.offset(-12);
    }];
    
    [_jKStarDisplayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self->leftImage.mas_bottom).with.offset(-LENGTH(2));
        make.right.equalTo(self->leftImage.mas_right).with.offset(-LENGTH(2));
        make.width.mas_equalTo(LENGTH(80));
        make.height.mas_equalTo(LENGTH(14));
        //       make.right.equalTo(ws).with.offset(-12);
    }];
    
    
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->title.mas_bottom).with.offset(LENGTH(24));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(27));
        make.width.mas_equalTo(LENGTH(165));
    }];
    
    [fuwenben mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(24));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(27));
//        make.width.mas_equalTo(LENGTH(165));
        //        make.bottom.equalTo(self->leftImage.mas_bottom).with.offset(LENGTH(0));
    }];
    
    [zxyd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->fuwenben.mas_bottom).with.offset(LENGTH(11));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(16));
        make.right.equalTo(ws).with.offset(-LENGTH(12));
    }];
    
    [huo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->zxyd.mas_bottom).with.offset(LENGTH(12));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(16));
        make.width.mas_equalTo(LENGTH(8));
        make.height.mas_equalTo(LENGTH(12));
    }];
    
    [ydcs mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->huo.mas_right).with.offset(LENGTH(3));
        make.centerY.mas_equalTo(self->huo);
    }];
    
}

- (void)addSJWD{
    WS(ws);
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:subtitleColor LabelFont:TextFont(Font14) TextAlignment:NSTextAlignmentLeft Text:@"今日剩余0次答题机会"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(25));
        make.right.equalTo(ws).with.offset(-LENGTH(25));
    }];
    
    BaseLabel * caozuo = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:subtitleColor LabelFont:TextFont(25) TextAlignment:NSTextAlignmentRight Text:@"···"];
    [self addSubview:caozuo];
    [caozuo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.right.equalTo(ws).with.offset(-LENGTH(45));
    }];
    
    BaseButton * dianji = [BaseButton buttonWithType:UIButtonTypeCustom];
    [dianji addTarget:self action:@selector(dianji) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:dianji];
    
    [dianji mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(caozuo.mas_left).with.offset(0);
    }];
}
#pragma mark ---------------------------- 已读喜欢
- (void)likeYD{
    like = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(179, 179, 179) LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:@"👍 喜欢"];
    [self addSubview:like];
    
    nolike = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 80, 80) LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:@"👎 不喜欢"];
    [self addSubview:nolike];
    
    WS(ws);
    [nolike mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(24));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(20));
    }];
    [like mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->nolike.mas_left).with.offset(-LENGTH(24));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(20));
    }];
}
-(void)setModel:(CityBookListModel *)model{
    _model = model;
    zxyd.hidden = NO;
    ydcs.text = [NSString stringWithFormat:@"%@次阅读",model.read_times];
    if ([model.b_download isEqualToString:@""]) {
        zxyd.hidden = YES;
    }
    [leftImage sd_setImageWithURL:URLIMAGE(model.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = model.name;
    self.jKStarDisplayView.redValue = [model.mark floatValue];
    subtitle.text = model.author;
    fuwenben.text = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",model.levels,model.b_score];
    
    RightImage.hidden = YES;
    
    if (_model.is_read == 2) {
        RightImage.hidden = NO;
    }else{
        RightImage.hidden = YES;
    }
}

- (void)setAllmodel:(AllBookListModel *)allmodel{
    _allmodel = allmodel;
    zxyd.hidden = NO;
    ydcs.text = [NSString stringWithFormat:@"%@次阅读",allmodel.read_times];
    if ([allmodel.b_download isEqualToString:@""]) {
        zxyd.hidden = YES;
    }
    [leftImage sd_setImageWithURL:URLIMAGE(allmodel.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = allmodel.name;
    self.jKStarDisplayView.redValue = [allmodel.mark floatValue];
    subtitle.text = allmodel.author;
    fuwenben.text = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",allmodel.levels,allmodel.b_score];
}

- (void)setUnreadBookModel:(UnreadBookModel *)unreadBookModel{
    _unreadBookModel = unreadBookModel;
    zxyd.hidden = NO;
    if ([unreadBookModel.b_download isEqualToString:@""]) {
        zxyd.hidden = YES;
    }
    [leftImage sd_setImageWithURL:URLIMAGE(unreadBookModel.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = unreadBookModel.name;
    self.jKStarDisplayView.redValue = [unreadBookModel.mark floatValue];
    subtitle.text = unreadBookModel.author;
    fuwenben.text = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",unreadBookModel.levels,unreadBookModel.b_score];
    title.text = [NSString stringWithFormat:@"今日剩余%ld次答题机会",unreadBookModel.dayTimes];
}

- (void)setReadBookModel:(ReadbookModel *)readBookModel{
    _readBookModel = readBookModel;
    zxyd.hidden = NO;
    [leftImage sd_setImageWithURL:URLIMAGE(readBookModel.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    if ([readBookModel.b_download isEqualToString:@""]) {
        zxyd.hidden = YES;
    }
    Title.text = readBookModel.name;
    self.jKStarDisplayView.redValue = [readBookModel.mark floatValue];
    subtitle.text = readBookModel.author;
    fuwenben.text = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",readBookModel.levels,readBookModel.b_score];
}

- (void)dianji{
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:yy.bounds byRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopRight cornerRadii:CGSizeMake(LENGTH(5),LENGTH(5))];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = yy.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    yy.layer.mask = maskLayer;
}
@end
