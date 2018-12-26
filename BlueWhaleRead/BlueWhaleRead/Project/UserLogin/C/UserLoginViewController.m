//
//  UserLoginViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserLoginViewController.h"
#import "UserlLoginTextFileView.h"
#import "UserLoginClickView.h"

#import "UserLoginRegisteredViewController.h"
#import "UserLoginDlViewController.h"

#import "UserSQDLView.h"
@interface UserLoginViewController (){
    FLAnimatedImageView * userImageView;
    UserlLoginTextFileView * textFile;
}

@end

@implementation UserLoginViewController
- (void)ConfirmTheSize{
    UIView *statusBar = STAUBARHEIGHT;
    StatusBar = statusBar.frame.size.height;
    NavHeight = StatusBar+NAVIGATIONHeight;
    TabBarHeight = TABBARHeight;
    poinw = WIDTH/16;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self ConfirmTheSize];
    WS(ws);
    userImageView = [FLAnimatedImageView new];
    userImageView.image = UIIMAGE(@"天天爱读");
    userImageView.layer.shadowColor = RGB(0, 0, 0).CGColor;
    userImageView.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    userImageView.layer.shadowRadius = LENGTH(10);
    userImageView.layer.shadowOpacity = 0.1;
    [self.view addSubview:userImageView];
    [userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(96));
        make.top.mas_equalTo(ws.view.mas_top).with.offset(StatusBar+LENGTH(100));
        make.width.mas_equalTo(LENGTH(65));
        make.height.mas_equalTo(LENGTH(65));
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(92, 92, 92) LabelFont:TextFontCu(25) TextAlignment:NSTextAlignmentCenter Text:@"天天爱读"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->userImageView);
        make.left.mas_equalTo(self->userImageView.mas_right).with.offset(LENGTH(15));
    }];
    
    UserLoginClickView * NewUser = [[UserLoginClickView alloc] initWithImage:@"" Text:@"新手注册" Style:UserLoginClickStyleNoml];
    NewUser.userInteractionEnabled = YES;
    [self.view addSubview:NewUser];
    [NewUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->userImageView.mas_bottom).with.offset(LENGTH(132));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    [NewUser setBlock:^{
        [self pushNewUser];
    }];
    
    UserLoginClickView * DL = [[UserLoginClickView alloc] initWithImage:@"" Text:@"登录" Style:UserLoginClickStyleNoml];
    [DL whitherBacler];
    DL.userInteractionEnabled = YES;
    [self.view addSubview:DL];
    [DL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NewUser.mas_bottom).with.offset(LENGTH(20));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    [DL setBlock:^{
        [self denglu];
    }];
    
    UserSQDLView * sqdl = [UserSQDLView new];
    sqdl.nav = self.navigationController;
    [self.view addSubview:sqdl];
    [sqdl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(DL.mas_bottom).with.offset(LENGTH(80));
        make.left.and.right.mas_equalTo(ws.view);
    }];
    
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [self.view addGestureRecognizer:tapGesture2];
}

- (void)pushNewUser{
    UserLoginRegisteredViewController * vc = [UserLoginRegisteredViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)denglu{
    UserLoginDlViewController * vc = [UserLoginDlViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tapGesture2{
    [textFile returnKeyboard];
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
