//
//  TKXQTopView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKXQTopView.h"
#import "HTprogressView.h"
#import "HTWeekProCollectionView.h"
#import "TFameViewController.h"

#import "TKIssueViewController.h"
@implementation TKXQTopView{
    BaseLabel * nper;//期数
    BaseLabel * npername;//z新手任务
    BaseLabel * nperwcl;//完成人数
    BaseLabel * Pastwinners;//
    HTprogressView * progress;//进度条
    HTprogressView * wcprogress;//wc进度条
    UIView * rwpg;
    BaseLabel * rwpglabel;
    UIImageView * rwpgimageview;
    HTWeekProCollectionView * weekpro;//周任务

    UIColor * PastwinnersColor;
    UIColor * rwpglabelColor;
    
    UIImageView * fangqi;
}

- (void)setStyle:(TaxkXqStyele)style{
    _style = style;
    self.userInteractionEnabled = YES;
    switch (style) {
        case TaxkXqStyelenoviceingStyle:
            [self addTaxkXqStyelenoviceingStyle];
            break;
        case TaxkXqStyelenoviceendStyle:
            [self addTaxkXqStyelenoviceendStyle];
            break;
        case TaxkXqStyelenovicefqStyle:
            [self addTaxkXqStyelenovicefqStyle];
            break;
        case TaxkXqStyeUserOthering:
            [self addTaxkXqStyeUserOthering];
            break;
        case TaxkXqStyeUserOtherend:
            [self addTaxkXqStyeUserOtherend];
            break;
        case TaxkXqStyeUserOtherfq:
            [self addTaxkXqStyeUserOtherfq];
            break;
        case TaxkXqStyeOtherPeopleing:
            [self addTaxkXqStyeUserOthering];
            break;
        case TaxkXqStyeOtherPeopleend:
            [self addTaxkXqStyeUserOtherend];
            break;
        case TaxkXqStyeOtherPeoplefa:
            [self addTaxkXqStyeUserOtherfq];
            break;
        default:
            break;
    }
}


- (void)chushihuacolorstyle1{
    PastwinnersColor = RGB(29,120,118);
    rwpglabelColor = RGB(67,151,149);
}
- (void)chushihuacolorstyle2{
    PastwinnersColor = RGB(67,99,151);
    rwpglabelColor = RGB(67,99,151);
}
- (void)addTaxkXqStyeUserOtherfq{
    [self addTaxkXqStyeUserOthering];
    [self addimagezt];
}
- (void)addTaxkXqStyeUserOtherend{
    [self addTaxkXqStyeUserOthering];
    [self addimagezt];
}
- (void)addTaxkXqStyeUserOthering{
    [self chushihuacolorstyle2];
    [self addnpername];
    [self addmingrentang];
    [self addjindutiao];
    [self addassessment];
    [self addCollectionView];
    [self otheringlayout];
}

- (void)addTaxkXqStyelenoviceingStyle{
    [self chushihuacolorstyle1];
    [self addnper];
    [self addnpername];
    [self addPastwinners];
    [self addjindutiao];
    [self addassessment];
    [self addCollectionView];
    [self xinshourenwuwq];
}
- (void)addTaxkXqStyelenoviceendStyle{
    [self addTaxkXqStyelenoviceingStyle];
    [self addimagezt];
}
- (void)addTaxkXqStyelenovicefqStyle{
    [self addTaxkXqStyelenoviceingStyle];
    [self addimagezt];
//    fangqi.backgroundColor =RANDOMCOLOR;

}
//他人任务正在进行
- (void)otheringlayout{
    WS(ws);
    [npername mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(50);
        make.left.mas_equalTo(ws).with.offset(LENGTH(35));
    }];
    [nperwcl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->npername.mas_bottom).with.offset(LENGTH(8));
        make.left.mas_equalTo(ws).with.offset(LENGTH(35));
    }];
    [self xinshougongyong];
    [Pastwinners mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(StatusBar+14);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(12));
    }];
    Pastwinners.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mrt)];
    //将手势添加到需要相应的view中去
    [Pastwinners addGestureRecognizer:tapviewtap];

}

