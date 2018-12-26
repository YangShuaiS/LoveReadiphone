//
//  ZhiShiShuXQView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuXQView.h"
#import "MyPageControl.h"
@implementation ZhiShiShuXQView{
    BaseView * backview;
    CAGradientLayer *gradient;
    MyPageControl * pageControl;
    ZhiShiShuXQScroview * scroview ;
    BaseLabel * nrtitle;
    
    
    NSMutableArray * titarray;
    ZhiShiShuXqModel * model;
}
- (void)setItemid:(NSString *)itemid{
    _itemid = itemid;
    [self loadUpData];
    
}
- (void)loadUpData{
    //    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FOUND];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSTX,JK_ZHISHITIXIXQ];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"knowledge_point_id":_itemid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            self->model = [ZhiShiShuXqModel mj_objectWithKeyValues:responseObject];
            NSMutableArray * dataarra = responseObject[@"data"];
            NSMutableArray * newarray = [NSMutableArray array];
            if ([self->model.code isEqual:@200]) {
                self->titarray = [NSMutableArray array];
                for (NSDictionary * dic in dataarra) {
                    if ([dic[@"style_id"] isEqualToString:@"1"]) {
                        ZhiShiShuXqStyle1Model *models = [ZhiShiShuXqStyle1Model mj_objectWithKeyValues:dic];
                        [self->titarray addObject:models.name];
                        [newarray addObject:models];
                    }
                    if ([dic[@"style_id"] isEqualToString:@"2"]) {
                        ZhiShiShuXqStyle2Model * models = [ZhiShiShuXqStyle2Model mj_objectWithKeyValues:dic];
                        [self->titarray addObject:models.name];
                        [newarray addObject:models];
                    }
                }
                self->model.data = newarray;
                [self upview];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
            else{
                [self removeFromSuperview];
            }
        }else{
            [self removeFromSuperview];
        }
    }];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        [self loadUpData];
        [self addview];
//        titarray = @[@"行走",@"阅读",@"简介",@"故事"];
    }
    return self;
}

- (void)addview{
    self.backgroundColor = RGBA(0, 0, 0, 0.7);
    WS(ws);
    
        scroview = [ZhiShiShuXQScroview new];
        [self addSubview:scroview];
        [scroview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws);
        }];
    __weak typeof(self) weakSelf = self;
    [scroview setBlock:^(NSInteger page) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf->pageControl setCurrentPage:page];

    }];
    
        pageControl = [MyPageControl new];
        pageControl.backgroundColor = [UIColor clearColor];
        pageControl.tintColor = RGB(85,220,201);
        pageControl.pageIndicatorTintColor = RGBA(255,255,255,0.7);
        pageControl.currentPageIndicatorTintColor= RGB(85,220,201);
        [pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:pageControl];
        [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws);
            make.right.mas_equalTo(ws);
//            make.top.mas_equalTo(ws.mas_bottom).with.offset(-LENGTH(28));
            make.bottom.mas_equalTo(ws).with.offset(-LENGTH(70));
            make.height.mas_equalTo(8);
        }];
    
        FLAnimatedImageView * qximage = [FLAnimatedImageView new];
        qximage.image = UIIMAGE(@"叉掉");
        [self addSubview:qximage];
        [qximage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.mas_equalTo(LENGTH(35));
            make.centerX.mas_equalTo(ws);
            make.top.mas_equalTo(self->pageControl.mas_bottom).with.offset(LENGTH(20));
        }];
        qximage.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneButton)];
        [qximage addGestureRecognizer:tap];
}

- (void)upview{
        pageControl.numberOfPages = model.data.count;
        scroview.itemarray = model.data;
        nrtitle.text = titarray[0];
}

- (void)pageTurn:(UIPageControl*)sender
{
    scroview.page = sender.currentPage;
}


- (void)setNav:(UINavigationController *)nav{
    scroview.nav = nav;
}

- (void)oneButton{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.superview removeFromSuperview];
        [self->scroview removeFromSuperview];

    }];
}


