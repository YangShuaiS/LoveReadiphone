//
//  FeedbackViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/6.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()<NavDelegate,UITextViewDelegate>

@end

@implementation FeedbackViewController{
    UITextView * textview;
    BaseLabel * _placeholderLabel;
    BaseLabel * dl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BEIJINGCOLOR;
    [self AddNavtion];
    [self Addview];

}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"意见反馈" RightTitle:@"home-Click" NativeStyle:NavStyleGeneral];
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

- (void)Addview{
    WS(ws);
    self.view.backgroundColor = BEIJINGCOLOR;
    BaseView * backVie = [BaseView new];
    backVie.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:backVie];
    [backVie mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(10));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(9));
        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(9));
        make.height.mas_equalTo(LENGTH(184));
    }];
    
    textview = [UITextView new];
    textview.backgroundColor=[UIColor whiteColor]; //背景色
    textview.scrollEnabled = YES;
    textview.delegate = self;      //设置代理方法的实现类
    textview.font=TextFont(16); //设置字体名字和字体大小;
    textview.textColor = RGB(51,51,51);
    textview.textAlignment = NSTextAlignmentLeft;
    textview.text = @"";//设置显示的文本内容
    textview.layer.masksToBounds = YES;
    textview.layer.cornerRadius = LENGTH(0);
//    textview.
    [backVie addSubview:textview];
    [textview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backVie.mas_top).with.offset(LENGTH(5));
        make.left.mas_equalTo(backVie.mas_left).with.offset(LENGTH(5));
        make.right.mas_equalTo(backVie.mas_right).with.offset(-LENGTH(5));
        make.bottom.mas_equalTo(backVie.mas_bottom).with.offset(-LENGTH(5));

    }];
    
    _placeholderLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(142,142,147) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@"200字内"];
    [backVie addSubview:_placeholderLabel];
    [_placeholderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backVie.mas_left).with.offset(LENGTH(5));
        make.top.mas_equalTo(backVie.mas_top).with.offset(LENGTH(10));
    }];
    
    
    dl = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"提交"];
    dl.backgroundColor = RGB(1,195,189);
    dl.layer.masksToBounds = YES;
    dl.layer.cornerRadius = LENGTH(22);
    [self.view addSubview:dl];
    [dl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(backVie.mas_bottom).with.offset(LENGTH(40));
//        make.width.mas_equalTo(500);
        make.left.mas_equalTo(LENGTH(45));
        make.right.mas_equalTo(-LENGTH(45));
        make.height.mas_equalTo(44);
    }];
    dl.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [dl addGestureRecognizer:tapGesture1];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text

{    if (![text isEqualToString:@""])
    
{
    
    _placeholderLabel.hidden = YES;
    
}
    
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1)
        
    {
        
        _placeholderLabel.hidden = NO;
        
    }
    
    return YES;
    
}
- (void)tapGesture1{
    
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在反馈...";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.view addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view);
    }];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_YIJIANFANKUI];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"suggest":textview.text};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomePage * model = [HomePage mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                mb.label.text = @"已反馈";
                [mb hideAnimated:NO afterDelay:1];
                [ws.navigationController popViewControllerAnimated:YES];
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
