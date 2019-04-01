//
//  TKNewXQTopView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/1/14.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "TKNewXQTopView.h"
#import "HTaskprogressView.h"
#import "TKIssueViewController.h"
#import "TFameViewController.h"
#import "NewTKPrizeViewController.h"

@implementation TKNewXQTopView{
    UIImageView* backImage;
    UIImageView * backimageview;
    BaseLabel * nper;//期数
    UIImageView * npername;//z新手任务
    BaseLabel * nperwcl;//完成人数
    BaseLabel * Pastwinners;//往期中奖
    BaseLabel * CKALLJP;//查看全部奖品
    HTaskprogressView * progressView;//进度
    UIImageView * fangqi;

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
    WS(ws);
    backimageview = [UIImageView new];
    backimageview.contentMode = UIViewContentModeScaleAspectFill;
    backimageview.layer.masksToBounds = YES;
    [self addSubview:backimageview];
    [self addjindutiao];
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
        case TaxkXqStyeUserZJ:
            [self addTaxkXqStyeUserZJ];
            break;

        default:
            break;
    }
}
- (void)addTaxkXqStyelenoviceingStyle{
    [self addback];
    [self addnper];
    [self addnpername];
    [self addPastwinners];
    [self addckqbjp];
    [self xinshourenwuwq];
}

- (void)addTaxkXqStyelenoviceendStyle{
    [self addTaxkXqStyelenoviceingStyle];
    [self addimagezt];
}
- (void)addTaxkXqStyelenovicefqStyle{
    [self addTaxkXqStyelenoviceingStyle];
    [self addimagezt];
    
}
- (void)addTaxkXqStyeUserOthering{
    [self addback];
    [self addnperother];
    [self addnpername];
    [self addmingrentang];
    [self otherrenwu];
}
- (void)addTaxkXqStyeUserOtherend{
    [self addTaxkXqStyeUserOthering];
    [self addimagezt];

}
- (void)addTaxkXqStyeUserOtherfq{
    [self addTaxkXqStyeUserOthering];
    [self addimagezt];
}
- (void)addTaxkXqStyeUserZJ{
    [self addback];
    [self addnperother];
    [self addnpername];
    [self ZJtask];
    [self addimagezt];
}
- (void)upback{
    WS(ws);
    [backimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [backimageview mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(ws);
        make.width.mas_equalTo(ws.frame.size.width);
        make.height.mas_equalTo(ws.frame.size.height);
    }];



}
- (void)xinshourenwuwq{
    WS(ws);
    [nper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->backImage);
        make.left.mas_equalTo(ws).with.offset(LENGTH(34));
    }];
    [npername mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nper.mas_bottom).with.offset(LENGTH(16));
        make.left.mas_equalTo(ws).with.offset(LENGTH(34));
    }];
    [nperwcl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->npername.mas_bottom).with.offset(LENGTH(16));
        make.left.mas_equalTo(ws).with.offset(LENGTH(34));
    }];
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nperwcl.mas_bottom);
        make.left.and.right.mas_equalTo(ws);
    }];

    [Pastwinners mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(StatusBar+14);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(12));
    }];

    [CKALLJP mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->progressView.mas_bottom).with.offset(LENGTH(28));
        make.centerX.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(54));
    }];
    [self.superview layoutIfNeeded];
    [self upback];
}

- (void)otherrenwu{
    WS(ws);
    [nper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->backImage);
        make.left.mas_equalTo(ws).with.offset(LENGTH(34));
    }];
    
    [nperwcl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nper.mas_bottom).with.offset(LENGTH(16));
        make.left.mas_equalTo(ws).with.offset(LENGTH(34));
    }];
    
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nperwcl.mas_bottom);
        make.left.and.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(54));
    }];
    
    [Pastwinners mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(StatusBar+14);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(12));
    }];
    [self.superview layoutIfNeeded];
    [self upback];
}
- (void)ZJtask{
    WS(ws);
    [nper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->backImage);
        make.left.mas_equalTo(ws).with.offset(LENGTH(34));
    }];
    
    [nperwcl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nper.mas_bottom).with.offset(LENGTH(16));
        make.left.mas_equalTo(ws).with.offset(LENGTH(34));
    }];
    
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nperwcl.mas_bottom);
        make.left.and.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(54));
    }];
    [self.superview layoutIfNeeded];
    [self upback];
}

