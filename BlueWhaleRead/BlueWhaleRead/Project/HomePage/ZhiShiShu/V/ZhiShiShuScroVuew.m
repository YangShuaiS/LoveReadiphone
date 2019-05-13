//
//  ZhiShiShuScroVuew.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuScroVuew.h"
#import "ZhiShiShuView.h"
#import "ZhiShiSHuLeftView.h"
#import "ZhiShiShuGuanXi.h"
#import "ZhiShiShiRightScroView.h"

#import "ZhiShiShuShareView.h"
#import "ArticleTopView.h"


#import "ZhiShiShuViewController.h"
#import "BuyPopPurchaseView.h"
@implementation ZhiShiShuScroVuew{
    UIImageView * backImageView;
    UIScrollView * scrollView;
    ZhiShiSHuLeftView * leftView;
    ZhiShiShuView * ZSSView;
    ZhiShiShuGuanXi * guanxi;
    BOOL Start;
    BOOL EndAni;
    ZhiShiShiRightScroView * rightscroview;
    NSInteger next;
    
    NativeView * nav;
    
    CGPoint lastpoint;
    CGRect frames;
    
    BOOL scroviewhd;//yes  zuo  no 右
    NSString * neirongid;
    
    NSInteger starex;
    NSInteger endx;
    NSTimer *timer;
    
    ArticleTopView * topView;
    ArticleScroDownView * scrodownview;
    
    ZhiShiShuModel * nmodel;

    CommentsView * comentsview;
    UIImageView * backroot;
    UIImageView * rightclick;
    BuyPopPurchaseView * PopPurchase;
}
- (void)setItemid:(NSString *)itemid{
    NSArray * array = [BaseObject TiemArray:itemid String:@","];
    if (array.count == 2) {
        _itemid = array[0];
        neirongid = array[1];
        ZSSView.neirongid = neirongid;
    }else if (array.count == 1){
        _itemid = itemid;
    }else{
        _itemid = @"5bc86e068ffaed092e4305e4";
    }
    starex = 0;
    endx = 0;
    scrodownview.itemid = _itemid;
    [self loadUpData];

}
- (void)loadUpData{
    __block ZhiShiShuScroVuew * blockSelf = self;
//    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FOUND];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSTX,JK_ZHISHITIXIXIANGQING];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"knowledge_id":_itemid};
//    NSDictionary * dic = @{@"studentid":Me.ssid,@"knowledge_id":@"5bc86e068ffaed092e4305e4"};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ZhiShiShuModel * model = [ZhiShiShuModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                NSInteger scale_screen = [UIScreen mainScreen].scale;
                NSMutableString *topimage = [[NSMutableString alloc] initWithString:model.data.bg_img];
                if (topimage.length >4) {
                    if (scale_screen == 2) {
                    }else if (scale_screen >= 3){
                        [topimage insertString:@"_3x" atIndex:topimage.length-4];
                    }
                }
                [self->backImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTXIMAGEURL,topimage]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//                    image = [BaseObject TransformtoSize:image];
//                    UIColor *backgroundColor = [UIColor colorWithPatternImage:image];
                    if ([model.data.knowledge_type isEqualToString:@"2"]) {
//                        [blockSelf setBackgroundColor:backgroundColor];
                    }else{
                        blockSelf.backgroundColor =  [BaseObject colorWithHexString:model.data.bg_part_color Alpha:[model.data.head_transparency floatValue]];
                    }
//                    [blockSelf->scrollView setBackgroundColor:backgroundColor];
                }];
                
                blockSelf->guanxi.datamodel = model.data;
                blockSelf->guanxi.backgroundColor = [BaseObject colorWithHexString:model.data.bg_part_color Alpha:[model.data.head_transparency floatValue]];
                blockSelf->nav.backgroundColor = [BaseObject colorWithHexString:model.data.bg_part_color Alpha:[model.data.head_transparency floatValue]];
                [blockSelf updataview:model];
                CGFloat leftheight = 0;
