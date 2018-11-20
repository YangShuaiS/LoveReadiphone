//
//  UserLoginPerfectViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserLoginPerfectViewController.h"
#import "UserLoginTextFileView.h"
#import "UserLoginClickView.h"
#import "UserLoginGirlOrBoyView.h"
#import "UserLoginWsXXViewController.h"

@interface UserLoginPerfectViewController ()

@end

@implementation UserLoginPerfectViewController{
    UIScrollView * scrollView;
    
    UserLoginTextFileView * yhm;
    UserLoginTextFileView * shengri;
    
    UserLoginGirlOrBoyView *boy;
    UserLoginGirlOrBoyView * girl;
    
    NSString * xb;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addnav];
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(StatusBar+44);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(2,49,49) LabelFont:TextFontCu(25) TextAlignment:NSTextAlignmentCenter Text:@"完善信息"];
    [scrollView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView).with.offset(LENGTH(26));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    BaseLabel * onesubtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(155,177,176) LabelFont:TextFontCu(14) TextAlignment:NSTextAlignmentCenter Text:@"完善信息可以获取个性化图书推荐"];
    [scrollView addSubview:onesubtitle];
    [onesubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(LENGTH(6));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    yhm = [[UserLoginTextFileView alloc] initWithStyle:UserLoginTextFileYHM];
    yhm.titles = @"请填写昵称(限20个字符)";
    [scrollView addSubview:yhm];
    [yhm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(onesubtitle.mas_bottom).with.offset(LENGTH(36));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    BaseLabel * twosubtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(155,177,176) LabelFont:TextFontCu(14) TextAlignment:NSTextAlignmentCenter Text:@"以下内容填写之后不可修改"];
    [scrollView addSubview:twosubtitle];
    [twosubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->yhm.mas_bottom).with.offset(LENGTH(35));
        make.centerX.mas_equalTo(ws.view);
    }];
    
    UIImageView * gth = [UIImageView new];
    gth.image = UIIMAGE(@"组 321");
    [scrollView addSubview:gth];
    [gth mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(twosubtitle);
        make.right.mas_equalTo(twosubtitle.mas_left).with.offset(-LENGTH(5));
        make.width.and.height.mas_equalTo(LENGTH(14));
    }];
    
    shengri = [[UserLoginTextFileView alloc] initWithStyle:UserLoginTextFileClick];
    shengri.titles = @"请选择生日";
    shengri.vc = self;
    [scrollView addSubview:shengri];
    [shengri mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(gth.mas_bottom).with.offset(LENGTH(13));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(25));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(25));
        make.height.mas_equalTo(LENGTH(50));
    }];
//    [shengri setBlock:^{
//        [ws addXhdataPicker];
//    }];
    
    girl = [UserLoginGirlOrBoyView new];
    [girl girl];
    xb = @"2";
    [scrollView addSubview:girl];
    [girl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view).with.offset(-LENGTH(65)-LENGTH(31));
        make.top.mas_equalTo(self->shengri.mas_bottom).with.offset(LENGTH(14));
        make.width.mas_equalTo(LENGTH(62));
    }];
    
    boy = [UserLoginGirlOrBoyView new];
    [boy boy];
    [boy qx];
    [scrollView addSubview:boy];
    [boy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view).with.offset(LENGTH(65)+LENGTH(31));
        make.top.mas_equalTo(self->shengri.mas_bottom).with.offset(LENGTH(14));
        make.width.mas_equalTo(LENGTH(62));
    }];
    girl.userInteractionEnabled = YES;
    boy.userInteractionEnabled = YES;
    UITapGestureRecognizer * girltapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(girltapGesture2)];
    //将手势添加到需要相应的view中去
    [girl addGestureRecognizer:girltapGesture2];
    UITapGestureRecognizer * boytapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boytapGesture2)];
    //将手势添加到需要相应的view中去
    [boy addGestureRecognizer:boytapGesture2];
    
    UserLoginClickView * NewUser = [[UserLoginClickView alloc] initWithImage:@"" Text:@"下一步" Style:UserLoginClickStyleNoml];
    NewUser.userInteractionEnabled = YES;
    [scrollView addSubview:NewUser];
    [NewUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->girl.mas_bottom).with.offset(LENGTH(70));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(50));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(50));
        make.bottom.mas_equalTo(self->scrollView).with.offset(-LENGTH(48));
        make.height.mas_equalTo(LENGTH(50));
    }];
    [NewUser setBlock:^{
        [self pushWSXINXI];
    }];
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [self.view addGestureRecognizer:tapGesture2];
}

- (void)girltapGesture2{
    [girl girlwexuanzhong];
    [boy qx];
    xb = @"2";
}

- (void)boytapGesture2{
    [girl qx];
    [boy boyxuanz];
    xb = @"1";
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

- (void)pushWSXINXI{    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ZHUCE];
    
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
    if (yhm.textField.text.length<=0) {
        mb.label.text = @"用户名为空";
        [mb hideAnimated:NO afterDelay:1];
    }else if ([shengri.djshj.text isEqualToString:@"请选择生日"]){
        mb.label.text = @"生日为空";
        [mb hideAnimated:NO afterDelay:1];
    }
//    else if (){
//        mb.label.text = @"性别为空";
//        [mb hideAnimated:NO afterDelay:1];
//    }
    else{
        NSDictionary * dic = @{@"phone":_itemarray[0],@"password":_itemarray[1],@"username":yhm.textField.text,@"birthday":shengri.djshj.text,@"sex":xb};
        [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
            if (responseObject) {
                MyDeModel * model = [MyDeModel mj_objectWithKeyValues:responseObject];
                if ([model.code isEqual:@200]) {
                    UserLoginWsXXViewController * vc = [UserLoginWsXXViewController new];
                    vc.itemarray = self->_itemarray;
                    [self.navigationController pushViewController:vc animated:YES];                    mb.label.text = model.message;
                    [mb hideAnimated:NO afterDelay:1];
                }else{
                    mb.label.text = model.message;
                    [mb hideAnimated:NO afterDelay:1];
                }
            }else{
                mb.label.text = @"网络请求失败";
                [mb hideAnimated:NO afterDelay:1];
            }

        }];
    }
    

}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
}

- (void)tapGesture2{
    [yhm returnKeyboard];
    [shengri returnKeyboard];
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
