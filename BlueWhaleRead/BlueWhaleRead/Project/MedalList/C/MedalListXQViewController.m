//
//  MedalListXQViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalListXQViewController.h"
#import "MenuTwon.h"
#import "MdcziXQJSView.h"

#import "MedalXQBookListViewController.h"
#import "MedalLQXSViewController.h"
#import "TZXZView.h"

#import "ChallengeTwoController.h"
#import "BookXQDownMenuView.h"
#import "MedalDownView.h"
#import "JoinBookCityView.h"
#import "GeneralMedalView.h"
@interface MedalListXQViewController ()<NavDelegate>

@end

@implementation MedalListXQViewController{
    MedalXQBookListViewController* hotview;
    MedalLQXSViewController * Familiar;
//    TZXZView * downView;
    
    BaseView * backView;
    FLAnimatedImageView * backImage;
    MdcziXQJSView * msczi;
    BaseView * downView;
    BookXQDownMenuView * homeMenu;
    MedalDownView * medaDownView;
    JoinBookCityView * joinView;
    GeneralMedalView * MedalView;
    BOOL big;
    MedalListXqModel * model;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [self LoadData:1];

}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = BEIJINGCOLOR;
    [self AddNavtion];
    [self AddView];
    [self LoadData:1];

}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"勋章详情" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    
}
- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
    //    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}

- (void)AddView{
    WS(ws);
    self.automaticallyAdjustsScrollViewInsets = NO;
    big = NO;
    self.view.backgroundColor = BEIJINGCOLOR;
    FLAnimatedImageView * backImageView = [FLAnimatedImageView new];
    backImageView.image = UIIMAGE(@"bg_书架_书籍详情大背景");
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.layer.masksToBounds = YES;
    [self.view addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    backImageView.userInteractionEnabled = YES;
    
    FLAnimatedImageView * backImageView1 = [FLAnimatedImageView new];
    backImageView1.image = UIIMAGE(@"bg_书架_书籍详情大背景底图");
    backImageView1.contentMode = UIViewContentModeScaleAspectFill;
    backImageView1.layer.masksToBounds = YES;
    [backImageView addSubview:backImageView1];
    [backImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backImageView.mas_left);
        make.right.mas_equalTo(backImageView.mas_right);
        make.bottom.mas_equalTo(backImageView.mas_bottom);
        make.height.mas_equalTo(LENGTH(233));
    }];
    backImageView1.userInteractionEnabled = YES;
    [self AddNavtion];
    
    backView = [BaseView new];
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.cornerRadius = LENGTH(5);
    backView.layer.masksToBounds = YES;
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(LENGTH(15));
        make.right.equalTo(ws.view).with.offset(-LENGTH(15));
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(8));

    }];
    
    backImage = [FLAnimatedImageView new];
    backImage.image = UIIMAGE(@"bg_勋章背景_勋章列表");
    [backView addSubview:backImage];
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->backView.mas_left).with.offset(0);
        make.right.equalTo(self->backView.mas_right).with.offset(0);
        make.top.equalTo(self->backView.mas_top).with.offset(0);
        make.height.mas_equalTo(ws.view.mas_width).multipliedBy(0.27121);
    }];
    
//    UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView *mohu = [[UIVisualEffectView alloc] initWithEffect:beffect];
//    [backView addSubview:mohu];
//    [mohu mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self->backImage);
//    }];
    
    MedalView = [GeneralMedalView new];
    MedalView.upjl = LENGTH(6);
    [backView addSubview:MedalView];
    [MedalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->backImage);
        make.width.mas_equalTo(LENGTH(70));
        make.height.mas_equalTo(LENGTH(70));
    }];
    
    
    msczi = [MdcziXQJSView new];
    msczi.nav = self.navigationController;
    msczi.delegate = self;
    msczi.backgroundColor = [UIColor whiteColor];
    [backView addSubview:msczi];
    
    [msczi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->backView.mas_left).with.offset(0);
        make.right.equalTo(self->backView.mas_right).with.offset(0);
        make.top.equalTo(self->backImage.mas_bottom).with.offset(0);
        make.bottom.equalTo(self->backView.mas_bottom).with.offset(0);
    }];

    downView = [BaseView new];
    downView.backgroundColor = RGB(254,237,183);
    downView.layer.masksToBounds = YES;
    downView.layer.cornerRadius = LENGTH(5);
    [self.view addSubview:downView];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backView.mas_bottom).with.offset(LENGTH(10));
        make.left.equalTo(backImageView.mas_left).with.offset(LENGTH(15));
        make.bottom.equalTo(backImageView.mas_bottom).with.offset(-LENGTH(51));
        make.right.equalTo(backImageView.mas_right).with.offset(-LENGTH(15));
    }];