//- (void)addview{
//    self.backgroundColor = RGBA(0, 0, 0, 0.7);
//    WS(ws);
//    backview = [BaseView new];
//    backview.layer.masksToBounds = YES;
//    backview.layer.cornerRadius = LENGTH(43);
//    [self addSubview:backview];
//    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(ws);
//        make.width.mas_equalTo(LENGTH(327));
//        make.height.mas_equalTo(LENGTH(472));
//    }];
//    gradient = [CAGradientLayer layer];
//    [backview.layer addSublayer:gradient];
//
//    scroview = [ZhiShiShuXQScroview new];
//    [backview addSubview:scroview];
//    [scroview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self->backview).with.insets(UIEdgeInsetsMake(LENGTH(5), LENGTH(5), LENGTH(5), LENGTH(5)));
//    }];
//
//    FLAnimatedImageView * titleview = [FLAnimatedImageView new];
//    titleview.image = UIIMAGE(@"title");
//    [self addSubview:titleview];
//    [titleview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self->backview);
//        make.top.mas_equalTo(self->backview.mas_top).with.offset(-LENGTH(19));
//        make.width.mas_equalTo(LENGTH(137));
//        make.height.mas_equalTo(LENGTH(38));
//    }];
//
//    nrtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor whiteColor] LabelFont:[UIFont fontWithName:@"HYk1gj" size:FontSize(LENGTH(25))] TextAlignment:NSTextAlignmentCenter Text:titarray[0]];
//    [titleview addSubview:nrtitle];
//    [nrtitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(titleview).with.insets(UIEdgeInsetsMake(LENGTH(3), LENGTH(3), LENGTH(3), LENGTH(3)));
//    }];
//
//    pageControl = [MyPageControl new];
//    pageControl.backgroundColor = [UIColor clearColor];
//    pageControl.tintColor = RGB(85,220,201);
//    pageControl.pageIndicatorTintColor = RGBA(255,255,255,0.7);
//    pageControl.currentPageIndicatorTintColor= RGB(85,220,201);
//    [pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
//    [self addSubview:pageControl];
//    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(ws);
//        make.right.mas_equalTo(ws);
//        make.top.mas_equalTo(self->scroview.mas_bottom).with.offset(LENGTH(18));
////        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(70));
//        make.height.mas_equalTo(8);
//    }];
//    __weak typeof(self) weakSelf = self;
//    [scroview setBlock:^(NSInteger page) {
//        __strong typeof(weakSelf) strongSelf = weakSelf;
//        [strongSelf->pageControl setCurrentPage:page];
//        [UIView animateWithDuration:0.5 animations:^{
//            strongSelf->nrtitle.alpha = 0;
//            strongSelf->nrtitle.text = strongSelf->titarray[page];
//            strongSelf->nrtitle.alpha = 1;
//        }];
//    }];
////    scroview.pageControl = pageControl;
//
//    FLAnimatedImageView * qximage = [FLAnimatedImageView new];
//    qximage.image = UIIMAGE(@"叉掉");
//    [self addSubview:qximage];
//    [qximage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.and.height.mas_equalTo(LENGTH(35));
//        make.centerX.mas_equalTo(ws);
//        make.top.mas_equalTo(self->pageControl.mas_bottom).with.offset(LENGTH(20));
//    }];
//    qximage.userInteractionEnabled = YES;
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneButton)];
//    [qximage addGestureRecognizer:tap];
//
//}
//- (void)upview{
//    pageControl.numberOfPages = model.data.count;
//    scroview.itemarray = model.data;
//    nrtitle.text = titarray[0];
//}
//- (void)oneButton{
//    [UIView animateWithDuration:0.5 animations:^{
//        self.alpha = 0;
//    } completion:^(BOOL finished) {
//        [self removeFromSuperview];
//        [self.superview removeFromSuperview];
//        [self->scroview removeFromSuperview];
//
//    }];
//}
//- (void)layoutSubviews{
//    [super layoutSubviews];
//    gradient.frame = backview.bounds;
//    gradient.colors = [NSArray arrayWithObjects:
//                       (id)[BaseObject colorWithHexString:@"#6ce5cd"].CGColor,
//                       (id)[BaseObject colorWithHexString:@"#41d4c6"].CGColor,nil];
//    gradient.startPoint = CGPointMake(0, 0.5);
//    gradient.endPoint = CGPointMake(1, 0.5);
//    gradient.locations = @[@0.0, @1];
//}
//
//- (void)pageTurn:(UIPageControl*)sender
//{
//    scroview.page = sender.currentPage;
//}
//- (void)pageControlClicked{
//
//}
//- (void)setNav:(UINavigationController *)nav{
//    scroview.nav = nav;
//}
@end