//                if (model.data.axis != nil && ![model.data.axis isKindOfClass:[NSNull class]] && model.data.axis.count != 0){

                if ([BaseObject ArratClass:model.data.axis]) {
                    blockSelf->leftView.axidataarry = model.data.axis;
                    for (ZhiShiShuTimeLineModel * m in model.data.axis) {
                        if (leftheight<m.end_y*poinw) {
                            leftheight = m.end_y*poinw;
                        }
                    }
                }

//                }

                [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(leftheight);
                }];
                blockSelf->nav.title = model.data.name;
                blockSelf->nav.titcolor = [BaseObject colorWithHexString:model.data.txt_color Alpha:1];

//                [self->nav jianbian:model.data.name Color:@[(id)RGB(242,227,185).CGColor,(id)RGB(207,186,135).CGColor,(id)RGBA(172,145,84,1).CGColor]];
            }

            [blockSelf->ZSSView layoutIfNeeded];
            [blockSelf.superview layoutIfNeeded];
//            blockSelf->rightscroview.topheight = blockSelf->guanxi.frame.size.height;
//            blockSelf->rightscroview.labelheight = blockSelf->guanxi.labelallheight;
            blockSelf->rightscroview.backcolor =[BaseObject colorWithHexString:model.data.bg_part_color Alpha:[model.data.head_transparency floatValue]];

            if ([BaseObject ArratClass:model.data.arrow]) {
                blockSelf->rightscroview.itemarray = model.data.arrow;
            }
            [blockSelf scroviewsliding:model];
            blockSelf->nmodel = model;
            if ([model.data.knowledge_type isEqualToString:@"2"]) {
                [blockSelf nowzhishiwang];
                blockSelf->scrodownview.Type = 2;
            }else{
                blockSelf->scrodownview.sfzsw = 1;
                blockSelf->scrodownview.Type = 3;
                blockSelf->nav.leftimage = @"icon_返回_粗";
                blockSelf->backroot.image = UIIMAGE(@"返回二级分类");
                blockSelf->nav.titcolor = [UIColor whiteColor];
                [blockSelf youce];
            }
            [blockSelf addshurukuang];
            blockSelf->scrodownview.ZhiShiSHUmodel = model;
            [blockSelf->scrodownview layoutIfNeeded];
            [blockSelf layoutIfNeeded];
            blockSelf->ZSSView.newheight = blockSelf->scrodownview.frame.size.height+LENGTH(20);
            
            blockSelf->rightscroview.allheight = blockSelf->ZSSView.frame.size.height+ blockSelf->scrodownview.frame.size.height;

        }else{
            
        }
    }];
}
- (void)youce{
    rightclick = [UIImageView new];
    rightclick.userInteractionEnabled = YES;
    rightclick.image = UIIMAGE(@"全部知识图-图标拷贝");
    rightclick.contentMode = UIViewContentModeScaleAspectFit;
    [nav addSubview:rightclick];
    [rightclick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->nav).with.offset(-LENGTH(16));
        make.centerY.mas_equalTo(self->nav).with.offset(StatusBar/2);
    }];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(uptableliest)];
    [rightclick addGestureRecognizer:tap];
}
#pragma mark ----------------- 输入框
- (void)addshurukuang{
    WS(ws);
    if ([nmodel.data.knowledge_type isEqualToString:@"2"]) {
        comentsview = [[CommentsView alloc] initWithBackColor:RGBA(255, 255, 255, 1) Style:CommentsStyle1 Original:1];

    }else{
        comentsview = [[CommentsView alloc] initWithBackColor:[BaseObject colorWithHexString:nmodel.data.bg_part_color Alpha:[nmodel.data.head_transparency floatValue]] Style:CommentsStyle2 Original:1];
    }
    comentsview.delegateComments = self;
    [self addSubview:comentsview];
    [comentsview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(TabBarHeight);
    }];
    comentsview.model1 =nmodel;

}
- (void)CommentsShouCang{
    [self ShouCang];
}

