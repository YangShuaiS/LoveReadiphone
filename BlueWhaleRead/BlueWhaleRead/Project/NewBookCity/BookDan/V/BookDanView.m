//
//  BookDanView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookDanView.h"

@implementation BookDanView{
    FLAnimatedImageView * leftImage;
    BaseLabel * Title;
    BaseLabel * subtitle;
    BaseLabel * fuwenben;
    //    BaseView * downview;
    FLAnimatedImageView * RightImage;
    BaseButton * ComeOn;
    
    
    BaseLabel * title;
    
    BaseLabel * like;
    BaseLabel * nolike;
    FLAnimatedImageView * likeimage;
    FLAnimatedImageView * nolikeimage;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    
    leftImage = [FLAnimatedImageView new];
    leftImage.layer.shadowOpacity = 0.4;
    leftImage.layer.shadowColor = [UIColor blackColor].CGColor;
    leftImage.layer.shadowRadius = 2.f;
    leftImage.layer.shadowOffset = CGSizeMake(0,0);
    leftImage.contentMode = UIViewContentModeScaleAspectFit;
    leftImage.image = UIIMAGE(ZHANWEITUSHU);
    [self addSubview:leftImage];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:Title];
    
    _jKStarDisplayView = [[JKStarDisplayView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.jKStarDisplayView.redValue = [@"0" floatValue];
    [self addSubview:self.jKStarDisplayView];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:subtitle];
    
    fuwenben = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"阅读分级: 0   分值: 0"];
    [self addSubview:fuwenben];
    
    
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
            [self likeYD];
            break;
        default:
            break;
    }
}
- (void)addYiDu{
    WS(ws);
    RightImage = [FLAnimatedImageView new];
    RightImage.image = UIIMAGE(@"icon_已读标签");
    [self addSubview:RightImage];
    
    
    [RightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(-LENGTH(15));
        make.height.mas_equalTo(LENGTH(33.5));
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
        make.top.equalTo(ws).with.offset(LENGTH(15));
        make.left.equalTo(ws).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(100));
        make.height.mas_equalTo(LENGTH(140));
        //        make.height.equalTo(self->leftImage.mas_width).multipliedBy(1.5);
        make.bottom.equalTo(ws).with.offset(-LENGTH(15));
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->leftImage.mas_top).with.offset(LENGTH(3));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(16));
        make.right.equalTo(ws).with.offset(-LENGTH(12));
    }];
    
    [_jKStarDisplayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(6));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(16));
        make.width.mas_equalTo(LENGTH(75));
        make.height.mas_equalTo(LENGTH(14));
        //       make.right.equalTo(ws).with.offset(-12);
    }];
    
    
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.jKStarDisplayView.mas_bottom).with.offset(LENGTH(6.5));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(16));
        make.right.equalTo(ws).with.offset(-LENGTH(12));
    }];
    
    [fuwenben mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(6.5));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(16));
        make.right.equalTo(ws).with.offset(-LENGTH(12));
        
        //        make.width.mas_equalTo(LENGTH(200));
        //        make.bottom.equalTo(self->leftImage.mas_bottom).with.offset(LENGTH(0));
    }];
    
    
    
    
}
- (void)addsjwd{
    WS(ws);
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:subtitleColor LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"今日剩余0次答题机会"];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws).with.offset(-LENGTH(25));
        make.right.equalTo(ws).with.offset(-LENGTH(10));
    }];
    
    BaseLabel * caozuo = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:subtitleColor LabelFont:TextFont(16) TextAlignment:NSTextAlignmentRight Text:@"···"];
    [self addSubview:caozuo];
    [caozuo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.right.equalTo(ws).with.offset(-LENGTH(24));
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
- (void)addSJWD{
    if (title == nil) {
        [self addsjwd];
    }
}
#pragma mark ---------------------------- 已读喜欢
- (void)likeYD{
    if (like == nil) {
        UIView * leftview = [UIView new];
        [self addSubview:leftview];
        
        UIView * rightview = [UIView new];
        [self addSubview:rightview];
        
        likeimage = [FLAnimatedImageView new];
        likeimage.image = UIIMAGE(@"icon_喜欢_未选中");
        [self addSubview:likeimage];
        
        like = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"喜欢"];
        [self addSubview:like];
        
        nolikeimage = [FLAnimatedImageView new];
        nolikeimage.image = UIIMAGE(@"icon_不喜欢_未选中");
        [self addSubview:nolikeimage];
        
        nolike = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"不喜欢"];
        [self addSubview:nolike];
        WS(ws);
        [nolike mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(ws).with.offset(-LENGTH(15));
            make.bottom.mas_equalTo(ws).with.offset(-LENGTH(18));
        }];
        
        [nolikeimage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self->nolike.mas_left).with.offset(-LENGTH(4));
            //            make.bottom.mas_equalTo(ws).with.offset(-LENGTH(20));
            make.centerY.mas_equalTo(self->nolike);
            make.width.mas_equalTo(LENGTH(12));
            make.height.mas_equalTo(LENGTH(12));
        }];
        
        [like mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self->nolikeimage.mas_left).with.offset(-LENGTH(16));
            make.bottom.mas_equalTo(ws).with.offset(-LENGTH(18));
        }];
        
        [likeimage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self->like.mas_left).with.offset(-LENGTH(4));
            //            make.bottom.mas_equalTo(ws).with.offset(-LENGTH(20));
            make.centerY.mas_equalTo(self->like);
            make.width.mas_equalTo(LENGTH(12));
            make.height.mas_equalTo(LENGTH(12));
        }];
        [leftview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->likeimage.mas_left);
            make.right.mas_equalTo(self->like.mas_right);
            make.centerY.mas_equalTo(self->likeimage);
            make.height.mas_equalTo(LENGTH(40));
        }];
        [rightview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->nolikeimage.mas_left);
            make.right.mas_equalTo(self->nolike.mas_right);
            make.centerY.mas_equalTo(self->nolikeimage);
            make.height.mas_equalTo(LENGTH(40));
        }];
        
        leftview.userInteractionEnabled = YES;
        rightview.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
        //将手势添加到需要相应的view中去
        [leftview addGestureRecognizer:tapGesture1];
        
        UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
        //将手势添加到需要相应的view中去
        [rightview addGestureRecognizer:tapGesture2];
    }
}
-(void)setModel:(CityBookListModel *)model{
    _model = model;

    [leftImage sd_setImageWithURL:URLIMAGE(model.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = model.name;
    self.jKStarDisplayView.redValue = [model.mark floatValue];
    subtitle.text = model.author;
    
    NSString * book = model.levels;
    NSString * all = model.b_score;
    NSString * onetextstr = [NSString stringWithFormat:@"阅读分级: %@  分值: %@",model.levels,model.b_score];
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = onetextstr;
    model1.bianString = book;
    model1.fount = 14;
    model1.color = RGB(4,51,50);
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = onetextstr;
    model2.bianString = all;
    model2.fount = 14;
    model2.color = RGB(4,51,50);
    NSArray * modelarray = @[model1,model2];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    fuwenben.attributedText = AttributedStr;
    
    RightImage.hidden = YES;
    
    if (_model.is_read == 2) {
        RightImage.hidden = NO;
    }else{
        RightImage.hidden = YES;
    }
    
}

- (void)setAllmodel:(AllBookListModel *)allmodel{
    _allmodel = allmodel;
    
    [leftImage sd_setImageWithURL:URLIMAGE(allmodel.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = allmodel.name;
    self.jKStarDisplayView.redValue = [allmodel.mark floatValue];
    subtitle.text = allmodel.author;
    
    NSString * book = allmodel.levels;
    NSString * all = allmodel.b_score;
    NSString * onetextstr = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",allmodel.levels,allmodel.b_score];
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = onetextstr;
    model1.bianString = book;
    model1.fount = 14;
    model1.color = RGB(4,51,50);
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = onetextstr;
    model2.bianString = all;
    model2.fount = 14;
    model2.color = RGB(4,51,50);
    NSArray * modelarray = @[model1,model2];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    fuwenben.attributedText = AttributedStr;
    
    RightImage.hidden = YES;
    
    if (_model.is_read == 2) {
        RightImage.hidden = NO;
    }else{
        RightImage.hidden = YES;
    }
}

- (void)setUnreadBookModel:(UnreadBookModel *)unreadBookModel{
    _unreadBookModel = unreadBookModel;
    [leftImage sd_setImageWithURL:URLIMAGE(unreadBookModel.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = unreadBookModel.name;
    self.jKStarDisplayView.redValue = [unreadBookModel.mark floatValue];
    subtitle.text = unreadBookModel.author;
    
    NSString * book = unreadBookModel.levels;
    NSString * all = unreadBookModel.b_score;
    NSString * onetextstr = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",unreadBookModel.levels,unreadBookModel.b_score];
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = onetextstr;
    model1.bianString = book;
    model1.fount = 14;
    model1.color = RGB(4,51,50);
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = onetextstr;
    model2.bianString = all;
    model2.fount = 14;
    model2.color = RGB(4,51,50);
    NSArray * modelarray = @[model1,model2];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    fuwenben.attributedText = AttributedStr;
    if (unreadBookModel.dayTimes>=2) {
        title.text = @"";
    }else{
        title.text = [NSString stringWithFormat:@"今日剩余%ld次答题机会",unreadBookModel.dayTimes];
    }
}

- (void)setReadBookModel:(ReadbookModel *)readBookModel{
    _readBookModel = readBookModel;
    [leftImage sd_setImageWithURL:URLIMAGE(readBookModel.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    Title.text = readBookModel.name;
    self.jKStarDisplayView.redValue = [readBookModel.mark floatValue];
    subtitle.text = readBookModel.author;
    
    NSString * book = readBookModel.levels;
    NSString * all = readBookModel.b_score;
    NSString * onetextstr = [NSString stringWithFormat:@"阅读分级: %@ 分值: %@",readBookModel.levels,readBookModel.b_score];
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = onetextstr;
    model1.bianString = book;
    model1.fount = 14;
    model1.color = RGB(4,51,50);
    AttributedStringModel * model2 = [AttributedStringModel new];
    model2.textString = onetextstr;
    model2.bianString = all;
    model2.fount = 14;
    model2.color = RGB(4,51,50);
    NSArray * modelarray = @[model1,model2];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    fuwenben.attributedText = AttributedStr;
    
    if (readBookModel.is_like == 0) {
        likeimage.image = UIIMAGE(@"icon_喜欢_未选中");
        nolikeimage.image = UIIMAGE(@"icon_不喜欢_未选中");
    }else if (readBookModel.is_like == 1){
        likeimage.image = UIIMAGE(@"icon_喜欢_选中");
        nolikeimage.image = UIIMAGE(@"icon_不喜欢_未选中");
    }else{
        likeimage.image = UIIMAGE(@"icon_喜欢_未选中");
        nolikeimage.image = UIIMAGE(@"icon_不喜欢_选中");
    }
}

- (void)dianji{
    
}



#pragma mark -------- 待修改
- (void)tapGesture1{
    
    [self loadLove:@"1"];
}

- (void)tapGesture2{
    
    [self loadLove:@"2"];
}
- (void)upview:(NSString *)love{
    if ([love isEqualToString:@"1"]) {
        _readBookModel.is_like = 1;
        likeimage.image = UIIMAGE(@"icon_喜欢_选中");
        nolikeimage.image = UIIMAGE(@"icon_不喜欢_未选中");
    }else{
        _readBookModel.is_like = 2;
        likeimage.image = UIIMAGE(@"icon_喜欢_未选中");
        nolikeimage.image = UIIMAGE(@"icon_不喜欢_选中");
    }
}
- (void)loadLove:(NSString *)love{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_LOVEANDNOLOVE];
    
    NSDictionary * dic = @{@"studentid":Me.ssid,@"bookid":_readBookModel.ssid,@"islike":love};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomePage * model = [HomePage mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self upview:love];
                //                [self UpData:model];
            }
            
        }else{
            
        }
    }];
}

- (void)CellColorStyleXZ{
    Title.textColor = RGB(26,26,26);
    subtitle.textColor = RGB(122,120,120);
    fuwenben.text = fuwenben.attributedText.string;
    fuwenben.textColor = RGB(122,120,120);
}

@end
