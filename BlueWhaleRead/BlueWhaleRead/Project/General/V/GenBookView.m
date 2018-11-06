//
//  GenBookView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GenBookView.h"
#import "BookCityXunZhang.h"
@implementation GenBookView{
    FLAnimatedImageView * leftImage;
    BaseLabel * Title;
    BaseLabel * subtitle;
    BaseLabel * fuwenben;
    //    BaseView * downview;
    FLAnimatedImageView * RightImage;
    BaseButton * ComeOn;
    
    BookCityXunZhang * xunzhangone;
    BookCityXunZhang * xunzhangtwo;
    
    BaseLabel * title;
    
    BaseLabel * like;
    BaseLabel * nolike;
    
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
    leftImage = [FLAnimatedImageView new];
    [self addSubview:leftImage];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font17) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Title];
    
    _jKStarDisplayView = [[JKStarDisplayView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.jKStarDisplayView.redValue = [@"4.3" floatValue];
    [self addSubview:self.jKStarDisplayView];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:subtitle];
    
    fuwenben = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:@"阅读分级: Lv99 分值: 80"];
    [self addSubview:fuwenben];
    
    
    [self updata];
    [self addYiDu];
    [self addXunZhang];
    
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
            [self likeYD];
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

- (void)addXunZhang{
    
    
    xunzhangone = [BookCityXunZhang new];
    [self addSubview:xunzhangone];
    xunzhangone.hidden = YES;
    
    xunzhangtwo = [BookCityXunZhang new];
    [self addSubview:xunzhangtwo];
    xunzhangtwo.hidden = YES;
    WS(ws);
    [xunzhangone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->subtitle.mas_right).with.offset(LENGTH(44));
        make.centerY.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(128));
        make.height.mas_equalTo(LENGTH(36));
    }];
    
    [xunzhangtwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->xunzhangone.mas_right).with.offset(LENGTH(44));
        make.centerY.mas_equalTo(ws);
//        make.width.mas_equalTo(LENGTH(128));
        make.height.mas_equalTo(LENGTH(36));
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
        make.top.equalTo(ws).with.offset(LENGTH(27));
        make.left.equalTo(ws).with.offset(LENGTH(24));
        make.width.mas_equalTo(LENGTH(95));
        make.height.mas_equalTo(LENGTH(133));
        //        make.height.equalTo(self->leftImage.mas_width).multipliedBy(1.5);
        make.bottom.equalTo(ws).with.offset(-LENGTH(26));
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->leftImage.mas_top).with.offset(LENGTH(7));
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
        make.top.equalTo(ws.jKStarDisplayView.mas_bottom).with.offset(LENGTH(24));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(27));
        make.width.mas_equalTo(LENGTH(165));
    }];
    
    [fuwenben mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(24));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(27));
//        make.width.mas_equalTo(LENGTH(165));
        //        make.bottom.equalTo(self->leftImage.mas_bottom).with.offset(LENGTH(0));
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
    xunzhangone.hidden = YES;
    xunzhangtwo.hidden = YES;
    [leftImage sd_setImageWithURL:URLIMAGE(model.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = model.name;
    self.jKStarDisplayView.redValue = [model.mark floatValue];
    subtitle.text = model.author;
    fuwenben.text = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",model.levels,model.b_score];
    
    NSMutableArray * array = model.badgeList;
    if (array.count == 0) {
    }else if (array.count == 1&&xunzhangone!=nil){
        xunzhangone.hidden = NO;
        xunzhangone.model = array[0];
    }else if (array.count == 2&&xunzhangone!=nil){
        xunzhangone.hidden = NO;
        xunzhangtwo.hidden = NO;
        xunzhangone.model = array[0];
        xunzhangtwo.model = array[1];
    }
    
    RightImage.hidden = YES;
    
    if (_model.is_read == 2) {
        RightImage.hidden = NO;
    }else{
        RightImage.hidden = YES;
    }
}

- (void)setAllmodel:(AllBookListModel *)allmodel{
    _allmodel = allmodel;
    
    xunzhangone.hidden = YES;
    xunzhangtwo.hidden = YES;
    [leftImage sd_setImageWithURL:URLIMAGE(allmodel.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = allmodel.name;
    self.jKStarDisplayView.redValue = [allmodel.mark floatValue];
    subtitle.text = allmodel.author;
    fuwenben.text = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",allmodel.levels,allmodel.b_score];
    
    NSMutableArray * array = allmodel.badgeList;
    if (array.count == 0) {
    }else if (array.count == 1&&xunzhangone!=nil){
        xunzhangone.hidden = NO;
        xunzhangone.model = array[0];
    }else if (array.count == 2&&xunzhangone!=nil){
        xunzhangone.hidden = NO;
        xunzhangtwo.hidden = NO;
        xunzhangone.model = array[0];
        xunzhangtwo.model = array[1];
    }
}

- (void)setUnreadBookModel:(UnreadBookModel *)unreadBookModel{
    _unreadBookModel = unreadBookModel;
    [leftImage sd_setImageWithURL:URLIMAGE(unreadBookModel.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = unreadBookModel.name;
    self.jKStarDisplayView.redValue = [unreadBookModel.mark floatValue];
    subtitle.text = unreadBookModel.author;
    fuwenben.text = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",unreadBookModel.levels,unreadBookModel.b_score];
    title.text = [NSString stringWithFormat:@"今日剩余%ld次答题机会",unreadBookModel.dayTimes];
    NSMutableArray * array = unreadBookModel.badgeList;
    [self xunzhanghiden:array];
}

- (void)setReadBookModel:(ReadbookModel *)readBookModel{
    _readBookModel = readBookModel;
    [leftImage sd_setImageWithURL:URLIMAGE(readBookModel.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = readBookModel.name;
    self.jKStarDisplayView.redValue = [readBookModel.mark floatValue];
    subtitle.text = readBookModel.author;
    fuwenben.text = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",readBookModel.levels,readBookModel.b_score];
    NSMutableArray * array = readBookModel.badgeList;
    [self xunzhanghiden:array];
}

-(void)xunzhanghiden:(NSMutableArray *)array{
    xunzhangone.hidden = YES;
    xunzhangtwo.hidden = YES;
    if (array.count == 0) {
    }else if (array.count == 1&&xunzhangone!=nil){
        xunzhangone.hidden = NO;
        xunzhangone.model = array[0];
    }
    else if (array.count == 2&&xunzhangone!=nil){
        xunzhangone.hidden = NO;
        //        xunzhangtwo.hidden = NO;
        xunzhangone.model = array[0];
        //        xunzhangtwo.model = array[1];
    }
}
- (void)dianji{
    
}
@end