- (void)CommentsDianZan{
    if (nmodel !=nil) {
        if (nmodel.data.is_like == 0) {
            [self dianzan];
        }else{
            [self quxiaodainzan];
        }
    }
}
- (void)CommentsFenXiang{
    [self FenXiang];
}
- (void)CommentsPingLun{
//    [scrodownview.comlist.tableview scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
//        [scrollViews setContentOffset:CGPointMake(0, scrollViews.contentSize.height-(HEIGHT-NavHeight)) animated:YES];
    if (scrodownview.comlist.frame.size.height>=HEIGHT-NavHeight-TabBarHeight) {
        [scrollView setContentOffset:CGPointMake(0, scrollView.contentSize.height-scrodownview.comlist.frame.size.height) animated:YES];
    }else{
        [scrollView setContentOffset:CGPointMake(0, scrollView.contentSize.height-(HEIGHT - NavHeight-TabBarHeight)) animated:YES];
    }
    
}
- (void)CommentsShuRuKuang{
    CommentsShuRuKuangView * backview = [CommentsShuRuKuangView new];
    backview.itemid = _itemid;
    if ([nmodel.data.knowledge_type isEqualToString:@"2"]) {
        backview.itemid = @"14";
        backview.comment_type = 2;
    }else{
        backview.comment_type = 3;
    }
    backview.itemid = _itemid;
    backview.zhishishumodel = nmodel;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([[[UIApplication sharedApplication] delegate] window]);
    }];
    WS(ws);
    [backview setBlocks:^(PingLunModel * _Nonnull model) {
        [ws UpCommentsList:model];
    }];
}
- (void)UpCommentsList:(PingLunModel*)model{
    [nmodel.data.studentCommentList insertObject:model atIndex:0];
    scrodownview.ZhiShiSHUmodel = nmodel;
    
}

- (void)updataview:(ZhiShiShuModel*)model{

    [ZSSView layoutIfNeeded];
    [self.superview layoutIfNeeded];
    [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nav.mas_bottom).with.offset(self->guanxi.frame.size.height);
    }];


    ZSSView.nav = self.nav;
    ZSSView.scroviewheight = scrollView.frame.size.height;
    ZSSView.data = model.data;
}
- (void)nowzhishiwang{
    ZSSView.nav = self.nav;
    [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nav.mas_bottom).with.offset(self->guanxi.frame.size.height);
    }];
    ZSSView.scroviewheight = scrollView.frame.size.height;
    
    WS(ws);
    topView = [ArticleTopView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nav.mas_bottom);
        make.left.and.right.mas_equalTo(ws);
    }];
    
    topView.ZhiShiSHUmodel = nmodel;
    [topView layoutIfNeeded];
    [self.superview layoutIfNeeded];
    if (topView!=nil) {
        [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->nav.mas_bottom).with.offset(self->topView.frame.size.height);
        }];
        [guanxi mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self->topView.frame.size.height);
        }];
    }else{
        [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->nav.mas_bottom).with.offset(self->guanxi.frame.size.height);
        }];
    }
    
}

