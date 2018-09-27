//
//  DTDownLasOrNextView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTDownLasOrNextView.h"

@implementation DTDownLasOrNextView{
    BaseView * downView;
    
    FLAnimatedImageView * lasttopic;
    FLAnimatedImageView * nexttopic;
    FLAnimatedImageView * RJOrFanHuiBookCity;
}
- (void)remoview{
    [downView removeFromSuperview];
    downView = nil;
}
- (void)setDtdownstyle:(DtLastOrNext)dtdownstyle{
    if (!downView) {
        _dtdownstyle = dtdownstyle;
        [self addDownView];
        switch (dtdownstyle) {
            case DTStyleWithOneNext:
                [self addNext];
                [self upDataOneNext];
                break;
            case DTStyleWithLastAndNext:
                [self addNext];
                [self addLast];
                [self upDataLastAndNext];
                break;
            case DTStyleWithLastAndPushUp:
                [self addLast];
                [self addTJ];
                [self PushView];
                break;
            case DTStyleWithLastAndPushBack:
                [self addLast];
                [self addBaack];
                [self PushView];
                break;
            case DTStyleWithPushUp:
                [self addTJ];
                [self tjjia];
                break;
            case DTStyleWithBack:
                [self addBaack];
                [self BackView];
                break;
            default:
                break;
        }
        
    }

}

- (void)BackView{

    [RJOrFanHuiBookCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->downView.mas_centerX);
        make.width.mas_equalTo(LENGTH(128));
        make.height.mas_equalTo(LENGTH(36));
        make.top.mas_equalTo(self->downView.mas_top);
        make.bottom.mas_equalTo(self->downView.mas_bottom);
    }];
}

- (void)tjjia{
    [RJOrFanHuiBookCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->downView.mas_centerX);
        make.centerY.mas_equalTo(self->downView.mas_centerY);
        make.width.mas_equalTo(LENGTH(104));
        make.height.mas_equalTo(LENGTH(44));
    }];
    

}
- (void)addBaack{
    RJOrFanHuiBookCity = [FLAnimatedImageView new];
    RJOrFanHuiBookCity.backgroundColor = RGB(255,154,73);
    RJOrFanHuiBookCity.layer.masksToBounds = YES;
    RJOrFanHuiBookCity.layer.cornerRadius = LENGTH(18);
    RJOrFanHuiBookCity.layer.borderWidth = 1;
    RJOrFanHuiBookCity.layer.borderColor = [UIColor whiteColor].CGColor;
    [downView addSubview:RJOrFanHuiBookCity];
    
    BaseLabel * Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"返回我的书架"];
    [RJOrFanHuiBookCity addSubview:Title];
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->RJOrFanHuiBookCity );
    }];

    RJOrFanHuiBookCity.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BackBookList)];
    //将手势添加到需要相应的view中去
    [RJOrFanHuiBookCity addGestureRecognizer:tapGesture1];
    
}
- (void)PushView{
    [lasttopic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->downView.mas_centerX).with.offset(-LENGTH(74));
        make.width.mas_equalTo(LENGTH(104));
        make.height.mas_equalTo(LENGTH(44));
        make.top.mas_equalTo(self->downView.mas_top);
        make.bottom.mas_equalTo(self->downView.mas_bottom);
    }];
    
    [RJOrFanHuiBookCity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->downView.mas_centerX).with.offset(LENGTH(86));
        make.centerY.mas_equalTo(self->downView.mas_centerY);
        make.width.mas_equalTo(LENGTH(128));
        make.height.mas_equalTo(LENGTH(36));
    }];
}

- (void)upDataOneNext{
    [nexttopic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->downView.mas_centerX);
        make.width.mas_equalTo(LENGTH(104));
        make.height.mas_equalTo(LENGTH(44));
        make.top.mas_equalTo(self->downView.mas_top);
        make.bottom.mas_equalTo(self->downView.mas_bottom);
    }];
}
- (void)upDataLastAndNext{
    [lasttopic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->downView.mas_centerX).with.offset(-LENGTH(74));
        make.width.mas_equalTo(LENGTH(104));
        make.height.mas_equalTo(LENGTH(44));
        make.top.mas_equalTo(self->downView.mas_top);
        make.bottom.mas_equalTo(self->downView.mas_bottom);
    }];
    
    [nexttopic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->downView.mas_centerX).with.offset(LENGTH(74));;
        make.width.mas_equalTo(LENGTH(104));
        make.height.mas_equalTo(LENGTH(44));
        make.top.mas_equalTo(self->downView.mas_top);
        make.bottom.mas_equalTo(self->downView.mas_bottom);
    }];
}



- (void)addTJ{
    RJOrFanHuiBookCity = [FLAnimatedImageView new];
    RJOrFanHuiBookCity.backgroundColor = RGB(34,202,255);
    RJOrFanHuiBookCity.layer.masksToBounds = YES;
    RJOrFanHuiBookCity.layer.cornerRadius = LENGTH(18);
    RJOrFanHuiBookCity.layer.borderWidth = 1;
    RJOrFanHuiBookCity.layer.borderColor = [UIColor whiteColor].CGColor;
    [downView addSubview:RJOrFanHuiBookCity];
    
    BaseLabel * Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"提交答案"];
    Title.numberOfLines = 0;
    [RJOrFanHuiBookCity addSubview:Title];
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->RJOrFanHuiBookCity);
    }];
    RJOrFanHuiBookCity.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TJDAN)];
    //将手势添加到需要相应的view中去
    [RJOrFanHuiBookCity addGestureRecognizer:tapGesture1];
}

- (void)addNext{
    nexttopic = [FLAnimatedImageView new];
    nexttopic.image = UIIMAGE(@"icon_下一题");
    [downView addSubview:nexttopic];
    
    BaseLabel * Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"下一题"];
    Title.numberOfLines = 0;
    [nexttopic addSubview:Title];
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->nexttopic);
    }];
    nexttopic.userInteractionEnabled = YES;

    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nexttopic)];
    //将手势添加到需要相应的view中去
    [nexttopic addGestureRecognizer:tapGesture1];
}

- (void)addLast{
    lasttopic = [FLAnimatedImageView new];
    lasttopic.image = UIIMAGE(@"icon_上一题下一题");
    [downView addSubview:lasttopic];
    
    BaseLabel * Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"上一题"];
    Title.numberOfLines = 0;
    [lasttopic addSubview:Title];
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->lasttopic);
    }];
    lasttopic.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Lasttopic)];
    //将手势添加到需要相应的view中去
    [lasttopic addGestureRecognizer:tapGesture1];
}

- (void)addDownView{
    downView = [BaseView new];
    downView.backgroundColor = [UIColor clearColor];
//    downView.backgroundColor = RANDOMCOLOR;
    [self addSubview:downView];
    WS(ws);
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    downView.userInteractionEnabled = YES;
}

//上一题
- (void)Lasttopic{
    PushModel * model = [PushModel new];
    model.style = DaTiTiaoCHuanShangYiTi;
    [self.delegate DtDownClick:model];
}

//下一题
- (void)nexttopic{
    PushModel * model = [PushModel new];
    model.style = DaTiTiaoCHuanXiaYiTi;
    [self.delegate DtDownClick:model];
}

//提交答案
- (void)TJDAN{
    PushModel * model = [PushModel new];
    model.style = PushDaTiJieGuo;
    [self.delegate DtDownClick:model];
}

//返回书架
- (void)BackBookList{
    PushModel * model = [PushModel new];
    model.style = DtPushBookList;
    [self.delegate DtDownClick:model];
}
@end
