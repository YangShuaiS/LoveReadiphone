//
//  BookXqViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/12.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookXqViewController.h"
#import "BookXQTopView.h"
#import "BookXQDownView.h"
#import "BookXQDownMenuView.h"
#import "MingShiDDViewController.h"
#import "YouXiuSPViewController.h"
#import "UserFriendViewController.h"

#import "GuideBookXqOneView.h"
#import "GuideBookXqTwoView.h"
#import "GuideBookXqThreeView.h"

#import "NewHpViewModel.h"
@interface BookXqViewController ()<NavDelegate>

@end

@implementation BookXqViewController{
    BookXQTopView * bookTop;
    BookXQDownView * bookDown;
    BookXQDownMenuView * homeMenu;
    BaseView * downView;
    FLAnimatedImageView * bacImageview;
    CGFloat lastflo;;
    BOOL big;
    BOOL zt;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.navigationController.navigationBar.hidden = YES;
//        if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
//        }
    [self LoadData:_loadId];

}
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"书籍详情" RightTitle:@"home-Click" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
//    self.navtive.backgroundColor = [UIColor clearColor];
}
- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    big = NO;
    self.view.backgroundColor = BEIJINGCOLOR;
    WS(ws);
    FLAnimatedImageView * backImageView = [FLAnimatedImageView new];
    backImageView.image = UIIMAGE(@"bg_书架_书籍详情大背景");
    backImageView.contentMode = UIViewContentModeScaleAspectFill;
    backImageView.layer.masksToBounds = YES;
    [self.view addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    backImageView.userInteractionEnabled = YES;
    bacImageview = backImageView;
    
    
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
    
    bookTop = [BookXQTopView new];
    bookTop.nav = self.navigationController;
    [backImageView addSubview:bookTop];
    [bookTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backImageView.mas_left).with.offset(LENGTH(15));
        make.right.equalTo(backImageView.mas_right).with.offset(-LENGTH(15));
        make.top.equalTo(backImageView.mas_top).with.offset(LENGTH(5)+NavHeight);

    }];
    
    downView = [BaseView new];
    downView.nav = self.navigationController;
    downView.backgroundColor = RGB(254,237,183);
    downView.layer.masksToBounds = YES;
    downView.layer.cornerRadius = LENGTH(5);
    [backImageView addSubview:downView];
    
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->bookTop.mas_bottom).with.offset(LENGTH(15));
        make.left.equalTo(backImageView.mas_left).with.offset(LENGTH(15));
        make.bottom.equalTo(backImageView.mas_bottom).with.offset(-LENGTH(TabBarHeight));
        make.right.equalTo(backImageView.mas_right).with.offset(-LENGTH(15));
    }];
    
    FLAnimatedImageView * leftimage = [FLAnimatedImageView new];
    leftimage.image = UIIMAGE(@"bg_书架_书籍详情_连接");
    [backImageView addSubview:leftimage];
    [leftimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->bookTop.mas_bottom).with.offset(-LENGTH(16));
//        make.bottom.mas_equalTo(self->downView.mas_top).with.offset(LENGTH(16));
        make.left.mas_equalTo(self->bookTop.mas_left).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(47));

    }];

    
    FLAnimatedImageView * rightmage = [FLAnimatedImageView new];
    rightmage.image = UIIMAGE(@"bg_书架_书籍详情_连接");
    [backImageView addSubview:rightmage];
    [rightmage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->bookTop.mas_bottom).with.offset(-LENGTH(16));
//        make.bottom.mas_equalTo(self->downView.mas_top).with.offset(LENGTH(12));
        make.right.mas_equalTo(self->bookTop.mas_right).with.offset(-LENGTH(20));
        make.width.mas_equalTo(LENGTH(12));
        make.height.mas_equalTo(LENGTH(47));

    }];
//    BaseButton * LeftButton = [BaseButton buttonWithType:UIButtonTypeCustom];
//    //    [LeftButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
//    LeftButton.backgroundColor = RANDOMCOLOR;
//    [LeftButton addTarget:self action:@selector(left) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:LeftButton];
//
//    [LeftButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(ws.view).with.offset(LENGTH(27));
//        make.top.equalTo(ws.view).with.offset(LENGTH(2)+StatusBar);
//        make.height.mas_equalTo(LENGTH(40));
//        make.width.mas_equalTo(LENGTH(40));
//    }];
//
    bookDown = [BookXQDownView new];
    bookDown.nav = self.navigationController;
    [self.view addSubview:bookDown];
    [bookDown mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        //        make.top.equalTo(self->homeMenu.mas_bottom).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(LENGTH(TabBarHeight));
    }];
    
    [bookTop setBlock:^{
        [ws joincity];
    }];
    [bookDown setBlock:^{
        [ws love];
    }];
    
    
}
- (void)joincity{
    bookDown.joincity = 1;
}
- (void)love{
    [bookTop oneButtons];
}
- (void)left{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setLoadId:(NSString *)loadId{
    _loadId = loadId;
//    [self LoadData:loadId];
}
- (void)LoadData:(NSString*)loadId{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_BOOKXQ];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"bookid":loadId};

    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            BookXQModel * model = [BookXQModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}

