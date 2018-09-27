//
//  JoinBookCityView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "JoinBookCityView.h"
#import "JoinBookCitytableView.h"
@implementation JoinBookCityView{
    JoinBookCitytableView * tableView;
    BaseView * backView;
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
    self.backgroundColor = [UIColor clearColor];
    backView = [BaseView new];
    backView.backgroundColor = RGBA(0, 0, 0, 0.4);
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);

    }];
    
    //为了那个正常显示动画
    tableView = [[JoinBookCitytableView alloc] initWithFrame:CGRectMake(0, HEIGHT, WIDTH, HEIGHT-LENGTH(120))];
    tableView.layer.masksToBounds = YES;
    tableView.layer.cornerRadius = LENGTH(10);
    [self addSubview:tableView];
    tableView.hidden = YES;
    
    _joinDown = [[JoinDownView alloc] initWithFrame:CGRectMake(0, HEIGHT, WIDTH, LENGTH(67))];
    _joinDown.backgroundColor = RGBA(1,78,136,0.7);
    [self addSubview:_joinDown];
    _joinDown.hidden = YES;

    
    FLAnimatedImageView * clickImage = [FLAnimatedImageView new];
    clickImage.image = UIIMAGE(@"icon_弹窗_关闭");
//    clickImage.backgroundColor = RANDOMCOLOR;
    [backView addSubview:clickImage];
    [clickImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->backView.mas_right).with.offset(-LENGTH(27));
        make.top.mas_equalTo(self->backView.mas_top).with.offset(NavHeight+LENGTH(22));
        make.width.mas_equalTo(LENGTH(30));
        make.height.mas_equalTo(LENGTH(30));
    }];
    
    BaseButton * clickButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [clickButton addTarget:self action:@selector(quxiao) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:clickButton];
    [clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->backView.mas_right).with.offset(-LENGTH(27-15));
        make.top.mas_equalTo(self->backView.mas_top).with.offset(NavHeight+LENGTH(22-15));
        make.width.mas_equalTo(LENGTH(60));
        make.height.mas_equalTo(LENGTH(60));
    }];
    
    [tableView setBlock:^(NSInteger inter) {
        [ws addInter:inter];
    }];

}
- (void)addInter:(NSInteger)inter{
    _joinDown.model = tableView.itemarray[inter];
    MedalListBadgeInfoModel * topmodel = _model.badgeInfo;

    GenPopViewModel * m = [GenPopViewModel new];
    m.title = topmodel.name;
    m.task_num = topmodel.task_num;
    m.studentCompletedNum = _model.bookList.count;
    m.itemarray = _joinDown.itemarray;
    m.model = _joinDown.models;
    if (_joinDown.itemarray.count == topmodel.task_num) {
        WS(ws);
        GeneralUpView * genView = [GeneralUpView new];
        genView.nav = self.nav;
        genView.style = PopUpViewStyleAddMedalPart;
        genView.model = m;
        [self.nav.view addSubview:genView];
        [genView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.nav.view);
        }];
    }
    
    if (_joinDown.itemarray.count == _model.bookList.count) {
        WS(ws);
        GeneralUpView * genView = [GeneralUpView new];
        genView.nav = self.nav;
        genView.style = PopUpViewStyleAddMedalAll;
        genView.model = m;
        [self.nav.view addSubview:genView];
        [genView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.nav.view);
        }];
    }
}
- (void)quxiao{
    self.block();
    [UIView animateWithDuration:1 animations:^{
        self->tableView.alpha = 0;
        self.joinDown.alpha = 0;
        self->backView.alpha = 0;
        CGRect frame = CGRectMake(0, HEIGHT, WIDTH, HEIGHT-LENGTH(120));
        self->tableView.frame = frame;
        CGRect framejo = CGRectMake(0, HEIGHT, WIDTH, LENGTH(67));
        self.joinDown.frame = framejo;
    } completion:^(BOOL finished) {
        self->tableView.hidden = YES;
        self.joinDown.hidden = YES;
        self->backView.hidden = YES;
        self.hidden = YES;
    }];
}
- (void)animationBegin{
    tableView.alpha = 1;
    tableView.hidden = NO;
    _joinDown.hidden = NO;
    _joinDown.alpha = 1;
    backView.hidden = NO;
    backView.alpha = 1;
    self.hidden = NO;

    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self->tableView.frame;
        frame.origin.y = NavHeight+LENGTH(70);
        self->tableView.frame = frame;
        
        CGRect framejo = self.joinDown.frame;
        framejo.origin.y = HEIGHT-LENGTH(67);
        self.joinDown.frame = framejo;
    } completion:^(BOOL finished) {

    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    tableView.itemarray = itemarray;
}
- (void)setModel:(MedalListXqModel *)model{
    _model = model;
    tableView.nav = self.nav;
    _joinDown.nav = self.nav;
    tableView.model = model.badgeInfo;
    _joinDown.models = model;

}

@end