////    make.top.equalTo(self->bookTop.mas_bottom).with.offset(LENGTH(15));
//    make.left.equalTo(backImageView.mas_left).with.offset(LENGTH(25));
//    make.bottom.equalTo(backImageView.mas_bottom).with.offset(-LENGTH(80));
//    make.right.equalTo(backImageView.mas_right).with.offset(-LENGTH(25));

    FLAnimatedImageView * leftimage = [FLAnimatedImageView new];
    leftimage.image = UIIMAGE(@"bg_书架_书籍详情_连接");
    [self.view addSubview:leftimage];
    [leftimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->msczi.mas_bottom).with.offset(-LENGTH(16));
        //        make.bottom.mas_equalTo(self->downView.mas_top).with.offset(LENGTH(16));
        make.left.mas_equalTo(self->msczi.mas_left).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(47));
        
    }];
    
    
    FLAnimatedImageView * rightmage = [FLAnimatedImageView new];
    rightmage.image = UIIMAGE(@"bg_书架_书籍详情_连接");
    [self.view addSubview:rightmage];
    [rightmage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->msczi.mas_bottom).with.offset(-LENGTH(16));
        //        make.bottom.mas_equalTo(self->downView.mas_top).with.offset(LENGTH(12));
        make.right.mas_equalTo(self->msczi.mas_right).with.offset(-LENGTH(20));
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(47));
        
    }];
    

    homeMenu = [[BookXQDownMenuView alloc] init];
    homeMenu.titarray = @[@"勋章书籍",@"同学"];
    [downView addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->downView.mas_left).with.offset(0);
        make.right.equalTo(self->downView.mas_right).with.offset(0);
        make.top.equalTo(self->downView.mas_top).with.offset(LENGTH(5));
        make.bottom.equalTo(self->downView.mas_bottom).with.offset(0);
    }];
    
    NSMutableArray *childVC = [[NSMutableArray alloc] init];
    hotview = [[MedalXQBookListViewController alloc] init];
    [self addChildViewController:hotview];
    [childVC addObject:hotview];

    Familiar = [[MedalLQXSViewController alloc] init];
    //    Familiar.delegete = self;
    [self addChildViewController:Familiar];
    [childVC addObject:Familiar];
    //
    homeMenu.controllerArray = childVC;

    [hotview setBlock:^(CGFloat flo) {
        [ws uptableView:flo];
    }];
    [Familiar setBlock:^(CGFloat flo) {
        [ws uptableView:flo];
    }];

    
    medaDownView = [MedalDownView new];
    [self.view addSubview:medaDownView];
    [medaDownView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
        make.bottom.mas_equalTo(ws.view);
    }];
    medaDownView.style = DownStyleGoLightUp;
    [medaDownView setBlock:^{
        [ws upChooseBook];
    }];
//    downView = [TZXZView new];
//    [downView setBlock:^{
//        [ws RLXZ];
//    }];
//    [downView setTzxzBlock:^{
//        [ws TZXZ];
//    }];
//    [self.view addSubview:downView];
//    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->homeMenu.mas_bottom).with.offset(0);
//        make.left.equalTo(ws.view).with.offset(0);
//        make.right.equalTo(ws.view).with.offset(0);
//        make.bottom.equalTo(ws.view).with.offset(0);
//    }];

//    [self.view addSubview:self.navtive];
    
    [self.view addSubview:self.navtive];

}