- (void)ShouCang{
    if (nmodel.data.is_collect == 0) {
        [self shoucang];
    }else{
        [self yichushooucang];
    }
}
- (void)shoucang{
    NSString * type = @"";
    if ([nmodel.data.knowledge_type isEqualToString:@"2"]) {
        type = @"2";
    }else{
        type = @"3";
    }
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_SHOUCANGZHISHITU];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"collectionid":_itemid,@"collection_type":type};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                self->nmodel.data.is_collect++;
                [self->scrodownview.share.sc ClickDianZanWithImage:@"收藏-成功" Title:[NSString stringWithFormat:@"%ld",self->nmodel.data.is_collect]];
                self->nmodel.data.is_collect = 1;
                self->comentsview.model1 = self->nmodel;
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window]  animated:YES];
                hud.label.text = @"收藏成功";
                hud.mode = MBProgressHUDModeCustomView;
                UIImage *image = [[UIImage imageNamed:@"收藏成功"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
                UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
                hud.customView = imgView;
                hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
                hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:0.8];
                //文字颜色
                hud.contentColor = [UIColor whiteColor];
                hud.animationType = MBProgressHUDAnimationFade;
                [hud hideAnimated:YES afterDelay:1];
            }
        }
    }];
}
- (void)yichushooucang{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_YICHUSHOUCANGZHISHITU];
    NSDictionary * dic = @{@"delids":_itemid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            LunBoTuXQModel * model = [LunBoTuXQModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                self->nmodel.data.is_collect--;
                [self->scrodownview.share.sc ClickDianZanWithImage:@"收藏-" Title:[NSString stringWithFormat:@"%ld",self->nmodel.data.is_collect]];
                self->nmodel.data.is_collect = 0;
                self->comentsview.model1 = self->nmodel;
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window]  animated:YES];
                hud.label.text = @"取消收藏";
                hud.mode = MBProgressHUDModeCustomView;
                UIImage *image = [[UIImage imageNamed:@"取消收藏"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
                UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
                hud.customView = imgView;
                hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
                hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:0.8];
                //文字颜色
                hud.contentColor = [UIColor whiteColor];
                hud.animationType = MBProgressHUDAnimationFade;
                [hud hideAnimated:YES afterDelay:1];
            }
        }else{
            
        }
    }];
}
- (void)FenXiang{
    WS(ws);
    ZhiShiShuShareView * views = [ZhiShiShuShareView new];
    views.model = nmodel;
    if ([nmodel.data.knowledge_type isEqualToString:@"2"]) {
        views.type = 1;
    }else{
        views.type = 2;
    }
    views.zstid = _itemid;
    [self.window addSubview:views];
    [views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.window);
    }];
}
- (void)scroviewsliding:(ZhiShiShuModel*)model{
    if (![neirongid isEqualToString:@""]) {
        for (ZhiShiShuNeiRongModel *neirong in model.data.point) {
            if ([neirong._id isEqualToString:neirongid]) {
                [scrollView setContentOffset:CGPointMake(0, neirong.y_axis*poinw-neirong.height*poinw) animated:YES];
                ZSSView.weizhi = neirong.y_axis*poinw-neirong.height*poinw;
                ZSSView.morenweizhi = @"1";
            }
        }
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        EndAni = NO;
        neirongid = @"";
        [self AddNavtion];
        [self addview];
    }
    return self;
}

#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    WS(ws);
    nav = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"" RightTitle:@"" NativeStyle:NavStyleGeneral];
    nav.backgroundColor = [UIColor clearColor];
    nav.delegate = self;
    [self addSubview:nav];
    [nav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    
    backroot = [UIImageView new];
    backroot.userInteractionEnabled = YES;
    backroot.image = UIIMAGE(@"返回二级分类-黑色");
    backroot.contentMode = UIViewContentModeScaleAspectFit;
    [nav addSubview:backroot];
    [backroot mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->nav).with.offset(LENGTH(16)+11+18);
        make.centerY.mas_equalTo(self->nav).with.offset(StatusBar/2);
    }];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backroot)];
    [backroot addGestureRecognizer:tap];
}
- (void)backroot{
    NSMutableArray *marr = [[NSMutableArray alloc]initWithArray:[self viewController].navigationController.viewControllers];
    //删除完再从新赋值，防止崩溃
    NSMutableArray * navarr = [NSMutableArray array];
    [navarr addObjectsFromArray:marr];
    for (int i = 0; i < marr.count; i++) {
        UIViewController * vc = marr[i];
        if ([vc isKindOfClass:[ZhiShiShuViewController class]]) {
            [[self viewController].navigationController popToViewController:vc animated:YES];
            return;
        }
    }
    [[self viewController].navigationController popToRootViewControllerAnimated:YES];
}
- (void)NavLeftClick{
    [self.nav popViewControllerAnimated:YES];
}
- (void)addview{
    WS(ws);
    if (@available(iOS 11.0, *)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    Start = NO;
    EndAni = NO;
    next = 1;
    scroviewhd = YES;
    
    backImageView = [UIImageView new];
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.layer.masksToBounds = YES;
    [self addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    scrollView = [UIScrollView new];
//    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.bounces = NO;
    scrollView.minimumZoomScale = 0.5;
    scrollView.maximumZoomScale = 10;
    scrollView.directionalLockEnabled=YES;//定向锁定
    scrollView.backgroundColor = [UIColor clearColor];
//    scrollView.alwaysBounceHorizontal = YES;
    [self addSubview:scrollView];

//    self.backgroundColor = [UIColor whiteColor];
//    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchScrollView)];
//    
//    [recognizer setNumberOfTapsRequired:1];
//    
//    [recognizer setNumberOfTouchesRequired:1];
//    
//    [scrollView addGestureRecognizer:recognizer];
    
    guanxi = [ZhiShiShuGuanXi new];
    [self addSubview:guanxi];
    [guanxi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(ws);
        make.top.mas_equalTo(self->nav.mas_bottom);
    }];
//    [self addSubview:nav];

    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nav.mas_bottom);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
    }];
    [self.superview layoutIfNeeded];
    
    ZSSView = [ZhiShiShuView new];
    ZSSView.lastview = self;
    [scrollView addSubview:ZSSView];
    [ZSSView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView).with.offset(0);
        make.left.and.right.and.bottom.mas_equalTo(self->scrollView);
    }];
    [ZSSView setBlock:^(CGRect frame) {
        [ws block:frame];
    }];
    
    leftView = [ZhiShiSHuLeftView new];
    leftView.layer.cornerRadius = LENGTH(10);
    [scrollView addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->ZSSView.mas_top);
