//
//  MyMessageXQViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyMessageXQViewController.h"
#import "MyMessageXQModel.h"
@interface MyMessageXQViewController ()<NavDelegate>

@end

@implementation MyMessageXQViewController{
    BaseLabel * title;
    BaseLabel * subtitle;
    BaseLabel * time;
    
    BaseLabel * remove;
}
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"消息" RightTitle:@"home-Click" NativeStyle:NavStyleGeneral];
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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    self.view.backgroundColor = BEIJINGCOLOR;
    WS(ws);
    BaseView * bakView = [BaseView new];
    bakView.backgroundColor = WhitColor;
    [self.view addSubview:bakView];
    [bakView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom);
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
    }];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(17) TextAlignment:NSTextAlignmentLeft Text:@"任务"];
    [bakView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bakView.mas_top).with.offset(LENGTH(19));
        make.centerX.mas_equalTo(bakView);
    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    subtitle.numberOfLines = 0;
    [bakView addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(18));
        make.left.mas_equalTo(bakView.mas_left).with.offset(LENGTH(15));
        make.right.mas_equalTo(bakView.mas_right).with.offset(-LENGTH(15));

    }];
    
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentRight Text:@"2018-05-07  17:41"];
    [bakView addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(bakView.mas_right).with.offset(-LENGTH(20));
        make.top.mas_equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(10));
        make.bottom.mas_equalTo(bakView.mas_bottom).with.offset(-LENGTH(18));
    }];
    
    remove = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(254,127,124) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"删除"];
    remove.backgroundColor = [UIColor clearColor];
    remove.layer.masksToBounds = YES;
    remove.layer.cornerRadius = LENGTH(18);
    remove.layer.borderWidth = LENGTH(1);
    remove.layer.borderColor = RGB(254,127,124).CGColor;
    [self.view addSubview:remove];
    [remove mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bakView.mas_bottom).with.offset(LENGTH(82));
        make.centerX.mas_equalTo(ws.view);
        make.width.mas_equalTo(LENGTH(130));
        make.height.mas_equalTo(LENGTH(36));
    }];
    
    remove.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [remove addGestureRecognizer:tapGesture1];
}
- (void)tapGesture1{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                   message:@"确认要把删除这条消息吗？"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             [self Removie];
                                                         }];
    
    [cancelAction setValue:RGB(24,59,161) forKey:@"titleTextColor"];
    [defaultAction setValue:RGB(14,13,13) forKey:@"titleTextColor"];
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    
    NSMutableAttributedString *hogan1 = [[NSMutableAttributedString alloc] initWithString:@"确认要把删除这条消息吗？"];
    [alert setValue:hogan1 forKey:@"attributedMessage"];
    [self presentViewController:alert animated:YES completion:nil];
    

}

- (void)Removie{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_MessageRemove];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"messageid":_model.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MyMessageXQModel * models = [MyMessageXQModel mj_objectWithKeyValues:responseObject];
            if ([models.code isEqual:@200]) {
                self.block();
                [self.navigationController popViewControllerAnimated:YES];
            }
        }else{
            
        }
    }];
}



- (void)setModel:(MyMessageModel *)model{
    _model = model;
    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_MessageXQ];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"messageid":_model.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MyMessageXQModel * models = [MyMessageXQModel mj_objectWithKeyValues:responseObject];
            if ([models.code isEqual:@200]) {
                [self updata:models];
            }
        }else{
            
        }
    }];
}
- (void)updata:(MyMessageXQModel *)models{
    title.text = models.studentMessageList.title;
    subtitle.text = models.studentMessageList.content;
    time.text = [NSString stringWithFormat:@"%@",models.studentMessageList.create_time];
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