//新手任务往期
- (void)xinshourenwuwq{
    WS(ws);
    [nper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(50);
        make.left.mas_equalTo(ws).with.offset(LENGTH(35));
    }];
    [npername mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nper.mas_bottom).with.offset(LENGTH(8));
        make.left.mas_equalTo(ws).with.offset(LENGTH(35));
    }];
    [nperwcl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->npername.mas_bottom).with.offset(LENGTH(8));
        make.left.mas_equalTo(ws).with.offset(LENGTH(35));
    }];
    [self xinshougongyong];
    
    [Pastwinners mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(StatusBar+14);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(12));
    }];
    Pastwinners.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wqzj)];
    //将手势添加到需要相应的view中去
    [Pastwinners addGestureRecognizer:tapviewtap];
}


- (void)wqzj{
    TKIssueViewController * vc = [TKIssueViewController new];
    vc.missionid = _model.mission.ssid;
    [[self viewController].navigationController pushViewController:vc animated:YES];

}

- (void)mrt{
    TFameViewController * vc = [TFameViewController new];
    vc.missionid = _model.mission.ssid;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)xinshougongyong{
    WS(ws);
    [progress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nperwcl.mas_bottom).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws).with.offset(LENGTH(45));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(45));
    }];
    
    [rwpg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->progress.mas_bottom).with.offset(LENGTH(20));
        make.centerX.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(36));
    }];
    
    [weekpro mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->rwpg.mas_bottom).with.offset(LENGTH(16));
        make.left.and.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(200));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(10));
    }];
}
//新手任务他人
- (void)xinshourenwuother{
    
}

- (void)addnper{
    nper = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"第16期"];
    [self addSubview:nper];
}
- (void)addnpername{
    npername = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(22) TextAlignment:NSTextAlignmentLeft Text:@"新手任务（有奖）"];
    [self addSubview:npername];
    nperwcl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"298736人已完成"];
    [self addSubview:nperwcl];
}
- (void)addPastwinners{
    Pastwinners = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:PastwinnersColor LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"查看往期中奖>"];
    [self addSubview:Pastwinners];
}

- (void)addmingrentang{
    Pastwinners = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:PastwinnersColor LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"名人堂>"];
    [self addSubview:Pastwinners];
}
- (void)addjindutiao{
    progress = [HTprogressView new];
    [self addSubview:progress];

    wcprogress = [HTprogressView new];
    [progress addSubview:wcprogress];
    [wcprogress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->progress);
    }];
}
//任务评估
- (void)addassessment{
    rwpg = [UIView new];
    rwpg.backgroundColor = RGBA(255, 255, 255, 0.4);
    rwpg.layer.cornerRadius = LENGTH(18);
    rwpg.layer.masksToBounds = YES;
    [self addSubview:rwpg];
    
    rwpglabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:rwpglabelColor LabelFont:TextFont(19) TextAlignment:NSTextAlignmentLeft Text:@"任务评估："];
    [rwpg addSubview:rwpglabel];
    [rwpglabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(self->rwpg);
        make.left.mas_equalTo(self->rwpg).with.offset(LENGTH(30));
    }];
    
    rwpgimageview = [UIImageView new];
    rwpgimageview.contentMode = UIViewContentModeScaleAspectFit;
//    rwpgimageview.backgroundColor = RANDOMCOLOR;
    [rwpg addSubview:rwpgimageview];
    [rwpgimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->rwpglabel.mas_right).with.offset(LENGTH(5));
        make.width.mas_equalTo(LENGTH(10));
        make.height.mas_equalTo(LENGTH(14));
        make.centerY.mas_equalTo(self->rwpg);
        make.right.mas_equalTo(self->rwpg.mas_right).with.offset(-LENGTH(12));
    }];
}

- (void)addCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((WIDTH-LENGTH(40))/2,LENGTH(16));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(20);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(0);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(20), 0, LENGTH(20));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    weekpro = [[HTWeekProCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    weekpro.inter = 1;
    [self addSubview:weekpro];
}

- (void)addimagezt{
    fangqi = [UIImageView new];
    fangqi.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:fangqi];
    WS(ws);
    [fangqi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(StatusBar+30);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(30));
        make.width.mas_equalTo(LENGTH(85));
        make.height.mas_equalTo(LENGTH(56));
    }];
}