//        make.bottom.mas_equalTo(self->scrollView);
        make.left.mas_equalTo(self->scrollView).with.offset(-LENGTH(29));
        make.width.mas_equalTo(LENGTH(30));
        make.height.mas_equalTo(LENGTH(1));

    }];
    
    [self addSubview:nav];

    rightscroview = [ZhiShiShiRightScroView new];
    [self addSubview:rightscroview];
    [rightscroview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(WIDTH/2);
        make.top.mas_equalTo(self->scrollView);
        make.bottom.mas_equalTo(ws);
        make.width.mas_equalTo(WIDTH/2);
    }];
    rightscroview.tag = 100;
//    rightscroview.userInteractionEnabled = NO;
    __block ZhiShiShuScroVuew * blockSelf = self;
    [rightscroview setBlocks:^(CGFloat scroy) {
        blockSelf->scroviewhd = NO;
        blockSelf->guanxi.labelheight = scroy;
        [blockSelf->scrollView setContentOffset:CGPointMake(blockSelf->scrollView.contentOffset.x, scroy) animated:NO];
        [blockSelf->guanxi layoutIfNeeded];
        [blockSelf->scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(blockSelf->nav.mas_bottom).with.offset(blockSelf->guanxi.frame.size.height);
        }];
        [blockSelf animalbegin];
    }];
    [rightscroview setBlockss:^{
        [blockSelf endanimal];
    }];

    
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]init];
    panGesture.delegate = self;
    [panGesture addTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:panGesture];
    
    scrodownview = [ArticleScroDownView new];
    [scrollView addSubview:scrodownview];
    [scrodownview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(20));
        make.left.and.right.mas_equalTo(ws);
    }];
    scrodownview.sharetype = @"14";
    scrodownview.delegateArticleScroTop = self;

}

