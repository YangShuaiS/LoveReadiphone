//
//  ArticleViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ArticleViewController.h"
#import "ArticleTopView.h"
#import "ArticleScroTopView.h"
#import "ArticleScroDownView.h"
#import "FenXiangView.h"
#import "CommentsView.h"
#import "CommentsShuRuKuangView.h"
@interface ArticleViewController ()<NavDelegate,UIScrollViewDelegate,UITableViewDelegate,CommentsViewDelegate,ArticleScroTopViewViewDelegate>

@end

@implementation ArticleViewController{
    
    ArticleTopView * topView;
    UIScrollView * scrollViews;
    ArticleScroTopView * scrotopview;
    ArticleScroDownView * scrodownview;
    
    LunBoTuXQModel *nmodel;
    CommentsView * comentsview;

}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.titcolor = RGB(0, 0, 0);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.downlayer = YES;
}

- (void)NavLeftClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}

- (void)FenXiang{
    FenXiangView * fenxiangs = [FenXiangView new];
    fenxiangs.atype = @"1";
    fenxiangs.vc = self;
    fenxiangs.imageurl = [NSString stringWithFormat:@"%@%@",IMAGEURL,nmodel.banner.banner_img];
    fenxiangs.wzbt = nmodel.banner.title;
    fenxiangs.textid = _itemid;
    fenxiangs.bookname = nmodel.banner.title;
    fenxiangs.sharestyle = ShareStyleTag9;
    [self.view addSubview:fenxiangs];
    WS(ws);
    [fenxiangs mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    [fenxiangs setBlock:^(FenXiangModel *model, ShareStyle sharestyle) {
//        [self addhabai:model Style:sharestyle];
    }];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(238,238,238);
    [self AddNavtion];
    [self loadupview];
    WS(ws);
    topView = [ArticleTopView new];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom);
        make.left.and.right.mas_equalTo(ws.view);
    }];
    topView.alpha = 0;
    
    scrollViews = [UIScrollView new];
    scrollViews.delegate = self;
    scrollViews.bounces = NO;
    [self.view addSubview:scrollViews];
    [scrollViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    scrotopview = [ArticleScroTopView new];
    [scrollViews addSubview:scrotopview];
    [scrotopview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollViews);
        make.left.and.right.mas_equalTo(ws.view);
    }];
    
    scrodownview = [ArticleScroDownView new];
    scrodownview.itemid = _itemid;
    [scrollViews addSubview:scrodownview];
    [scrodownview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrotopview.mas_bottom);
        make.left.and.right.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(self->scrollViews);
    }];
    scrodownview.sharetype = @"9";
    scrodownview.Type = 1;
    scrodownview.delegateArticleScroTop = self;

    
    [self.view addSubview:topView];
    topView.layer.shadowColor = RGB(0, 0, 0).CGColor;
    topView.layer.shadowOffset = CGSizeMake(0,LENGTH(9));//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    topView.layer.shadowRadius = LENGTH(7);
    topView.layer.shadowOpacity = 0.05;
    
    scrodownview.comlist.tableview.delegate = self;

    

}

- (void)loadupview{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_LBTXQ];
    NSDictionary * dic = @{@"bannerid":_itemid,@"studentid":Me.ssid};
//    NSDictionary * dic = @{@"bannerid":@"97",@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            LunBoTuXQModel * model = [LunBoTuXQModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self updata:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}
- (void)updata:(LunBoTuXQModel *)model{
//    self.navtive.title = model.banner.title;
    nmodel = model;
    self.navtive.title = @"";
    topView.model = model;
    scrodownview.model = model;

    scrotopview.model = model;
    
    if ([model.banner.is_share isEqualToString:@"0"]) {
        comentsview = [[CommentsView alloc] initWithBackColor:RGBA(255, 255, 255, 1) Style:CommentsStyle1 Original:0];
    }else{
        comentsview = [[CommentsView alloc] initWithBackColor:RGBA(255, 255, 255, 1) Style:CommentsStyle1 Original:1];
    }
    comentsview.delegateComments = self;
    [self.view addSubview:comentsview];
    WS(ws);
    [comentsview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.mas_equalTo(ws.view);
        make.height.mas_equalTo(TabBarHeight);
    }];
    comentsview.model = model;

}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == scrollViews) {

    if (scrollView.contentOffset.y > scrotopview.sizeheight) {
        if (topView.alpha == 0) {
            topView.alpha = 1;
        }
    }else{
        if (topView.alpha == 1) {
            topView.alpha = 0;
        }
    }
    
    if (scrollView.contentOffset.y > scrotopview.titleheight) {
        if ([self.navtive.title isEqualToString:@""]) {
            self.navtive.title = scrotopview.model.banner.title;
        }
    }else{
        if ([self.navtive.title isEqualToString:scrotopview.model.banner.title]) {
            self.navtive.title = @"";
        }
    }
    }
    
    if (scrollView == scrodownview.comlist.tableview) {
//        NSLog(@"%f",scrollView.contentOffset.y);
    }
}