- (void)setModel:(TAKALLModel *)model{
    _model = model;
    if (_style == TaxkXqStyelenoviceingStyle) {
        nper.text = [NSString stringWithFormat:@"第%@期",model.mission.periods_num];
    }
    if (_style == TaxkXqStyelenoviceendStyle|| _style == TaxkXqStyeUserOtherend||_style == TaxkXqStyeOtherPeopleend) {
        fangqi.image = UIIMAGE(@"盖章-已完成");
    }
    if (_style == TaxkXqStyelenovicefqStyle|| _style == TaxkXqStyeUserOtherfq||_style == TaxkXqStyeOtherPeoplefa) {
        fangqi.image = UIIMAGE(@"盖章-已放弃");
    }
    
    npername.text = model.mission.mission_name;
    nperwcl.text = [NSString stringWithFormat:@"%@人已完成",model.mission.completed_num];
    wcprogress.jindu = model.mission.userRatio;
    if ([model.mission.mission_type isEqualToString:@"1"]) {
        if ([model.mission.missionAssessment isEqualToString:@"0"]) {
            rwpglabel.text = [NSString stringWithFormat:@"任务评估：下降"];
            AttributedStringModel * model1 = [AttributedStringModel new];
            model1.textString = rwpglabel.text;
            model1.bianString = [NSString stringWithFormat:@"下降"];
            model1.fount = 15;
            NSArray * modelarray = @[model1];
            NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
            rwpglabel.attributedText = AttributedStr;
        }else{
            rwpglabel.text = [NSString stringWithFormat:@"任务评估：上升"];
            AttributedStringModel * model1 = [AttributedStringModel new];
            model1.textString = rwpglabel.text;
            model1.bianString = [NSString stringWithFormat:@"上升"];
            model1.fount = 15;
            NSArray * modelarray = @[model1];
            NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
            rwpglabel.attributedText = AttributedStr;
        }
    }else{
        rwpglabel.text = [NSString stringWithFormat:@"任务评估：%@分",model.mission.missionAssessment];
        AttributedStringModel * model1 = [AttributedStringModel new];
        model1.textString = rwpglabel.text;
        model1.bianString = [NSString stringWithFormat:@"%@分",model.mission.missionAssessment];
        model1.fount = 15;
        NSArray * modelarray = @[model1];
        NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
        rwpglabel.attributedText = AttributedStr;
    }
    if ([model.mission.rankInfo isEqualToString:@"1"]) {
        rwpgimageview.image = UIIMAGE(@"上升");
    }else{
        rwpgimageview.image = UIIMAGE(@"下降");
    }
    
    NSMutableArray * szarray = [NSMutableArray array];
    NHTimeListModel * szmodel = [NHTimeListModel new];
    szmodel.name = [NSString stringWithFormat:@"识字量测试(+%@分)",model.missionRole.literacy_score];
    szmodel.literacy_is_completed = model.weeksInfo.literacyNum;
    
    NHTimeListModel * scmodel = [NHTimeListModel new];
    scmodel.name = [NSString stringWithFormat:@"识词量测试(+%@分)",model.missionRole.literacy_score];
    scmodel.glossary_is_completed = model.weeksInfo.glossaryNum;
    
    [szarray addObject:szmodel];
    [szarray addObject:scmodel];
    
    NSMutableArray * allarray = [NSMutableArray array];
    [allarray addObject:szarray];
    for (NHTimeListModel * reedbook in model.weeksInfo.weeks) {
        NSMutableArray * rwuarray = [NSMutableArray array];
        NHTimeListModel * reedbooks = [NHTimeListModel new];
        reedbooks.book_is_completed = reedbook.book_is_completed;
        reedbooks.name = [NSString stringWithFormat:@"阅读完成%@本书(+%@分)",model.missionRole.week_book_num,reedbook.book_Score];
        
        NHTimeListModel * share = reedbook;
        share.name = [NSString stringWithFormat:@"分享%@次(+%@分)",model.missionRole.week_share_num,model.missionRole.share_score];
        [rwuarray addObject:reedbooks];
        [rwuarray addObject:share];
        [allarray addObject:rwuarray];
    }
    weekpro.itemArray = allarray;

}
@end