-(void)pan:(UIPanGestureRecognizer *)pan{
    if ([nmodel.data.knowledge_type isEqualToString:@"1"]) {
        if (pan.state == UIGestureRecognizerStateBegan) {
            starex = [pan locationInView:self].x;
        }
        if (pan.state == UIGestureRecognizerStateChanged) {
            endx = [pan locationInView:self].x;
            WS(ws);
            if (rightscroview.tag == 100) {
                if (starex-endx>=LENGTH(50)) {
                    rightscroview.tag = 101;
                    [UIView animateWithDuration:0.5 animations:^{
                        [self->rightscroview mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.right.mas_equalTo(ws);
                        }];
                        [self->comentsview mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.bottom.mas_equalTo(ws).with.offset(TabBarHeight);
                        }];
                        [ws.superview layoutIfNeeded];
                    } completion:^(BOOL finished) {
                        
                    }];

                    EndAni = YES;
                }
            }
            if (rightscroview.tag == 101) {
                if (endx-starex>=LENGTH(50)) {
                    rightscroview.tag = 100;
                    [UIView animateWithDuration:0.5 animations:^{
                        [self->rightscroview mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.right.mas_equalTo(ws).with.offset(WIDTH/2);
                        }];
                        [self->comentsview mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.bottom.mas_equalTo(ws);
                        }];
                        [ws.superview layoutIfNeeded];
                    } completion:^(BOOL finished) {
                        
                    }];
                    
                    EndAni = NO;
                }
            }
        }
    } 
}
- (void)block:(CGRect )frame{
    [self.superview layoutIfNeeded];
    frames = frame;
    frames.origin.y = frames.origin.y + NavHeight + guanxi.frame.size.height;
    self.block(self->frames);
}
//- (void)oneButton{
//    next++;
//    [ZSSView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(WIDTH*self->next);
//    }];
//    if (next>1) {
//        leftview.hidden = NO;
//    }else{
//        leftview.hidden = YES;
//    }
//}
//- (void)twoButton{
//    next--;
//    [ZSSView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(WIDTH*self->next);
//    }];
//    if (next>1) {
//        leftview.hidden = NO;
//    }else{
//        leftview.hidden = YES;
//    }
//}
- (void)animalbegin{
    WS(ws);
    if (Start == NO) {
        Start = YES;
        
        __block ZhiShiShuScroVuew * blockSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            [blockSelf->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(blockSelf->scrollView);
            }];
            [blockSelf.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }
    
    if (EndAni == NO && rightscroview.tag == 100) {
        EndAni = YES;

    }
}
- (void)endanimal{
    if (timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(jieshu) userInfo:nil repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    }
    

}

- (void)jieshu{
    __block ZhiShiShuScroVuew * blockSelf = self;
    if (blockSelf->Start == YES) {
        blockSelf->Start = NO;
        
        [UIView animateWithDuration:0.5 animations:^{
            [blockSelf->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(blockSelf->scrollView).with.offset(-LENGTH(29));
            }];

            [blockSelf.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    WS(ws);
    scroviewhd = YES;
    if (Start == NO) {
        Start = YES;
        __block ZhiShiShuScroVuew * blockSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            [blockSelf->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(scrollView);
            }];

            [blockSelf.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }
    
    if (EndAni == NO && rightscroview.tag == 100) {
        EndAni = YES;
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (timer!=nil) {
        [timer invalidate];
        timer = nil;
    }
    leftView.sizefloat = scrollView.contentOffset.y;
    leftView.neirongheight = scrollView.frame.size.height;
//    NSLog(@"%f",scrollView.contentOffset.y);
    ZSSView.sizey = scrollView.contentOffset.y;
    if (scroviewhd == YES) {
        guanxi.labelheight = scrollView.contentOffset.y;
        [guanxi layoutIfNeeded];
        [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->nav.mas_bottom).with.offset(self->guanxi.frame.size.height);
        }];
        rightscroview.scroy = scrollView.contentOffset.y;
    }
    if (lastpoint.x+10 <scrollView.contentOffset.x||lastpoint.x-10>scrollView.contentOffset.x) {
        lastpoint = scrollView.contentOffset;
    }
    
    if ([nmodel.data.knowledge_type isEqualToString:@"1"]) {
        if (Me.is_member == 0) {
            if (scrollView.contentOffset.y>(ZSSView.frame.size.height-ZSSView.newheight-LENGTH(50))/3.0) {
                [scrollView setContentOffset:CGPointMake(0, (ZSSView.frame.size.height-ZSSView.newheight-LENGTH(50))/3.0) animated:NO];
                if (PopPurchase == nil) {
                    PopPurchase = [BuyPopPurchaseView new];
                    PopPurchase.nav = [self viewController].navigationController;
                    [[self viewController].view addSubview:PopPurchase];
                    [PopPurchase mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.edges.mas_equalTo([self viewController].view);
                    }];
                    [PopPurchase setRemove:^{
                        self->PopPurchase = nil;
                    }];
                }
                
                
            }
        }

    }
//    [ scrollView setContentOffset:scrollView.contentOffset animated:YES];//关闭动画效果

//    [guanxi mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->scrollView.mas_top).with.offset(-scrollView.contentOffset.y);
//    }];
    
//    if (scrollView.contentOffset.y>=scrollView.contentSize.height-HEIGHT-HEIGHT/2) {
//        [ZSSView huadong];
//    }

}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    guanxi.labelheight = scrollView.contentOffset.y;
    [guanxi layoutIfNeeded];
    [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nav.mas_bottom).with.offset(self->guanxi.frame.size.height);
    }];
