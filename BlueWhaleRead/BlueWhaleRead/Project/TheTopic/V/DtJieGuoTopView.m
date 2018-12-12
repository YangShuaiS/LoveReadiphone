 //
//  DtJieGuoTopView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DtJieGuoTopView.h"
#import "GeneralLongBtn.h"

#import "ChaKanCuoTiViewController.h"
#import "DTALLiewController.h"
#import "BookListViewController.h"

@implementation DtJieGuoTopView{
    BaseView * backView;
    FLAnimatedImageView * topImageView;
    
    BaseLabel * zql;    
    GeneralLongBtn * POPBookCity;
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
    backView = [BaseView new];
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
    }];
    
    topImageView = [FLAnimatedImageView new];
    [backView addSubview:topImageView];
    [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->backView.mas_centerX);
        make.top.mas_equalTo(self->backView.mas_top).with.offset(NavHeight+LENGTH(11));
        make.width.mas_equalTo(LENGTH(83));
        make.height.mas_equalTo(LENGTH(83));
    }];
}



- (void)DTJGYES{
    WS(ws);
    backView.backgroundColor = RGB(90,196,192);
    topImageView.image = UIIMAGE(@"icon_答题成功");
    BaseLabel * jg = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(241,247,247) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"同学，恭喜你答题成功！"];
    [backView addSubview:jg];
    [jg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->topImageView.mas_bottom).with.offset(LENGTH(8));
    }];
    
    
    BaseLabel * hqjf = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(241,247,247) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:[NSString stringWithFormat:@"获得积分：%ld",_models.score]];
    [backView addSubview:hqjf];
    [hqjf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(jg.mas_bottom).with.offset(LENGTH(10));
    }];
    
    BaseLabel * zjf = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(241,247,247) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:[NSString stringWithFormat:@"总积分：%ld",_models.totalScore]];
    [backView addSubview:zjf];
    [zjf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(hqjf.mas_bottom).with.offset(LENGTH(8));
        make.bottom.mas_equalTo(self->backView.mas_bottom).with.offset(-LENGTH(18));
    }];
    [self addjg];
    
    if (_cuotiarray.count == 0) {
        POPBookCity = [GeneralLongBtn new];
        POPBookCity.backcolors = RGB(255,154,73);
        POPBookCity.textcolor = RGB(255,255,255);
        POPBookCity.text = @"返回我的书架";
        [self addSubview:POPBookCity];
        [POPBookCity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->zql.mas_bottom).with.offset(LENGTH(27));
            make.centerX.mas_equalTo(ws);
            make.width.mas_equalTo(LENGTH(130));
            make.height.mas_equalTo(LENGTH(40));
        }];
        POPBookCity.userInteractionEnabled = YES;        
        UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bookcity)];
        //将手势添加到需要相应的view中去
        [POPBookCity addGestureRecognizer:tapGesture1];
    }else{
        GeneralLongBtn * CKCT = [GeneralLongBtn new];
        CKCT.backcolors = RGB(90,196,192);
        CKCT.textcolor = RGB(255,255,255);
        CKCT.text = @"查看错题";
        [self addSubview:CKCT];
        [CKCT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->zql.mas_bottom).with.offset(LENGTH(27));
            make.centerX.mas_equalTo(ws).with.offset(-LENGTH(10)-LENGTH(65));
            make.width.mas_equalTo(LENGTH(130));
            make.height.mas_equalTo(LENGTH(40));
        }];
        
        POPBookCity = [GeneralLongBtn new];
        POPBookCity.backcolors = RGB(255,154,73);
        POPBookCity.textcolor = RGB(255,255,255);
        POPBookCity.text = @"返回我的书架";
        [self addSubview:POPBookCity];
        [POPBookCity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->zql.mas_bottom).with.offset(LENGTH(27));
            make.centerX.mas_equalTo(ws).with.offset(LENGTH(10)+LENGTH(65));
            make.width.mas_equalTo(LENGTH(130));
            make.height.mas_equalTo(LENGTH(40));
        }];
        CKCT.userInteractionEnabled = YES;
        POPBookCity.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ck)];
        //将手势添加到需要相应的view中去
        [CKCT addGestureRecognizer:tapGesture];
        
        UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bookcity)];
        //将手势添加到需要相应的view中去
        [POPBookCity addGestureRecognizer:tapGesture1];
        
    }
}

