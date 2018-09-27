//
//  PersonXiuGaiMimaViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonXiuGaiMimaViewController.h"
#import "PersonXGMMView.h"

@interface PersonXiuGaiMimaViewController ()<NavDelegate>{
    MBProgressHUD * mb;
}

@end

@implementation PersonXiuGaiMimaViewController
{
    PersonXGMMView * textFile;
    BaseLabel * dl;
}
- (void)tapGesture2{
    [textFile returnKeyboard];
}
- (void)tapGesture1{
    BOOL yizhi = [textFile yizhi];
    WS(ws);
        mb = [MBProgressHUD new];
        mb.mode = MBProgressHUDModeIndeterminate;
        mb.label.text = @"新密码两次输入不一致";
        [mb showAnimated:YES];
//        mb.removeFromSuperViewOnHide = NO;
        [self.view.window addSubview:mb];
        [mb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(ws.view.window);
        }];
        
    if (yizhi == YES) {
        [self LoadData];
    }else{
        mb.mode = MBProgressHUDModeCustomView;
        mb.label.text = @"新密码两次输入不一致";
        [mb hideAnimated:YES afterDelay:2];
        
    }
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_XGMM];
    NSArray * arr = [textFile XGMM];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"oldPassword":arr[0],@"newPassword":arr[1]};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MyDeModel *model = [MyDeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                self->mb.mode = MBProgressHUDModeCustomView;
                self->mb.label.text = model.message;
                [self->mb hideAnimated:YES afterDelay:2];
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                self->mb.mode = MBProgressHUDModeCustomView;
                self->mb.label.text = model.message;
                [self->mb hideAnimated:YES afterDelay:2];
            }
        }else{
            self->mb.mode = MBProgressHUDModeCustomView;
            self->mb.label.text = @"网络连接失败";
            [self->mb hideAnimated:YES afterDelay:2];
        }
    }];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(255,255,255);
    [self AddNavtion];
    [self addView];
}
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"修改密码" RightTitle:@"" NativeStyle:NavStyleGeneral];
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
- (void)addView{
    WS(ws);
    textFile = [PersonXGMMView new];
    textFile.nav = self.navigationController;
    [self.view addSubview:textFile];
    [textFile mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(40));
        make.left.mas_equalTo(LENGTH(30));
        make.right.mas_equalTo(-LENGTH(30));
    }];
    
    
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [self.view addGestureRecognizer:tapGesture2];
    
    dl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(15.5) TextAlignment:NSTextAlignmentCenter Text:@"提交"];
    dl.backgroundColor = RGB(1,195,189);
    dl.layer.masksToBounds = YES;
    dl.layer.cornerRadius = LENGTH(22);
    [self.view addSubview:dl];
    [dl mas_makeConstraints:^(MASConstraintMaker *make) {
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
