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
#import "ZhiShiShuTDListView.h"
#import "ZhiShiShiRightScroView.h"

#import "ZhiShiShuShareView.h"
#import "ArticleTopView.h"
#import "ArticleScroDownView.h"

@implementation ZhiShiShuScroVuew{
    UIScrollView * scrollView;
    ZhiShiSHuLeftView * leftView;
    ZhiShiShuView * ZSSView;
    ZhiShiShuGuanXi * guanxi;
    BOOL Start;
    BOOL EndAni;
    ZhiShiShuTDListView * tableilistclick;
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
    NSTimer *timer1;
    
    ArticleTopView * topView;
    ArticleScroDownView * scrodownview;
    
    FLAnimatedImageView * ShouCang;
    ZhiShiShuModel * nmodel;

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
                FLAnimatedImageView * imageview = [FLAnimatedImageView new];
                NSInteger scale_screen = [UIScreen mainScreen].scale;
                NSMutableString *topimage = [[NSMutableString alloc] initWithString:model.data.bg_img];
                if (topimage.length >4) {
                    if (scale_screen == 2) {
                    }else if (scale_screen >= 3){
                        [topimage insertString:@"_3x" atIndex:topimage.length-4];
                    }
                }
                [imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTX,topimage]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                    UIColor *backgroundColor = [UIColor colorWithPatternImage:image];
                    [blockSelf setBackgroundColor:backgroundColor];
                    [blockSelf->scrollView setBackgroundColor:backgroundColor];
                }];
                
                blockSelf->guanxi.datamodel = model.data;
                [blockSelf updataview:model];
                blockSelf->leftView.axidataarry = model.data.axis;
                CGFloat leftheight = 0;
                for (ZhiShiShuTimeLineModel * m in model.data.axis) {
                    if (leftheight<m.end_y*poinw) {
                        leftheight = m.end_y*poinw;
                    }
                }
                [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(leftheight);
                }];
                blockSelf->nav.title = model.data.name;
                blockSelf->nav.titcolor = [BaseObject colorWithHexString:model.data.txt_color Alpha:1];

