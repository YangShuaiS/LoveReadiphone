//
//  MyClassViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyClassViewController.h"
#import "MyClassView.h"

#import "FenXiangView.h"
#import "HaiBaoView.h"
@interface MyClassViewController ()<NavDelegate>

@end

@implementation MyClassViewController{
    MyClassView * myClass;
    NSMutableArray * itemarray;
    NSInteger page;
    
    MyClassListModel * models;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BEIJINGCOLOR;
    [self AddNavtion];
    [self AddView];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"我的班级" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.titcolor = RGB(0, 0, 0);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.backgroundColor = [UIColor whiteColor];
    self.navtive.layer.shadowColor = RGB(0, 0, 0).CGColor;
    self.navtive.layer.shadowOffset = CGSizeMake(0,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.navtive.layer.shadowRadius = LENGTH(4);
    self.navtive.layer.shadowOpacity = 0.04;
    
    FLAnimatedImageView * sharefriend = [FLAnimatedImageView new];
    sharefriend.image = UIIMAGE(@"组 928");
    sharefriend.contentMode = UIViewContentModeScaleAspectFit;
    [self.navtive addSubview:sharefriend];
    [sharefriend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_top).with.offset(StatusBar+10);
        make.right.mas_equalTo(ws.navtive.mas_right).with.offset(-20);
        //        make.size.mas_equalTo(sharefriend.image.size);
        make.width.and.height.mas_equalTo(24);
    }];
    sharefriend.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(FenXiang)];
    [sharefriend addGestureRecognizer:tap];
}
- (void)FenXiang{
    if (itemarray.count!=0) {
        FenXiangView * fenxiangs = [FenXiangView new];
        if (models.studentnum == 0) {
            fenxiangs.sharestyle = ShareStyleTag5;
        }else{
            fenxiangs.studentnum = [NSString stringWithFormat:@"%ld",models.studentnum+1];
            fenxiangs.sharestyle = ShareStyleTag6;
        }
        [self.view addSubview:fenxiangs];
        WS(ws);
        [fenxiangs mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.view);
        }];
        [fenxiangs setBlock:^(FenXiangModel *model, ShareStyle sharestyle) {
            [self addhabai:model Style:sharestyle];
        }];
    }

}

- (void)addhabai:(FenXiangModel *)model Style:(ShareStyle)style{
    HaiBaoView * haibao = [HaiBaoView new];
    haibao.sharestyle = style;
    haibao.modes = model;
    [self.view addSubview:haibao];
    WS(ws);
    [haibao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
}
- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}

- (void)AddView{
    WS(ws);
    myClass = [MyClassView new];
    myClass.nav = self.navigationController;
    [self.view addSubview:myClass];
    [myClass mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(1);
        make.bottom.mas_equalTo(ws.view);
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
    }];
    [self chushihua];
    [self loadRequestData];
}
- (void)chushihua{
    itemarray = [NSMutableArray array];
    page = 1;
}
- (void)loadRequestData{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_MyCLASS];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MyClassListModel * model = [MyClassListModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [ws UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{

        }
    }];
}
- (void)UpData:(MyClassListModel *)model{
    models = model;
    [itemarray addObjectsFromArray:model.studentList];
    myClass.model = model;
    myClass.weizhi = model.studentnum;
    myClass.itemarray = itemarray;

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

@end
