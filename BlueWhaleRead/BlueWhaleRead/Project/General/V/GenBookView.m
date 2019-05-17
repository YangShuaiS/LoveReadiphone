//
//  GenBookView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GenBookView.h"
#import "StareMoreView.h"

@implementation GenBookView{
    StareMoreView * stareview;
    BaseLabel * fenshu;
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
    
    UIView * topbackview;
    UIImageView * topimageview;
    MBProgressHUD * mb;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        mb = [MBProgressHUD new];
        mb.label.text = @"";
        mb.mode = MBProgressHUDModeText;
        //        [mb showAnimated:YES];
        mb.removeFromSuperViewOnHide = NO;
        mb.label.numberOfLines = 0;
        //        [mb hideAnimated:YES afterDelay:0];
        [[[[UIApplication sharedApplication] delegate] window] addSubview:mb];
        [mb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo([[[UIApplication sharedApplication] delegate] window]);
        }];

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
    
    topbackview = [UIView new];
    topbackview.backgroundColor = RGBA(0, 0, 0, 0.5);
    [yy addSubview:topbackview];
    [topbackview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(self->yy);
        make.size.mas_equalTo(CGSizeMake(LENGTH(28), LENGTH(23)));
    }];
    
    topimageview = [UIImageView new];
    topimageview.contentMode = UIViewContentModeScaleAspectFit;
    topimageview.image = UIIMAGE(@"添加");
    [topbackview addSubview:topimageview];
    [topimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->topbackview);
        make.size.mas_equalTo(CGSizeMake(LENGTH(18), LENGTH(15)));
    }];
    
    topbackview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ShouCang)];
    [topbackview addGestureRecognizer:tap];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font17) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Title];
    
    UIView * backxx = [UIView new];
    backxx.backgroundColor = RGBA(0, 0, 0, 0.6);
    [leftImage addSubview:backxx];
    
    stareview = [StareMoreView new];
    [self addSubview:stareview];
    fenshu = [[BaseLabel alloc] initWithTxteColor:RGB(153, 153, 153) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"9.0"];
    [self addSubview:fenshu];
    
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:subtitle];
    
    fuwenben = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:@"阅读分级: Lv99 分值: 80"];
    [self addSubview:fuwenben];
    
    zxyd = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentCenter Text:@"在线阅读"];
    zxyd.backgroundColor = RGB(91,199,198);
    [yy addSubview:zxyd];
    
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
    
    [stareview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(27));
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(24));
        make.width.mas_equalTo(LENGTH(60));
    }];
    
    [fenshu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->stareview.mas_right).with.offset(LENGTH(8));
        make.centerY.mas_equalTo(self->stareview);
    }];
    
    
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->stareview.mas_bottom).with.offset(LENGTH(24));
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
        make.right.equalTo(self->leftImage.mas_right);
        make.bottom.mas_equalTo(self->leftImage);
        make.size.mas_equalTo(CGSizeMake(LENGTH(55), LENGTH(17)));
    }];
    
    [huo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self->leftImage.mas_bottom);
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
    stareview.redValue = [model.mark floatValue];
    fenshu.text = [NSString stringWithFormat:@"%.1f",[model.mark floatValue]*2.0];
    subtitle.text = model.author;
    fuwenben.text = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",model.levels,model.b_score];
    
    RightImage.hidden = YES;
    
    if (_model.is_read == 2) {
        RightImage.hidden = NO;
    }else{
        RightImage.hidden = YES;
    }
    if (_model.is_read == 0) {
        topimageview.image = UIIMAGE(@"添加");
    }else{
        topimageview.image = UIIMAGE(@"收藏-收藏状态");
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
    stareview.redValue = [allmodel.mark floatValue];
    fenshu.text = [NSString stringWithFormat:@"%.1f",[allmodel.mark floatValue]*2.0];
    subtitle.text = allmodel.author;
    fuwenben.text = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",allmodel.levels,allmodel.b_score];
    if (allmodel.is_read == 0) {
        topimageview.image = UIIMAGE(@"添加");
    }else{
        topimageview.image = UIIMAGE(@"收藏-收藏状态");
    }
}

