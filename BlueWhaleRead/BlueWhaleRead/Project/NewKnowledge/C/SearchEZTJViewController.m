//
//  SearchEZTJViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/21.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchEZTJViewController.h"
#import "SearchRelatedTableView.h"

@interface SearchEZTJViewController ()<NavDelegate>

@end

@implementation SearchEZTJViewController{
    SearchRelatedTableView * tableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self AddNavtion];
    
    WS(ws);
    tableview = [SearchRelatedTableView new];
    [self.view addSubview:tableview];
    [tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(LENGTH(0));
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(LENGTH(6));
        make.right.equalTo(ws.view).with.offset(LENGTH(0));
        make.bottom.equalTo(ws.view);
    }];
    [self LoadData];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:_titles RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    self.navtive.titcolor = RGB(31, 31, 31);
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
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_ZHISHIWENZHANG];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            NewKnowledgeModel * model = [NewKnowledgeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}
- (void)UpData:(NewKnowledgeModel *)model{
    tableview.itemarray = model.goodBannerList;
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
