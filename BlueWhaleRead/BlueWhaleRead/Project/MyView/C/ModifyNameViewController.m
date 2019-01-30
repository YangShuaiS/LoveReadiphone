//
//  ModifyNameViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ModifyNameViewController.h"
#import "UserLoginTextFileView.h"
#import "UserLoginClickView.h"
@interface ModifyNameViewController ()

@end

@implementation ModifyNameViewController{
    BaseLabel * title;
    UserLoginTextFileView * school;
}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [self addnav];
    WS(ws);
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFontCu(25) TextAlignment:NSTextAlignmentCenter Text:@"修改昵称"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+44+LENGTH(26));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    
    school = [[UserLoginTextFileView alloc] initWithStyle:UserLoginTextFileYHM];
    school.titles = @"请填写昵称(限20个字符)";
    [self.view addSubview:school];
    [school mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(47));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    UserLoginClickView * NewUser = [[UserLoginClickView alloc] initWithImage:@"" Text:@"完成" Style:UserLoginClickStyleNoml];
    NewUser.userInteractionEnabled = YES;
    [self.view addSubview:NewUser];
    [NewUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->school.mas_bottom).with.offset(LENGTH(242));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    [NewUser setBlock:^{
        [self wanshan];
    }];
    
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [self.view addGestureRecognizer:tapGesture2];
}
- (void)tapGesture2{
    [school.textField resignFirstResponder];
}
- (void)wanshan{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_XGNAME];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"username":school.textField.text};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MyDeModel *mo = [MyDeModel mj_objectWithKeyValues:responseObject];
            if ([mo.code isEqual:@200]) {
                NSString *filePatch = [BaseObject AddPathName:UserMe];
                NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
                NSMutableDictionary *dics = dataDictionary[UserMe];
                    NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
                [dics setValue:self->school.textField.text forKey:@"name"];
                    [usersDic setObject:dics forKey:UserMe];
                    [usersDic writeToFile:filePatch atomically:YES];
                
                Me.name = self->school.textField.text;
//                self.block();
                [self.navigationController popViewControllerAnimated:YES];
            }else if ([mo.code isEqual:@Notloggedin]){
                [self UpDengLu];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