//    leftView.sizefloat = scrollView.contentOffset.y;
//    leftView.neirongheight = scrollView.frame.size.height;

    [self endanimal];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    guanxi.labelheight = scrollView.contentOffset.y;
    [guanxi layoutIfNeeded];
    [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nav.mas_bottom).with.offset(self->guanxi.frame.size.height);
    }];
//    leftView.sizefloat = scrollView.contentOffset.y;
//    leftView.neirongheight = scrollView.frame.size.height;

    [self endanimal];
}
#define mark ---------------- 放大
//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
//    return ZSSView;
//}
//- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
//
//    CGRect frame = ZSSView.frame;
//
//    frame.origin.y = (scrollView.frame.size.height - ZSSView.frame.size.height) > 0 ? (scrollView.frame.size.height - ZSSView.frame.size.height) * 0.5 : 0;
//    frame.origin.x = (scrollView.frame.size.width - ZSSView.frame.size.width) > 0 ? (scrollView.frame.size.width - ZSSView.frame.size.width) * 0.5 : 0;
//    ZSSView.frame = frame;
//
//    scrollView.contentSize = CGSizeMake(ZSSView.frame.size.width + 30, ZSSView.frame.size.height + 30);
//}
- (void)layoutSubviews{
    [super layoutSubviews];
    leftView.sizefloat = scrollView.contentOffset.y;
    leftView.neirongheight = scrollView.frame.size.height;

}


//
//- (void)touchScrollView{
//    NSLog(@"被点击了");
//}
#pragma mark - 下拉刷新
- (void)headRefresh{
//    [self LoadData];
}

#pragma mark ----- 显示tableview
- (void)uptableliest{
    WS(ws);
    if (rightscroview.tag == 100) {
        rightscroview.tag = 101;
        [UIView animateWithDuration:0.5 animations:^{
            [self->rightscroview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws);
            }];
            [self->comentsview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(ws).with.offset(TabBarHeight);
            }];
            [ws.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
        EndAni = YES;

    }else{
        rightscroview.tag = 100;
        [UIView animateWithDuration:0.5 animations:^{
            [self->rightscroview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws).with.offset(WIDTH/2);
            }];
            [self->comentsview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(ws);
            }];
            [ws.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
        EndAni = NO;
    }


}
#pragma mark -------------- 分享视图

- (void)ArticleScroTopViewShouCang{
//    [self ShouCang];
    comentsview.model1 = self->nmodel;
}
- (void)ArticleScroTopViewDianZan{
    comentsview.model1 = self->nmodel;
}



#pragma mark ------------------- f点赞
- (void)dianzan{
    NSString * type = @"";
    if ([nmodel.data.knowledge_type isEqualToString:@"2"]) {
        type = @"2";
    }else{
        type = @"3";
    }
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ADDDIANZAN];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"likeid":_itemid,@"like_type":type};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                self->nmodel.data.is_like = 1;
                self->nmodel.data.like_num ++;
                [self->scrodownview.share.dz ClickDianZanWithImage:@"点赞-成功" Title:[NSString stringWithFormat:@"%ld",self->nmodel.data.like_num]];
                self->comentsview.model1 = self->nmodel;
            }
        }
    }];
}

- (void)quxiaodainzan{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_REMODIANZAN];
    NSDictionary * dic = @{@"delid":_itemid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        LunBoTuXQModel * model = [LunBoTuXQModel mj_objectWithKeyValues:responseObject];
        if ([model.code isEqual:@200]) {
            self->nmodel.data.is_like = 0;
            self->nmodel.data.like_num --;
            [self->scrodownview.share.dz ClickDianZanWithImage:@"点赞" Title:[NSString stringWithFormat:@"%ld",self->nmodel.data.like_num]];
            self->comentsview.model1 = self->nmodel;
        }
    }];
}

@end
