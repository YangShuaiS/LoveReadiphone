//
//  UserLoginWsXXViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserLoginWsXXViewController.h"
#import "UserLoginTextFileView.h"
#import "UserLoginClickView.h"
@interface UserLoginWsXXViewController ()

@end

@implementation UserLoginWsXXViewController{
    UserLoginTextFileView * address;
    UserLoginTextFileView * school;
    UserLoginTextFileView * schoolclass;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addnav];
    WS(ws);
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFontCu(25) TextAlignment:NSTextAlignmentCenter Text:@"进一步完善"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+44+LENGTH(26));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    BaseLabel * onesubtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(155,177,176) LabelFont:TextFontCu(14) TextAlignment:NSTextAlignmentCenter Text:@"可以帮助你找到自己的老师和班级"];
    [self.view addSubview:onesubtitle];
    [onesubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(6));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    address = [[UserLoginTextFileView alloc] initWithStyle:UserLoginTextFileClickDQ];
    address.titles = @"所在地区";
    address.vc = self;
    [self.view addSubview:address];
    [address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(onesubtitle.mas_bottom).with.offset(LENGTH(46));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(50));
    }];
//    [address setBlock:^{
//    }];
    
    school = [[UserLoginTextFileView alloc] initWithStyle:UserLoginTextFileYHM];
    school.titles = @"所在学校";
    [self.view addSubview:school];
    [school mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->address.mas_bottom).with.offset(LENGTH(12));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    schoolclass = [[UserLoginTextFileView alloc] initWithStyle:UserLoginTextFileYHM];
    schoolclass.titles = @"所在班级";
    [self.view addSubview:schoolclass];
    [schoolclass mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->school.mas_bottom).with.offset(LENGTH(12));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    UserLoginClickView * NewUser = [[UserLoginClickView alloc] initWithImage:@"" Text:@"下一步" Style:UserLoginClickStyleNoml];
    NewUser.userInteractionEnabled = YES;
    [self.view addSubview:NewUser];
    [NewUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->schoolclass.mas_bottom).with.offset(LENGTH(120));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    [NewUser setBlock:^{
        [self wancheng];
    }];
    
    BaseLabel * label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(43,67,66) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"暂不完善"];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NewUser.mas_bottom).with.offset(LENGTH(24));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buwanshan)];
    //将手势添加到需要相应的view中去
    [label addGestureRecognizer:tapGesture2];

    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture3)];
    //将手势添加到需要相应的view中去
    [self.view addGestureRecognizer:tapGesture3];
}



- (void)wancheng{
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在完善信息";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.view.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view.window);
    }];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_DENGLU];
    NSDictionary * dic = @{@"code":_itemarray[0],@"password":_itemarray[1]};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                NSString *filePatch = [BaseObject AddPathName:UserMe];
                Me = [MeModel mj_objectWithKeyValues:m.studentInfo];
                NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
                NSDictionary * dics = m.studentInfo;
                [usersDic setObject:dics forKey:UserMe];
                [usersDic writeToFile:filePatch atomically:YES];
                [mb hideAnimated:NO];
                [self wansahn];
            }else{
                mb.label.text = m.message;
                [mb hideAnimated:NO afterDelay:1];
            }
            
        }else{
            mb.label.text = @"网络请求失败";
            [mb hideAnimated:NO afterDelay:1];
        }
    }];
    
}
- (void)buwanshan{
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在完善信息";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.view.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view.window);
    }];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_DENGLU];
    NSDictionary * dic = @{@"code":_itemarray[0],@"password":_itemarray[1]};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                NSString *filePatch = [BaseObject AddPathName:UserMe];
                Me = [MeModel mj_objectWithKeyValues:m.studentInfo];
                NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
                NSDictionary * dics = m.studentInfo;
                [usersDic setObject:dics forKey:UserMe];
                [usersDic writeToFile:filePatch atomically:YES];
                [mb hideAnimated:NO];
                NSNotification *notification =[NSNotification notificationWithName:kNotificationDenglu object:nil userInfo:nil];
                [[NSNotificationCenter defaultCenter] postNotification:notification];
            }else{
                mb.label.text = m.message;
                [mb hideAnimated:NO afterDelay:1];
            }
            
        }else{
            mb.label.text = @"网络请求失败";
            [mb hideAnimated:NO afterDelay:1];
        }
    }];
}
- (void)wansahn{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_WSXX];
    NSDictionary * dic = @{@"tag":@"1",@"studentid":Me.ssid,@"school":school.textField.text,@"clazz":schoolclass.textField.text,@"area":address.dqid};
    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MyDeModel *mo = [MyDeModel mj_objectWithKeyValues:responseObject];
            if ([mo.code isEqual:@200]) {
                NSNotification *notification =[NSNotification notificationWithName:kNotificationDenglu object:nil userInfo:nil];
                [[NSNotificationCenter defaultCenter] postNotification:notification];
            }
        }else{
            
        }
    }];
}
#pragma mark ----------- 返回
- (void)addnav{
    WS(ws);
    UIImageView * back = [UIImageView new];
    back.image = UIIMAGE(@"backhei");
    [self.view addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+14);
        make.left.mas_equalTo(ws.view).with.offset(19);
    }];
    BaseButton * backbutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [backbutton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backbutton];
    [backbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar);
        make.left.mas_equalTo(ws.view);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(50);
    }];
}
- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tapGesture3{
    [address returnKeyboard];
    [school returnKeyboard];
    [schoolclass returnKeyboard];
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