- (void)addback{
    WS(ws);
    backImage = [UIImageView new];
    backImage.contentMode = UIViewContentModeScaleAspectFit;
    backImage.image = UIIMAGE(@"icon_返回_细");
    [self addSubview:backImage];
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(StatusBar+13);
        make.left.mas_equalTo(ws).with.offset(LENGTH(12));
        make.width.mas_equalTo(12);
        make.height.mas_equalTo(22);
    }];
    
    UIView * tapview = [UIView new];
    [self addSubview:tapview];
    [tapview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(ws);
        make.height.mas_equalTo(NavHeight);
        make.width.mas_equalTo(LENGTH(50));
    }];
    tapview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(NavLeftClick)];
    //将手势添加到需要相应的view中去
    [tapview addGestureRecognizer:tapviewtap];
    
}
- (void)addnper{
    nper = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"第16期"];
    [self addSubview:nper];
    
    npername = [UIImageView new];
    npername.contentMode = UIViewContentModeScaleAspectFit;
    npername.image = UIIMAGE(@"新手任务（有奖）");
    [self addSubview:npername];
}

- (void)addnperother{
    nper = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(24) TextAlignment:NSTextAlignmentLeft Text:@"中阶任务"];
    [self addSubview:nper];
}

- (void)addnpername{
    nperwcl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentLeft Text:@"298736人已完成"];
    [self addSubview:nperwcl];
}
- (void)addPastwinners{
    Pastwinners = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"查看往期中奖>"];
    [self addSubview:Pastwinners];
    Pastwinners.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wqzj)];
    //将手势添加到需要相应的view中去
    [Pastwinners addGestureRecognizer:tapviewtap];
    
}

- (void)addmingrentang{
    Pastwinners = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"名人堂>"];
    [self addSubview:Pastwinners];
    Pastwinners.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mrt)];
    //将手势添加到需要相应的view中去
    [Pastwinners addGestureRecognizer:tapviewtap];

}
- (void)addjindutiao{
    progressView = [HTaskprogressView new];
    progressView.inter = 1;
    [self addSubview:progressView];
}
- (void)addckqbjp{
    CKALLJP = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"查看全部奖品>"];
    [self addSubview:CKALLJP];
    CKALLJP.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(qbjp)];
    //将手势添加到需要相应的view中去
    [CKALLJP addGestureRecognizer:tapviewtap1];
}

- (void)addimagezt{
    fangqi = [UIImageView new];
    fangqi.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:fangqi];
    WS(ws);
    [fangqi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(StatusBar+30);
//        make.right.mas_equalTo(ws).with.offset(-LENGTH(30));
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(100));
        make.height.mas_equalTo(LENGTH(88));
    }];
}

- (void)setModel:(TAKALLModel *)model{
    _model = model;
//    backimageview.backgroundColor = _colorarray[0];
    
    if (_style == TaxkXqStyelenoviceingStyle || _style == TaxkXqStyelenoviceendStyle || _style == TaxkXqStyelenovicefqStyle) {
        nper.text = [NSString stringWithFormat:@"第%@期",model.mission.periods_num];
    }else{
        nper.text = model.mission.mission_name; 
    }
    if (_style == TaxkXqStyelenoviceendStyle|| _style == TaxkXqStyeUserOtherend||_style == TaxkXqStyeOtherPeopleend) {
        fangqi.image = UIIMAGE(@"已完成");
    }
    if (_style == TaxkXqStyelenovicefqStyle|| _style == TaxkXqStyeUserOtherfq||_style == TaxkXqStyeOtherPeoplefa) {
        fangqi.image = UIIMAGE(@"已放弃");
    }
    if ([_model.mission.mission_type isEqualToString:@"3"]) {
        [Pastwinners removeFromSuperview];
    }
    
//    npername.text = model.mission.mission_name;
    nperwcl.text = [NSString stringWithFormat:@"%@人已完成",model.mission.completed_num];
    progressView.colorarray = _colorarray;
    progressView.jindu = model.mission.userRatio;

//    progressView.jindu = 60;
    [backimageview sd_setImageWithURL:URLIMAGE(model.mission.mission_check_background)];

    WS(ws);
    //GCD延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self->backimageview mas_updateConstraints:^(MASConstraintMaker *make) {
////            make.size.mas_equalTo(ws);
//     
//        }];
        self->progressView.mission_type = [self->_model.mission.mission_type integerValue];
    });
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
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
- (void)qbjp{
    NewTKPrizeViewController * vc = [NewTKPrizeViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
- (void)NavLeftClick{
    [[self viewController].navigationController popViewControllerAnimated:YES];
    
}

@end
