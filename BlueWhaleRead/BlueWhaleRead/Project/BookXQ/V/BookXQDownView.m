//
//  BookXQDownView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookXQDownView.h"
#import "DTALLiewController.h"

@implementation BookXQDownView{
    BaseView * Lefttview;
    BaseLabel * leftLabel;
    FLAnimatedImageView * leftImageView;

    
    BaseView * rightview;
    BaseLabel * RightLabel;
    
    FLAnimatedImageView * rightImageView;
    
    TheTopPicModel * Topmodel;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    BaseView * bacView = [BaseView new];
    bacView.backgroundColor = RGBA(1,78,136,0.6);
    [self addSubview:bacView];
    [bacView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    Lefttview  = [BaseView new];
    Lefttview.backgroundColor = RGB(255,167,96);
    Lefttview.layer.masksToBounds = YES;
    Lefttview.layer.cornerRadius = LENGTH(21);
    [self addSubview:Lefttview];
    [Lefttview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.centerX.mas_equalTo(ws).with.offset(-LENGTH(89));
        make.width.mas_equalTo(LENGTH(160));
        make.height.mas_equalTo(LENGTH(42));
    }];
    
    
    leftLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"答题"];
    [self addSubview:leftLabel];
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->Lefttview.mas_centerY);
        make.centerX.mas_equalTo(self->Lefttview.mas_centerX);
    }];

    rightview  = [BaseView new];
    rightview.backgroundColor = RGB(1,195,193);
    rightview.layer.masksToBounds = YES;
    rightview.layer.cornerRadius = LENGTH(21);
    [self addSubview:rightview];
    [rightview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.centerX.mas_equalTo(ws).with.offset(LENGTH(80+9));
        make.width.mas_equalTo(LENGTH(160));
        make.height.mas_equalTo(LENGTH(42));
    }];
    
    RightLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"加入书架"];
    [rightview addSubview:RightLabel];

    [RightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->rightview.mas_centerY);
        make.centerX.mas_equalTo(self->rightview.mas_centerX);
    }];



    Lefttview.userInteractionEnabled = YES;
    rightview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bookcity)];
    //将手势添加到需要相应的view中去
    [Lefttview addGestureRecognizer:tapGesture1];
    
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addbookcity)];
    //将手势添加到需要相应的view中去
    [rightview addGestureRecognizer:tapGesture2];
    
    rightImageView = [FLAnimatedImageView new];
    rightImageView.image = UIIMAGE(@"icon_书籍详情_选中对勾");
    [rightview addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->rightview.mas_left).with.offset(-LENGTH(22));
        make.centerY.mas_equalTo(self->rightview.mas_centerY);
        make.width.mas_equalTo(LENGTH(22));
        make.height.mas_equalTo(LENGTH(22));
    }];
    
    leftImageView = [FLAnimatedImageView new];
    leftImageView.image = UIIMAGE(@"icon_书籍详情_选中对勾");
    [Lefttview addSubview:leftImageView];
    [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->Lefttview.mas_left).with.offset(-LENGTH(22));
        make.centerY.mas_equalTo(self->Lefttview.mas_centerY);
        make.width.mas_equalTo(LENGTH(22));
        make.height.mas_equalTo(LENGTH(22));
    }];

}
- (void)bookcity{
    if ([self.nav respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.nav.interactivePopGestureRecognizer.enabled = NO;
    }
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.nav.view addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.nav.view);
    }];
    
    leftLabel.userInteractionEnabled = NO;
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TZDTTIMU];
    NSDictionary * dic = @{@"bookid":_model.ssid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            self->Topmodel = [TheTopPicModel mj_objectWithKeyValues:responseObject];
            if ([self->Topmodel.code isEqual:@200]) {
                
                WS(ws);
                ws.model.dayTimes --;
                ws.model = ws.model;
                GeneralUpView * genView = [GeneralUpView new];
                genView.style = PopUpViewStyleAnswer;
                [self.nav.view addSubview:genView];
                [genView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.mas_equalTo(ws.nav.view);
                }];
                NSString *str_minute = [NSString stringWithFormat:@"%02ld",(self->Topmodel.time%3600)/60];//分

                GenPopViewModel * m = [GenPopViewModel new];
                m.title = @"答题说明";
                NSMutableArray * arr = ws.model.badgeList;
                CityBadgeListModel * citymodel = [CityBadgeListModel new];
                if (arr.count>0) {
                    citymodel = arr[0];
                }else{
                    citymodel.name = @"";
                }
                m.subtitle = [NSString stringWithFormat:@"一共%ld道题\n你必须在%@分钟之内答完所有题目\n答题成功之后可以点亮\n%@\n你准备好了吗？",self->Topmodel.bookProblems.count,str_minute,citymodel.name];
                genView.model = m;
                [genView setBlock:^{
                    DTALLiewController * vc = [DTALLiewController new];
                    vc.style = DTBookStyle;
                    vc.titles = @"挑战答题";
                    vc.Topmodel = self->Topmodel;
                    vc.bookid = self.model.ssid;
                    vc.bookname = self.model.name;
                    vc.bookfenshu = self.model.b_score;
                    [self.nav pushViewController:vc animated:YES];
                }];
                [mb hideAnimated:NO afterDelay:1];
            }else{
                mb.label.text = self->Topmodel.message;
                [mb hideAnimated:NO afterDelay:1];
            }
            self->leftLabel.userInteractionEnabled = YES;
        }else{
            mb.label.text = @"网络请求失败";
            [mb hideAnimated:NO afterDelay:1];
            self->leftLabel.userInteractionEnabled = YES;
        }
    }];
}
//加入书架
- (void)addBook{
//    [UIView animateWithDuration:0.5 animations:^{
        self->RightLabel.text = @"已加入";
        [self->RightLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self->rightview.mas_centerX).with.offset(LENGTH(5));
        }];
        [self->rightImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->rightview.mas_left).with.offset(LENGTH(20));
        }];
        [self->RightLabel layoutIfNeeded];
        [self->rightImageView layoutIfNeeded];
