//
//  MyClassViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyClassViewController.h"
#import "MyClassView.h"
@interface MyClassViewController ()<NavDelegate>

@end

@implementation MyClassViewController{
    MyClassView * myClass;
    NSMutableArray * itemarray;
    NSInteger page;
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
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"我的班级" RightTitle:@"home-Click" NativeStyle:NavStyleGeneral];
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
        make.top.mas_equalTo(ws.navtive.mas_bottom);
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
            }
        }else{

        }
    }];
}
- (void)UpData:(MyClassListModel *)model{
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