- (void)CommentsShouCang{
    if (nmodel.is_collect == 0) {
        [self shoucang];
    }else{
        [self yichushooucang];
    }
}
- (void)shoucang{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_SHOUCANGZHISHITU];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"collectionid":_itemid,@"collection_type":@"1"};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                self->nmodel.collection_num++;
                [self->scrodownview.share.sc ClickDianZanWithImage:@"收藏-成功" Title:[NSString stringWithFormat:@"%ld",self->nmodel.collection_num]];
                self->nmodel.is_collect = 1;
                self->comentsview.model = self->nmodel;
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
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_YICHUSHOUCANGZHISHITU];
    NSDictionary * dic = @{@"delids":_itemid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            LunBoTuXQModel * model = [LunBoTuXQModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                self->nmodel.collection_num--;
                [self->scrodownview.share.sc ClickDianZanWithImage:@"收藏-" Title:[NSString stringWithFormat:@"%ld",self->nmodel.collection_num]];
                self->nmodel.is_collect = 0;
                self->comentsview.model = self->nmodel;
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

- (void)CommentsDianZan{
    if (nmodel !=nil) {
        if (nmodel.is_like == 0) {
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
    if (scrodownview.comlist.frame.size.height>=HEIGHT-NavHeight) {
            [scrollViews setContentOffset:CGPointMake(0, scrollViews.contentSize.height-scrodownview.comlist.frame.size.height) animated:YES];
    }else{
            [scrollViews setContentOffset:CGPointMake(0, scrollViews.contentSize.height-(HEIGHT - NavHeight)) animated:YES];
    }
}
- (void)CommentsShuRuKuang{
    WS(ws);
    CommentsShuRuKuangView * backview = [CommentsShuRuKuangView new];
    if ([nmodel.banner.is_share isEqualToString:@"0"]) {
        backview.sfShare = 1;
    }else{
        
    }
    backview.nmodel = nmodel;
    backview.comment_type = 1;
    backview.itemid = _itemid;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo([[[UIApplication sharedApplication] delegate] window]);
    }];
    [backview setBlocks:^(PingLunModel * _Nonnull model) {
        [ws UpCommentsList:model];
    }];
}

- (void)UpCommentsList:(PingLunModel*)model{
    [nmodel.studentCommentList insertObject:model atIndex:0];
    scrodownview.model = nmodel;

}
#pragma mark ---------- ArticleShareViewDele
- (void)ArticleScroTopViewShouCang{
    self->comentsview.model = self->nmodel;
}
- (void)ArticleScroTopViewDianZan{
    self->comentsview.model = self->nmodel;
}




#pragma mark ------------------- f点赞
- (void)dianzan{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ADDDIANZAN];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"likeid":_itemid,@"like_type":@"1"};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                self->nmodel.is_like = 1;
                self->nmodel.like_num ++;
                [self->scrodownview.share.dz ClickDianZanWithImage:@"点赞-成功" Title:[NSString stringWithFormat:@"%ld",self->nmodel.like_num]];
                self->comentsview.model = self->nmodel;
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
            self->nmodel.is_like = 0;
            self->nmodel.like_num --;
            [self->scrodownview.share.dz ClickDianZanWithImage:@"点赞" Title:[NSString stringWithFormat:@"%ld",self->nmodel.like_num]];
            self->comentsview.model = self->nmodel;
        }
    }];
}
@end