- (void)DTJGNO{
    WS(ws);
    backView.backgroundColor = RGB(254,95,95);
    topImageView.image = UIIMAGE(@"icon_答题失败");
    BaseLabel * jg = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(241,247,247) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"哎呀，答题失败了，继续努力哟！"];
    [backView addSubview:jg];
    [jg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->topImageView.mas_bottom).with.offset(LENGTH(8));
    }];
    
    BaseLabel * zhangtai = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(241,247,247) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@""];
    [backView addSubview:zhangtai];
    [zhangtai mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(jg.mas_bottom).with.offset(LENGTH(9));
        make.bottom.mas_equalTo(self->backView.mas_bottom).with.offset(-LENGTH(18));
    }];
    [self addjg];
    
    if (_models.challengeTime  <=0) {
        zhangtai.text = @"今日没有挑战机会了，明天再来吧！";
        GeneralLongBtn * POPBookCity = [GeneralLongBtn new];
        POPBookCity.backcolors = RGB(255,154,73);
        POPBookCity.textcolor = RGB(255,255,255);
        POPBookCity.text = @"返回我的书架";
        [self addSubview:POPBookCity];
        [POPBookCity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->zql.mas_bottom).with.offset(LENGTH(27));
            make.centerX.mas_equalTo(ws);
            make.width.mas_equalTo(LENGTH(130));
            make.height.mas_equalTo(LENGTH(40));
        }];
        POPBookCity.userInteractionEnabled = YES;
        UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bookcity)];
        //将手势添加到需要相应的view中去
        [POPBookCity addGestureRecognizer:tapGesture1];
        

    }else{
        zhangtai.text = [NSString stringWithFormat:@"今天还有   %ld  次挑战机会",_models.challengeTime];
        GeneralLongBtn * CKCT = [GeneralLongBtn new];
        CKCT.backcolors = RGB(110,156,244);
        CKCT.textcolor = RGB(255,255,255);
        CKCT.text = @"继续答题";
        [self addSubview:CKCT];
        [CKCT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->zql.mas_bottom).with.offset(LENGTH(27));
            make.centerX.mas_equalTo(ws).with.offset(-LENGTH(10)-LENGTH(65));
            make.width.mas_equalTo(LENGTH(130));
            make.height.mas_equalTo(LENGTH(40));
        }];
        
        
        
        GeneralLongBtn * POPBookCity = [GeneralLongBtn new];
        POPBookCity.backcolors = RGB(255,154,73);
        POPBookCity.textcolor = RGB(255,255,255);
        POPBookCity.text = @"返回我的书架";
        [self addSubview:POPBookCity];
        [POPBookCity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->zql.mas_bottom).with.offset(LENGTH(27));
            make.centerX.mas_equalTo(ws).with.offset(LENGTH(10)+LENGTH(65));
            make.width.mas_equalTo(LENGTH(130));
            make.height.mas_equalTo(LENGTH(40));
        }];
        CKCT.userInteractionEnabled = YES;
        POPBookCity.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cxtz)];
        //将手势添加到需要相应的view中去
        [CKCT addGestureRecognizer:tapGesture];
        
        UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bookcity)];
        //将手势添加到需要相应的view中去
        [POPBookCity addGestureRecognizer:tapGesture1];
       
        

    }
    
   
}

- (void)addjg{
    WS(ws);
    BaseLabel * time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:[NSString stringWithFormat:@"%@答题中用时：%@",_models.bookName,_secont]];
    [backView addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->backView.mas_bottom).with.offset(LENGTH(18));
    }];
    
    CGFloat fen = 1.00*_models.correctAnswer/_models.totalAnswer*100;
    zql = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:[NSString stringWithFormat:@"共   %ld   道题 答对   %ld  道题  正确率    %.0f%%   ",_models.totalAnswer,_models.correctAnswer,fen]];
    [backView addSubview:zql];
    [zql mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(time.mas_bottom).with.offset(LENGTH(9));
    }];
}


//错题
- (void)ck{
    ChaKanCuoTiViewController * vc = [ChaKanCuoTiViewController new];
    vc.style = DTBookStyle;
    vc.bookname = _models.bookName;
    vc.cuotiarray = _cuotiarray;
    [self.nav pushViewController:vc animated:YES];
}
//书架
- (void)bookcity{
    if ([self.nav respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.nav.interactivePopGestureRecognizer.enabled = YES;
    }
    NSMutableArray *marr = [[NSMutableArray alloc]initWithArray:self.nav.viewControllers];

    for (UIViewController *vc in marr) {
        if ([vc isKindOfClass:[BookListViewController class]]) {
            [self.nav popToViewController:vc animated:YES];
            return;
        }
    }
    BookListViewController * vc = [BookListViewController new];
    [self.nav pushViewController:vc animated:YES];
}


//从新挑战

- (void)cxtz{
    if ([self.nav respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.nav.interactivePopGestureRecognizer.enabled = NO;
    }
//    leftLabel.userInteractionEnabled = YES;
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TZDTTIMU];
    NSDictionary * dic = @{@"bookid":_models.bookId,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TheTopPicModel*Topmodel = [TheTopPicModel mj_objectWithKeyValues:responseObject];
            if ([Topmodel.code isEqual:@200]) {
                
                WS(ws);
                GeneralUpView * genView = [GeneralUpView new];
                genView.style = PopUpViewStyleAnswer;
                [self.nav.view addSubview:genView];
                [genView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.mas_equalTo(ws.nav.view);
                }];
                NSString *str_minute = [NSString stringWithFormat:@"%02ld",(Topmodel.time%3600)/60];//分
                
                GenPopViewModel * m = [GenPopViewModel new];
                m.title = @"答题说明";
                NSMutableArray * arr = self->_models.badgeBooks;
                CityBadgeListModel * citymodel = [CityBadgeListModel new];
                if (arr.count>0) {
                    citymodel = arr[0];
                }else{
                    citymodel.name = @"";
                }
                m.subtitle = [NSString stringWithFormat:@"一共%ld道题\n你必须在%@分钟之内答完所有题目\n\n你准备好了吗？",Topmodel.bookProblems.count,str_minute];
                genView.model = m;
                [genView setBlock:^{
                    DTALLiewController * vc = [DTALLiewController new];
                    vc.style = DTBookStyle;
                    vc.titles = @"挑战答题";
                    vc.Topmodel = Topmodel;
                    vc.bookid = ws.models.bookId;
                    vc.bookname = ws.models.bookName;
                    vc.bookfenshu = ws.bookfenshu;
                    [self.nav pushViewController:vc animated:YES];
                }];
                
            }
        }else{
//            self->leftLabel.userInteractionEnabled = NO;
            
        }
    }];
}

- (void)setModels:(TKJIEGUOMODEL *)models{
    _models = models;
    switch (models.isPassed) {
        case DtJieGuoStyleYes:
            [self DTJGYES];
            break;
        case DtJieGuoStyleNo:
            [self DTJGNO];
            break;
            
        default:
            break;
    }
}

@end