//                [self->nav jianbian:model.data.name Color:@[(id)RGB(242,227,185).CGColor,(id)RGB(207,186,135).CGColor,(id)RGBA(172,145,84,1).CGColor]];
            }

            [blockSelf->ZSSView layoutIfNeeded];
            [blockSelf.superview layoutIfNeeded];
            blockSelf->rightscroview.topheight = blockSelf->guanxi.frame.size.height;
            blockSelf->rightscroview.labelheight = blockSelf->guanxi.labelallheight;
            blockSelf->rightscroview.itemarray = model.data.arrow;
            blockSelf->rightscroview.allheight = blockSelf->ZSSView.frame.size.height+blockSelf->guanxi.frame.size.height;
            [blockSelf scroviewsliding:model];
            blockSelf->nmodel = model;
            if ([model.data.knowledge_type isEqualToString:@"2"]) {
                [blockSelf nowzhishiwang];
            }
        }else{
            
        }
    }];
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
    
    FLAnimatedImageView * sharefriend = [FLAnimatedImageView new];
    sharefriend.image = UIIMAGE(@"组 928");
    sharefriend.contentMode = UIViewContentModeScaleAspectFit;
    [nav addSubview:sharefriend];
    [sharefriend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nav.mas_top).with.offset(StatusBar+10);
        make.right.mas_equalTo(self->nav.mas_right).with.offset(-20);
        //        make.size.mas_equalTo(sharefriend.image.size);
        make.width.and.height.mas_equalTo(24);
    }];
    sharefriend.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(FenXiang)];
    [sharefriend addGestureRecognizer:tap];
    
    ShouCang = [FLAnimatedImageView new];
    if (nmodel.data.is_collect == 0) {
        ShouCang.image = UIIMAGE(@"收藏0");
    }else{
        ShouCang.image = UIIMAGE(@"收藏");
    }
    ShouCang.contentMode = UIViewContentModeScaleAspectFit;
    [nav addSubview:ShouCang];
    [ShouCang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->nav.mas_right).with.offset(-20-24-10);
        make.top.mas_equalTo(self->nav.mas_top).with.offset(StatusBar+10);
        make.width.and.height.mas_equalTo(24);
    }];
    ShouCang.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ShouCang)];
    [ShouCang addGestureRecognizer:tap1];
    
    tableilistclick.style = 2;
    
    WS(ws);
    topView = [ArticleTopView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nav.mas_bottom);
        make.left.and.right.mas_equalTo(ws);
    }];
    
    
    scrodownview = [ArticleScroDownView new];
    [scrollView addSubview:scrodownview];
    [scrodownview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(20));
        make.left.and.right.mas_equalTo(ws);
    }];
    topView.ZhiShiSHUmodel = nmodel;
    scrodownview.ZhiShiSHUmodel = nmodel;
    [topView layoutIfNeeded];
    [scrodownview layoutIfNeeded];
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
    ZSSView.newheight = scrodownview.frame.size.height+LENGTH(20);
}
- (void)ShouCang{
    if (nmodel.data.is_collect == 0) {
        [self shoucang];
    }else{
        [self yichushooucang];
    }
}
- (void)shoucang{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_SHOUCANGZHISHITU];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"collectionid":_itemid,@"collection_type":@"2"};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                self->ShouCang.image = UIIMAGE(@"收藏");
                self->nmodel.data.is_collect = 1;
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
                self->ShouCang.image = UIIMAGE(@"收藏0");
                self->nmodel.data.is_collect = 0;
            }
        }else{
            
        }
    }];
}
- (void)FenXiang{
    WS(ws);
    ZhiShiShuShareView * views = [ZhiShiShuShareView new];
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
    scrollView = [UIScrollView new];
//    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.bounces = NO;
    scrollView.minimumZoomScale = 0.5;
    scrollView.maximumZoomScale = 10;
    scrollView.directionalLockEnabled=YES;//定向锁定
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
        make.top.mas_equalTo(ws);
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

    
    tableilistclick = [ZhiShiShuTDListView new];
    [self addSubview:tableilistclick];
    [tableilistclick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->rightscroview.mas_left);
        make.width.mas_equalTo(LENGTH(120));
        make.bottom.mas_equalTo(ws).with.offset(-TabBarHeight-LENGTH(14));
    }];
    __block ZhiShiShuScroVuew * blockself = self;
    [tableilistclick setBlock:^{
        [blockself uptableliest];
    }];
    
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]init];
    panGesture.delegate = self;
    [panGesture addTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:panGesture];

}
-(void)pan:(UIPanGestureRecognizer *)pan{
    if (tableilistclick.style!=2) {
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
                        [ws.superview layoutIfNeeded];
                    } completion:^(BOOL finished) {
                        
                    }];

                    EndAni = YES;
                    __block ZhiShiShuScroVuew * blockSelf = self;
                    [UIView animateWithDuration:0.5 animations:^{
                        [blockSelf->tableilistclick mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.width.mas_equalTo(LENGTH(28));
                        }];
                        [blockSelf.superview layoutIfNeeded];
                    } completion:^(BOOL finished) {
                        
                    }];
                }
            }
            if (rightscroview.tag == 101) {
                if (endx-starex>=LENGTH(50)) {
                    rightscroview.tag = 100;
                    [UIView animateWithDuration:0.5 animations:^{
                        [self->rightscroview mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.right.mas_equalTo(ws).with.offset(WIDTH/2);
                        }];
                        [ws.superview layoutIfNeeded];
                    } completion:^(BOOL finished) {
                        
                    }];
                    
                    EndAni = NO;
                    __block ZhiShiShuScroVuew * blockSelf = self;
                    [UIView animateWithDuration:0.5 animations:^{
                        [blockSelf->tableilistclick mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.width.mas_equalTo(LENGTH(100));
                        }];
                        [blockSelf.superview layoutIfNeeded];
                    } completion:^(BOOL finished) {
                        
                    }];
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
        __block ZhiShiShuScroVuew * blockSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            [blockSelf->tableilistclick mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(LENGTH(28));
            }];
            [blockSelf.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }
}
- (void)endanimal{
    if (timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(jieshu) userInfo:nil repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    }
    
    if (timer1 == nil) {
        timer1 = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(jieshuclick) userInfo:nil repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:timer1 forMode:UITrackingRunLoopMode];
    }
}
- (void)jieshuclick{
    WS(ws);
    __block ZhiShiShuScroVuew * blockSelf = self;
    if (blockSelf->EndAni == YES && rightscroview.tag == 100) {
        blockSelf->EndAni = NO;
    [UIView animateWithDuration:0.5 animations:^{
        [blockSelf->tableilistclick mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LENGTH(120));
        }];
        [blockSelf.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
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
        __block ZhiShiShuScroVuew * blockSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            [blockSelf->tableilistclick mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(LENGTH(28));
            }];
            [blockSelf.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (timer!=nil) {
        [timer invalidate];
        timer = nil;
        [timer1 invalidate];
        timer1 = nil;
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
//    [ scrollView setContentOffset:scrollView.contentOffset animated:YES];//关闭动画效果

//    [guanxi mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->scrollView.mas_top).with.offset(-scrollView.contentOffset.y);
//    }];
    
    if (scrollView.contentOffset.y>=scrollView.contentSize.height-HEIGHT-HEIGHT/2) {
        [ZSSView huadong];
    }

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
            [ws.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
        EndAni = YES;
        __block ZhiShiShuScroVuew * blockSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            [blockSelf->tableilistclick mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(LENGTH(28));
            }];
            [blockSelf.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }else{
        rightscroview.tag = 100;
        [UIView animateWithDuration:0.5 animations:^{
            [self->rightscroview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws).with.offset(WIDTH/2);
            }];
            [ws.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
        EndAni = NO;
        __block ZhiShiShuScroVuew * blockSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            [blockSelf->tableilistclick mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(LENGTH(120));
            }];
            [blockSelf.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }


}

@end
