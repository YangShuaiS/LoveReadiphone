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
#import "UserPhoneDlViewController.h"

#import "UserSQDLView.h"
@interface UserLoginViewController ()
@end

@implementation UserLoginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    WS(ws);
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView * backimageview = [UIImageView new];
    backimageview.contentMode = UIViewContentModeScaleAspectFill;
    backimageview.image = UIIMAGE(@"背景");
    [self.view addSubview:backimageview];
    [backimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws.view);
        make.height.mas_equalTo(LENGTH(320));
    }];
    
    UIImageView * back = [UIImageView new];
    back.contentMode = UIViewContentModeScaleAspectFill;
    back.image = UIIMAGE(@"icon_login_closebtn");
    [self.view addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+20);
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(20));
        make.width.and.height.mas_equalTo(LENGTH(40));
    }];
    
    back.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapviewtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backview)];
    //将手势添加到需要相应的view中去
    [back addGestureRecognizer:tapviewtap];
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,129,51) LabelFont:TextFont(23) TextAlignment:NSTextAlignmentCenter Text:@"领新手任务"];
    [backimageview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backimageview).with.offset(NavHeight);
        make.centerX.mas_equalTo(backimageview);
    }];
    
    BaseLabel * subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,172,119) LabelFont:TextFont(21) TextAlignment:NSTextAlignmentCenter Text:@"赢取小米平衡车大奖"];
    [backimageview addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(6));
        make.centerX.mas_equalTo(backimageview);
    }];
    
    UIImageView * caidai = [UIImageView new];
    caidai.contentMode = UIViewContentModeScaleAspectFit;
    caidai.image = UIIMAGE(@"奖品");
    [backimageview addSubview:caidai];
    [caidai mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(subtitle.mas_bottom).with.offset(LENGTH(6));
        make.centerX.mas_equalTo(backimageview);
//        make.size.mas_equalTo(caidai.image.size);
        make.width.mas_equalTo(LENGTH(300));
        make.height.mas_equalTo(LENGTH(209));
//        make.bottom.mas_equalTo(backimageview).with.offset(-LENGTH(20));
    }];

    
    UserSQDLView * NewUser = [UserSQDLView new];
    NewUser.userInteractionEnabled = YES;
    [self.view addSubview:NewUser];
    [NewUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backimageview.mas_bottom).with.offset(LENGTH(9));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    BaseLabel * phonedl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(118,134,134) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"手机号登录"];
    
    [self.view addSubview:phonedl];
    [phonedl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NewUser.mas_bottom).with.offset(LENGTH(5));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
    }];
    phonedl.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesturedl = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(denglu)];
    //将手势添加到需要相应的view中去
    [phonedl addGestureRecognizer:tapGesturedl];
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [self.view addGestureRecognizer:tapGesture2];
    
    UIImageView *userImageView = [UIImageView new];
    userImageView.image = UIIMAGE(@"天天爱读");
    userImageView.layer.shadowColor = RGB(0, 0, 0).CGColor;
    userImageView.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    userImageView.layer.shadowRadius = LENGTH(10);
    userImageView.layer.shadowOpacity = 0.1;
    [self.view addSubview:userImageView];
    [userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(phonedl.mas_bottom).with.offset(LENGTH(50));
        make.centerX.mas_equalTo(ws.view).with.offset(-LENGTH(37));
        make.width.mas_equalTo(LENGTH(37));
        make.height.mas_equalTo(LENGTH(37));
    }];
    
    BaseLabel * name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(92, 92, 92) LabelFont:TextFontCu(13) TextAlignment:NSTextAlignmentCenter Text:@"博万卷"];
    [self.view addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(userImageView);
        make.left.mas_equalTo(userImageView.mas_right).with.offset(LENGTH(10));
    }];
}
- (void)denglu{
    UserPhoneDlViewController * vc = [UserPhoneDlViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tapGesture2{
//    [textFile returnKeyboard];
}

- (void)backview{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