- (void)setUnreadBookModel:(UnreadBookModel *)unreadBookModel{
    _unreadBookModel = unreadBookModel;
    zxyd.hidden = NO;
    if ([unreadBookModel.b_download isEqualToString:@""]) {
        zxyd.hidden = YES;
    }
    [leftImage sd_setImageWithURL:URLIMAGE(unreadBookModel.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = unreadBookModel.name;
    stareview.redValue = [unreadBookModel.mark floatValue];
    fenshu.text = [NSString stringWithFormat:@"%.1f",[unreadBookModel.mark floatValue]*2.0];
    subtitle.text = unreadBookModel.author;
    fuwenben.text = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",unreadBookModel.levels,unreadBookModel.b_score];
    title.text = [NSString stringWithFormat:@"今日剩余%ld次答题机会",unreadBookModel.dayTimes];
    if (unreadBookModel.is_read == 0) {
        topimageview.image = UIIMAGE(@"添加");
    }else{
        topimageview.image = UIIMAGE(@"收藏-收藏状态");
    }
}

- (void)setReadBookModel:(ReadbookModel *)readBookModel{
    _readBookModel = readBookModel;
    zxyd.hidden = NO;
    [leftImage sd_setImageWithURL:URLIMAGE(readBookModel.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    if ([readBookModel.b_download isEqualToString:@""]) {
        zxyd.hidden = YES;
    }
    Title.text = readBookModel.name;
    stareview.redValue = [readBookModel.mark floatValue];
    fenshu.text = [NSString stringWithFormat:@"%.1f",[readBookModel.mark floatValue]*2.0];
    subtitle.text = readBookModel.author;
    fuwenben.text = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",readBookModel.levels,readBookModel.b_score];
    if (readBookModel.is_read == 0) {
        topimageview.image = UIIMAGE(@"添加");
    }else{
        topimageview.image = UIIMAGE(@"收藏-收藏状态");
    }
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
    
    UIBezierPath *maskPath2 = [UIBezierPath bezierPathWithRoundedRect:topbackview.bounds byRoundingCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(LENGTH(5),LENGTH(5))];
    //创建 layer
    CAShapeLayer *maskLayer2 = [[CAShapeLayer alloc] init];
    maskLayer2.frame = topbackview.bounds;
    //赋值
    maskLayer2.path = maskPath2.CGPath;
    topbackview.layer.mask = maskLayer2;
    
    UIBezierPath *maskPath3 = [UIBezierPath bezierPathWithRoundedRect:zxyd.bounds byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(LENGTH(5),LENGTH(5))];
    //创建 layer
    CAShapeLayer *maskLayer3 = [[CAShapeLayer alloc] init];
    maskLayer3.frame = zxyd.bounds;
    //赋值
    maskLayer3.path = maskPath3.CGPath;
    zxyd.layer.mask = maskLayer3;
}
- (void)ShouCang{
    if (_model != nil) {
        if (_model.is_read == 0) {
            [self addbookcity:_model.ssid];
        }else if (_model.is_read == 1){
            [self remobookcity:_model.ssid];
        }else{
            [mb showAnimated:YES];
            mb.label.text = @"这是已读完书籍\n会永远保存在你的书架里哦～";
            [mb hideAnimated:YES afterDelay:1];
        }
    }
    
    if (_allmodel != nil) {
        if (_allmodel.is_read == 0) {
            [self addbookcity:_allmodel.ssid];
        }else if (_allmodel.is_read == 1){
            [self remobookcity:_allmodel.ssid];
        }else{
            [mb showAnimated:YES];
            mb.label.text = @"这是已读完书籍\n会永远保存在你的书架里哦～";
            [mb hideAnimated:YES afterDelay:1];
        }
    }
    
    
    if (_unreadBookModel != nil) {
        if (_unreadBookModel.is_read == 0) {
            [self addbookcity:_unreadBookModel.ssid];
        }else if (_unreadBookModel.is_read == 1){
            [self remobookcity:_unreadBookModel.ssid];
        }else{
            [mb showAnimated:YES];
            mb.label.text = @"这是已读完书籍\n会永远保存在你的书架里哦～";
            [mb hideAnimated:YES afterDelay:1];
        }
    }
    
    
    
    if (_readBookModel != nil) {
        if (_readBookModel.is_read == 0) {
            [self addbookcity:_readBookModel.ssid];
        }else if (_readBookModel.is_read == 1){
            [self remobookcity:_readBookModel.ssid];
        }else{
            [mb showAnimated:YES];
            mb.label.text = @"这是已读完书籍\n会永远保存在你的书架里哦～";
            [mb hideAnimated:YES afterDelay:1];
        }
    }
    
    
}

- (void)upmodelshchu{
    topimageview.image = UIIMAGE(@"添加");
    if (_model != nil) {
        _model.is_read = 0;
    }
    
    if (_allmodel != nil) {
        _allmodel.is_read = 0;
    }
    
    if (_unreadBookModel != nil) {
        _unreadBookModel.is_read = 0;
    }
    
    if (_readBookModel != nil) {
        _readBookModel.is_read = 0;
    }
}
- (void)upmodelyijiaru{
    topimageview.image = UIIMAGE(@"收藏-收藏状态");
    
    if (_model != nil) {
        _model.is_read = 1;
    }
    
    if (_allmodel != nil) {
        _allmodel.is_read = 1;
    }
    
    
    if (_unreadBookModel != nil) {
        _unreadBookModel.is_read = 1;
        
    }
    
    if (_readBookModel != nil) {
        _readBookModel.is_read = 1;
    }
    
}
- (void)addbookcity:(NSString *)ssid{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_JOOINBOOKCITY];
    //studentid 学生id
    NSDictionary * dic = @{@"bookid":ssid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            JoinBookModel * models = [JoinBookModel mj_objectWithKeyValues:responseObject];
            if ([models.code isEqual:@200]) {
                [ws upmodelyijiaru];
                //                [ws addshoucang];
            }else if ([models.code isEqual:@Notloggedin]){
                
            }
            [self->mb showAnimated:YES];
            self->mb.label.text = models.message;
            [self->mb hideAnimated:YES afterDelay:1];
        }else{
            [self->mb showAnimated:YES];
            self->mb.label.text = @"网络请求失败";
            [self->mb hideAnimated:YES afterDelay:1];
        }
    }];
}

- (void)remobookcity:(NSString *)ssid{
    WS(ws);
    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_REMOVEBOOKCITY];
    NSDictionary * dic = @{@"bookid":ssid,@"studentid":Me.ssid};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TheTopPicModel *Topmodel = [TheTopPicModel mj_objectWithKeyValues:responseObject];
            if ([Topmodel.code isEqual:@200]) {
                [ws upmodelshchu];
                
            }else if ([Topmodel.code isEqual:@Notloggedin]){
            }
            [self->mb showAnimated:YES];
            self->mb.label.text = Topmodel.message;
            [self->mb hideAnimated:YES afterDelay:1];
        }else{
            [self->mb showAnimated:YES];
            self->mb.label.text = @"网络请求失败";
            [self->mb hideAnimated:YES afterDelay:1];
        }
    }];
}


@end
