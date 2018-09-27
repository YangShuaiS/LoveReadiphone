//
//  GeneralUpView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GeneralUpView.h"
#import "PopUpViewStyleAddMedalAllView.h"
#import "PopUpViewStyleAddMedalPartView.h"
#import "PopUpViewStyleMedalcompleteView.h"
#import "PopUpViewStyleAnswerView.h"
#import "PopUpViewStyleBelongView.h"
@implementation GeneralUpView{
    PopUpViewStyleAnswerView * view;
    PopUpViewStyleAddMedalAllView * allview;
    PopUpViewStyleAddMedalPartView * partView;
    PopUpViewStyleMedalcompleteView * comVIew;
    PopUpViewStyleBelongView * belongView;
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
    self.backgroundColor = RGBA(0, 0, 0, 0.7);

}

- (void)setStyle:(PopUpViewStyle)style{
    _style = style;
    switch (_style) {
            
        case PopUpViewStyleAddMedalAll:
            [self PopUpViewStyleAddMedalAll];
            break;
        case PopUpViewStyleAddMedalPart:
            [self PopUpViewStyleAddMedalPart];
            break;
        case PopUpViewStyleMedalcomplete:
            [self PopUpViewStyleMedalcomplete];
            break;
        case PopUpViewStyleAnswer:
            [self PopUpViewStyleAnswer];
            break;
        case PopUpViewStyleBelong:
            [self PopUpViewStyleBelong];
            break;
        default:
            break;
    }
}
- (void)ClickBlock:(PopUpViewClickStyle)style{
    switch (style) {
        case PopUpViewClickStyleRemo:
            [self remSubView];
            break;
        case PopUpViewClickStyleTimeRemo:
            [self TimeremSubView];
            break;
        case PopUpViewClickStylePush:
            [self PushView];
            break;
        default:
            break;
    }
    
}
- (void)PushView{
    [self remSubView];
    self.block();
}
- (void)remSubView{
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)TimeremSubView{
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)PopUpViewStyleBelong{
    WS(ws);
    belongView = [PopUpViewStyleBelongView new];
    [belongView setBlock:^(PopUpViewClickStyle style) {
        [ws ClickBlock:style];
    }];
    [self addSubview:belongView];
    [belongView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

- (void)PopUpViewStyleAddMedalAll{
    WS(ws);
    allview = [PopUpViewStyleAddMedalAllView new];
    [allview setBlock:^(PopUpViewClickStyle style) {
        [ws ClickBlock:style];
    }];
    [self addSubview:allview];
    [allview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}

-(void)PopUpViewStyleAddMedalPart{
    WS(ws);
    partView = [PopUpViewStyleAddMedalPartView new];
    [partView setBlock:^(PopUpViewClickStyle style) {
        [ws ClickBlock:style];
    }];
    [self addSubview:partView];
    [partView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}


-(void)PopUpViewStyleMedalcomplete{
    WS(ws);
    comVIew = [PopUpViewStyleMedalcompleteView new];
    [comVIew setBlock:^(PopUpViewClickStyle style) {
        [ws ClickBlock:style];
    }];
    [self addSubview:comVIew];
    [comVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}


- (void)PopUpViewStyleAnswer{
    WS(ws);
    view = [PopUpViewStyleAnswerView new];
    [view setBlock:^(PopUpViewClickStyle style) {
        [ws ClickBlock:style];
    }];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)setJoinmodel:(JoinBookModel *)joinmodel{
    _joinmodel = joinmodel;
    switch (_style) {
        case PopUpViewStyleBelong:
            belongView.joinmodel = joinmodel;
            break;
        default:
            break;
    }
}
- (void)setModel:(GenPopViewModel *)model{
    _model = model;
    switch (_style) {
            
        case PopUpViewStyleAddMedalAll:
            allview.nav = self.nav;
            allview.model = _model;
            break;
        case PopUpViewStyleAddMedalPart:
            partView.nav = self.nav;
            partView.model = _model;
            break;
        case PopUpViewStyleMedalcomplete:
            comVIew.nav = self.nav;
            comVIew.model = _model;
            break;
        case PopUpViewStyleAnswer:
            view.nav = self.nav;
            view.model = _model;
            break;
        case PopUpViewStyleBelong:
            belongView.nav = self.nav;
            belongView.model = _model;
            break;
        default:
            break;
    }
}
@end