- (void)uptableView:(CGFloat)flo{
    WS(ws);
    if (flo>50&& big == NO){
        big = YES;
        [UIView animateWithDuration:0.5 animations:^{
            [self->backView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(ws.navtive.mas_bottom).with.offset(-LENGTH(10)-self->backView.frame.size.height);

            }];
            [self.view.superview layoutIfNeeded];

//            [self->backView layoutSubviews];
        } completion:^(BOOL finished) {
            
        }];
    }else if (flo <-50&& big == YES){

        big = NO;
        [UIView animateWithDuration:0.5 animations:^{
            [self->backView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(10));
            }];
            [self.view.superview layoutIfNeeded];            
        } completion:^(BOOL finished) {
            
        }];
    }
}
- (void)upChooseBook{
    WS(ws);
    if (!joinView) {
        joinView = [JoinBookCityView new];
        joinView.nav = self.navigationController;
        [self.view addSubview:joinView];
        [joinView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.view);
        }];
        joinView.model = model;
        joinView.joinDown.itemarray = model.studentbookList;
        joinView.itemarray= hotview.itemarray;
        [joinView setBlock:^{
            [ws joinViewRemove];
        }];
    }else{
        joinView.hidden = NO;
    }
    [joinView animationBegin];
    

}
#pragma mark -------- 点亮视图更改
- (void)joinViewRemove{
    if (joinView.joinDown.itemarray.count>0) {
        [medaDownView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        medaDownView.itemarray = joinView.joinDown.itemarray;
        if (model.is_completed == 2) {
            medaDownView.style = DownStyleYiDianLiang;
            
        }else{
            if (model.studentbookList.count>0) {
             }else{
                medaDownView.style = DownStyleGoLightUp;
            }
        }
    }
}
- (void)LoadData:(NSInteger)page{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_XUNZHANGXQ];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"badgeid":_itemid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            self->model = [MedalListXqModel mj_objectWithKeyValues:responseObject];
            if ([self->model.code isEqual:@200]) {
                [self UpData];
            }
        }else{
            
        }
    }];
}
- (void)UpData{
    MedalListBadgeInfoModel * topmodel = model.badgeInfo;
    MedalView.images = topmodel.logo;
    msczi.model = topmodel;
    hotview.model = topmodel;
    hotview.itemarray = model.bookList;
    Familiar.Booknumber = topmodel.task_num;
    Familiar.itemarray = model.badgeStudentList;
    [medaDownView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    medaDownView.nav = self.navigationController;
    medaDownView.model = model;
    medaDownView.itemarray = model.studentbookList;
    if (model.is_completed == 2) {
        medaDownView.style = DownStyleYiDianLiang;

    }else{
        if (model.studentbookList.count>0) {
            medaDownView.style = DownStyleLightUping;
        }else{
            medaDownView.style = DownStyleGoLightUp;
        }
    }




//    downView.model = topmodel;
}
- (void)scrollFloat:(CGFloat)flo{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)RLXZ{
    //    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
    //                                                                   message:@"认领成功"
    //                                                            preferredStyle:UIAlertControllerStyleAlert];
    //
    //    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
    //                                                          handler:^(UIAlertAction * action) {
    //                                                          }];
    //    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
    //                                                         handler:^(UIAlertAction * action) {
    //
    //                                                         }];
    //
    //    [alert addAction:defaultAction];
    //    [alert addAction:cancelAction];
    //    [self presentViewController:alert animated:YES completion:nil];
    
//    PublicView * PopView = [PublicView new];
//    [[UIApplication sharedApplication].keyWindow addSubview:PopView];
//    [PopView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo([UIApplication sharedApplication].keyWindow);
//    }];
//    [PopView setLeftClick:^{
//
//    }];
//    [PopView setRightClick:^{
//
//    }];
//
//    PublicModel * model = [PublicModel new];
//    model.style = PopViewStyleQueren;
//    model.title = @"很遗憾，本首诗诵读没有通过\n还需要多练习一下呀！";
//    model.onelabel = @"换一首";
//    model.twolabel = @"再背一遍";
//    PopView.model = model;
}

- (void)TZXZ{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                   message:@"是否挑战"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
                                                                 self.navigationController.interactivePopGestureRecognizer.enabled = NO;
                                                             }
                                                             ChallengeTwoController * vc = [ChallengeTwoController new];
                                                             [self.navigationController pushViewController:vc animated:YES];
                                                         }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