- (void)UpData:(BookXQModel *)model{
    if (homeMenu == nil) {
        switch (model.book.imp_type) {
            case BookIntensiveReading:
                [self addIntensiveMenu:model];
                break;
            case BookExtensiveReading:
                [self addExtensiveMenu:model];
                break;
            default:
                break;
        }
    }

//    bookTop.status = model.status;
    bookTop.model = model.book;
//    [self addIntensiveMenu:model];
    bookDown.model = model.book;
    [self.view layoutIfNeeded];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self addGuideBookXqOneView];
    });
}
- (void)addIntensiveMenu:(BookXQModel*)model{
    WS(ws);
    zt = 0;
    homeMenu = [[BookXQDownMenuView alloc] init];
    homeMenu.titarray = @[@"同学",@"读后感",@"优秀书评"];
    [self.view addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->downView.mas_left).with.offset(0);
        make.right.equalTo(self->downView.mas_right).with.offset(0);
        make.top.equalTo(self->downView.mas_top).with.offset(LENGTH(5));
        make.bottom.equalTo(self->downView.mas_bottom).with.offset(0);
    }];
    NSMutableArray *childVC = [[NSMutableArray alloc] init];

    UserFriendViewController * zdtx = [[UserFriendViewController alloc] init];
    zdtx.itemarray = model.readFriend;
    [self addChildViewController:zdtx];
    [childVC addObject:zdtx ];

    MingShiDDViewController * msdt = [[MingShiDDViewController alloc] init];
    msdt.itemarray =model.readThought;
    [self addChildViewController:msdt];
    [childVC addObject:msdt];

    YouXiuSPViewController * yxsp = [[YouXiuSPViewController alloc] init];

    yxsp.itemarray = model.bookReview;
    [self addChildViewController:yxsp];
    [childVC addObject:yxsp];
    homeMenu.controllerArray = childVC;
    homeMenu.moren = _moren;
    [zdtx setBlock:^(CGFloat flo) {
        [self uptableView:flo];
    }];
    [msdt setBlock:^(CGFloat flo) {
        [self uptableView:flo];
    }];
    [yxsp setBlock:^(CGFloat flo) {
        [self uptableView:flo];
    }];
 
}
- (void)uptableView:(CGFloat)flo{
    if (flo>50&& big == NO){
        big = YES;
        [UIView animateWithDuration:0.5 animations:^{
            [self->bookTop mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->bacImageview.mas_top).with.offset(-self->bookTop.frame.size.height+NavHeight);
            }];
            [self.view.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }else if (flo <-50&& big == YES){
        [UIView animateWithDuration:0.5 animations:^{
            [self->bookTop mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->bacImageview.mas_top).with.offset(LENGTH(5)+NavHeight);
            }];
            [self.view.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];

        big = NO;
    }
    
    
//    if (flo>10 && big == NO) {
//        [self->bookTop mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self->bacImageview.mas_top).with.offset(-self->bookTop.frame.size.height+NavHeight);
//        }];
//        [self->bookTop layoutSubviews];
//        big = YES;
//    }else if(flo<10 && big == YES){
//        [self->bookTop mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self->bacImageview.mas_top).with.offset(LENGTH(5)+NavHeight);
//        }];
//        [self->bookTop layoutSubviews];
//
//        big = NO;


//        [UIView animateWithDuration:1 animations:^{
        
//            [self->bookTop layoutSubviews];
//        } completion:^(BOOL finished) {
//
//        }];
//    }
    

}
- (void)addExtensiveMenu:(BookXQModel*)model{
    WS(ws);
    homeMenu = [[BookXQDownMenuView alloc] init];
    homeMenu.titarray = @[@"在读同学"];
    [self.view addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->downView.mas_left).with.offset(0);
        make.right.equalTo(self->downView.mas_right).with.offset(0);
        make.top.equalTo(self->downView.mas_top).with.offset(LENGTH(5));
        make.bottom.equalTo(self->downView.mas_bottom).with.offset(0);
    }];
    NSMutableArray *childVC = [[NSMutableArray alloc] init];
    UserFriendViewController * hotview = [[UserFriendViewController alloc] init];
    hotview.itemarray = model.readFriend;
    [self addChildViewController:hotview];
    [childVC addObject:hotview];

    //
    homeMenu.controllerArray = childVC;
    
    [hotview setBlock:^(CGFloat flo) {
        [self uptableView:flo];
    }];
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

#pragma mark ------------------ 引导页
- (void)addGuideBookXqOneView{
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",@"bendixinxi"]];
    NSMutableDictionary *dataDictionary = [BaseObject BenDiXinXi];
    NewHpViewModel * model = [NewHpViewModel mj_objectWithKeyValues:dataDictionary];
    if ([model.ydybookxq integerValue]<3) {
        WS(ws);
        GuideBookXqOneView * view = [GuideBookXqOneView new];
        view.frames = bookTop.frame;
        [self.view.window addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.view.window);
        }];
        [view setBlock:^{
            [ws addGuideBookXqTwoView];
        }];
        
        NSString * str = [NSString stringWithFormat:@"%ld",[model.ydybookxq integerValue]+1];
        [dataDictionary setValue:str forKey:@"ydybookxq"];
        [dataDictionary writeToFile:filePatch atomically:YES];
    }
}

- (void)addGuideBookXqTwoView{
    WS(ws);
    GuideBookXqTwoView * view = [GuideBookXqTwoView new];
    view.frames = bookTop.frame;
    [self.view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view.window);
    }];
    [view setBlock:^{
        [ws addGuideBookXqThreeView];
    }];
}
- (void)addGuideBookXqThreeView{
    WS(ws);
    if (bookDown.model.imp_type == BookIntensiveReading) {
        GuideBookXqThreeView * view = [GuideBookXqThreeView new];
        view.frames = homeMenu.frame;
        [self.view.window addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.view.window);
        }];
    }else{
    }
}
@end
