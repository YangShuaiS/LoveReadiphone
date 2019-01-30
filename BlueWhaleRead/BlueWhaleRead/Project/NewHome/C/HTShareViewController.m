//
//  HTShareViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HTShareViewController.h"
#import "ShareFriendView.h"
#import "NewHpViewModel.h"
@interface HTShareViewController ()<NavDelegate>

@end

@implementation HTShareViewController{
    BaseLabel * label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    self.view.backgroundColor = RGB(251,251,254);
    
    WS(ws);
    label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(23,84,80) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentLeft Text:@"请从以下内容，选取一项分享"];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(25));
        make.left.mas_equalTo(ws.view).with.offset(LENGTH(30));
    }];
    [self wanchengrenwu];

    
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"分享" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.titcolor = RGB(0, 0, 0);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.downlayer = YES;
}
- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
    
}


- (void)wanchengrenwu{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_SHARERW];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    //    NSDictionary * dic = @{@"studentid":@"12"};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HTShareModel * model = [HTShareModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self upwanchengrw:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}

- (void)upwanchengrw:(HTShareModel *)model{
    WS(ws);
    
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",@"bendixinxi"]];
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
    NewHpViewModel * models = [NewHpViewModel mj_objectWithKeyValues:dataDictionary];
    
    int types = [models.shretype intValue];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    NSMutableArray * viewarray = [NSMutableArray array];
    for (HTShareListModel * models in model.missionShareList) {
        ShareFriendView * view = [ShareFriendView new];
        view.model = models;
        [self.view addSubview:view];
        [viewarray addObject:view];
    }
    
    ShareFriendView * lastview;
    for (int i = 0; i < viewarray.count; i++) {
        ShareFriendView * view = viewarray[i];
        if ([models.sharetime isEqualToString:currentTimeString]&&types == i+1) {
            [view endshare];
        }
        view.inter = i+1;
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self->label.mas_bottom).with.offset(LENGTH(26));
                make.left.mas_equalTo(ws.view).with.offset(LENGTH(30));
                make.right.mas_equalTo(ws.view).with.offset(-LENGTH(30));
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(lastview.mas_bottom).with.offset(LENGTH(20));
                make.left.mas_equalTo(ws.view).with.offset(LENGTH(30));
                make.right.mas_equalTo(ws.view).with.offset(-LENGTH(30));
            }];
        }
        lastview = view;
    }
    
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
