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
@interface ArticleViewController ()<NavDelegate,UIScrollViewDelegate>

@end

@implementation ArticleViewController{
    ArticleTopView * topView;
    UIScrollView * scrollView;
    ArticleScroTopView * scrotopview;
    ArticleScroDownView * scrodownview;
    
    FLAnimatedImageView * sharefriend;
    FLAnimatedImageView * ShouCang;
    LunBoTuXQModel *nmodel;

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

    sharefriend = [FLAnimatedImageView new];
    sharefriend.image = UIIMAGE(@"组 928");
    sharefriend.contentMode = UIViewContentModeScaleAspectFit;
    [self.navtive addSubview:sharefriend];
    [sharefriend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws.navtive.mas_right).with.offset(-20);
        make.top.mas_equalTo(ws.navtive.mas_top).with.offset(StatusBar+10);
        make.width.and.height.mas_equalTo(24);
    }];
    sharefriend.userInteractionEnabled = NO;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(FenXiang)];
    [sharefriend addGestureRecognizer:tap];
    
    ShouCang = [FLAnimatedImageView new];
    ShouCang.image = UIIMAGE(@"收藏0");
    ShouCang.contentMode = UIViewContentModeScaleAspectFit;
    [self.navtive addSubview:ShouCang];
    [ShouCang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws.navtive.mas_right).with.offset(-20-24-10);
        make.top.mas_equalTo(ws.navtive.mas_top).with.offset(StatusBar+10);
        make.width.and.height.mas_equalTo(24);
    }];
    ShouCang.userInteractionEnabled = NO;
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ShouCang)];
    [ShouCang addGestureRecognizer:tap1];
}

- (void)NavLeftClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}
- (void)ShouCang{
    if (nmodel.is_collect == 0) {
        [self shoucang];
    }else{
        [self yichushooucang];
    }
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
- (void)shoucang{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_SHOUCANGZHISHITU];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"collectionid":_itemid,@"collection_type":@"1"};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                self->ShouCang.image = UIIMAGE(@"收藏");
                self->nmodel.is_collect = 1;
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
                self->nmodel.is_collect = 0;
            }
        }else{
            
        }
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
    
    scrollView = [UIScrollView new];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    scrotopview = [ArticleScroTopView new];
    [scrollView addSubview:scrotopview];
    [scrotopview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView);
        make.left.and.right.mas_equalTo(ws.view);
    }];
    
    scrodownview = [ArticleScroDownView new];
    [scrollView addSubview:scrodownview];
    [scrodownview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrotopview.mas_bottom).with.offset(LENGTH(5));
        make.left.and.right.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(self->scrollView);
    }];
    
    [self.view addSubview:topView];
    topView.layer.shadowColor = RGB(0, 0, 0).CGColor;
    topView.layer.shadowOffset = CGSizeMake(0,LENGTH(9));//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    topView.layer.shadowRadius = LENGTH(7);
    topView.layer.shadowOpacity = 0.05;
    
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
    sharefriend.userInteractionEnabled = YES;
    ShouCang.userInteractionEnabled = YES;
    self.navtive.title = @"";
    topView.model = model;
    scrodownview.model = model;
    WS(ws);
    if ([model.banner.is_share isEqualToString:@"0"]) {
        sharefriend.userInteractionEnabled = NO;
        sharefriend.image = UIIMAGE(@"");
        [sharefriend removeFromSuperview];
        [ShouCang mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(ws.navtive.mas_right).with.offset(-20);
        }];
    }
    if (model.is_collect == 0) {
        ShouCang.image = UIIMAGE(@"收藏0");
    }else{
        ShouCang.image = UIIMAGE(@"收藏");
    }
    scrotopview.model = model;


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

@end
