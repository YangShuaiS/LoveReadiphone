//
//  PersonXGphoneViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonXGphoneViewController.h"
#import "UserForgetView.h"
#import "PersonXgPhoneTwoViewController.h"
@interface PersonXGphoneViewController ()<NavDelegate>

@end

@implementation PersonXGphoneViewController{
    UserForgetView * textFile;
    BaseLabel * dl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(255,255,255);
    [self AddNavtion];
}
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"修改预留手机号" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    
    textFile = [UserForgetView new];
    textFile.nav = self.navigationController;
    [self.view addSubview:textFile];
    [textFile mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(40));
        make.left.mas_equalTo(LENGTH(30));
        make.right.mas_equalTo(-LENGTH(30));
    }];
    [textFile setBlocks:^(BOOL next) {
        [ws next:next];
    }];
    
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [self.view addGestureRecognizer:tapGesture2];
    
    dl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(15.5) TextAlignment:NSTextAlignmentCenter Text:@"下一步"];
    dl.backgroundColor = RGB(164,234,231);
    dl.layer.masksToBounds = YES;
    dl.layer.cornerRadius = LENGTH(22);
    [self.view addSubview:dl];
    [dl mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(ws.view);
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(96));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(96));
        make.top.mas_equalTo(self->textFile.mas_bottom).with.offset(LENGTH(80));
        make.height.mas_equalTo(44);
    }];
    dl.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [dl addGestureRecognizer:tapGesture1];
}
- (void)tapGesture2{
    [textFile returnKeyboard];
}
- (void)next:(BOOL)next{
    if (next == YES) {
        dl.userInteractionEnabled = YES;
        dl.backgroundColor = RGB(1,195,189);
    }else{
        dl.userInteractionEnabled = NO;
        dl.backgroundColor = RGB(164,234,231);
    }
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_JIAOYANYANZHENGMA];
    NSArray * arr = [textFile Whetherornotthesame];
    NSDictionary * dic = @{@"phone":arr[0],@"code":arr[1]};
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.view.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view.window);
    }];
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MyDeModel * model = [MyDeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData];
                mb.label.text = model.message;
                [mb hideAnimated:NO afterDelay:1];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
            mb.label.text = model.message;
            [mb hideAnimated:NO afterDelay:1];
        }else{
            mb.label.text = @"网络请求失败";
            [mb hideAnimated:NO afterDelay:1];
        }
    }];
    
}
- (void)UpData{
    PersonXgPhoneTwoViewController * vc = [PersonXgPhoneTwoViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)tapGesture1{
        [self LoadData];
}
- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
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