//    } completion:^(BOOL finished) {
        self->rightview.userInteractionEnabled = NO;
//    }];
}
- (void)addbookcity{
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.nav.view addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.nav.view);
    }];

    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_JOOINBOOKCITY];
    //studentid 学生id
    NSDictionary * dic = @{@"bookid":_model.ssid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            JoinBookModel * models = [JoinBookModel mj_objectWithKeyValues:responseObject];
            if ([models.code isEqual:@200]) {
                [self addBook];
                NSMutableArray * bagearray = self->_model.badgeList;
                NSMutableArray * arr = ws.model.badgeList;
                if (arr.count>0) {
                    CityBadgeListModel * city = bagearray[0];
                    WS(ws);
                    GeneralUpView * genView = [GeneralUpView new];
                    genView.nav = self.nav;
                    genView.style = PopUpViewStyleBelong;
                    [self.nav.view addSubview:genView];
                    [genView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.edges.mas_equalTo(ws.nav.view);
                    }];
                    
                    GenPopViewModel * m = [GenPopViewModel new];
                    m.title = self->_model.name;
                    m.subtitle = city.name;
                    genView.model = m;
                    genView.joinmodel = models;
                }
                [mb hideAnimated:NO afterDelay:1];

            }else{
                mb.label.text = models.message;
                [mb hideAnimated:NO afterDelay:1];
            }
        }else{
            mb.label.text = @"网络请求失败";
            [mb hideAnimated:NO afterDelay:1];
        }
    }];
    //待定

}
- (void)setModel:(BookXQbookModel *)model{
    _model = model;
    if (model.is_read == 1) {
        [self addBook];
        if (model.dayTimes<=0) {
            [self noread];
        }
    }else if (model.is_read ==2){
        [self yidu];
    }
}
- (void)yidu{
    self->RightLabel.text = @"已完成";
    [self->RightLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->rightview.mas_centerX).with.offset(LENGTH(5));
    }];
    [self->rightImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->rightview.mas_left).with.offset(LENGTH(20));
    }];
    [self->RightLabel layoutIfNeeded];
    [self->rightImageView layoutIfNeeded];
    //    } completion:^(BOOL finished) {
    self->rightview.userInteractionEnabled = NO;
    
    leftLabel.text = @"已答完";
    [self->leftLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->Lefttview.mas_centerX).with.offset(LENGTH(5));
    }];
    [self->leftImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->Lefttview.mas_left).with.offset(LENGTH(20));
    }];
    [self->leftLabel layoutIfNeeded];
    [self->leftImageView layoutIfNeeded];

//    leftLabel.alpha = 0.6;
    Lefttview.userInteractionEnabled = NO;
}
- (void)noread{
    leftLabel.text = @"明日再来";
//    leftLabel.alpha = 0.6;
    Lefttview.userInteractionEnabled = NO;
}
@end
