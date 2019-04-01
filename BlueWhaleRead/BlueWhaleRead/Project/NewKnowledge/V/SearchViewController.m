//
//  SearchViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchView.h"

#import "SearchAllViewController.h"
#import "SearchWenZhangViewController.h"
#import "SearchBookJiViewController.h"
#import "SearchZSWViewController.h"
@interface SearchViewController ()

@end

@implementation SearchViewController{
    NSMutableArray *childVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    SearchView * view = [SearchView new];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    [view setBlock:^(NSString *str) {
        [ws LoadDate:str];
    }];
    childVC = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        if (i == 0) {
            SearchAllViewController * vcs = [SearchAllViewController new];
            [self addChildViewController:vcs];
            [childVC addObject:vcs];
            [vcs setBlock:^(NSString * _Nonnull string) {
                view.title = string;
            }];
            [vcs setPushblock:^(NSInteger inter) {
                view.inter = inter;
            }];
        }
//        else if (i == 1){
//            SearchWenZhangViewController * vcs = [SearchWenZhangViewController new];
//            [self addChildViewController:vcs];
//            [childVC addObject:vcs];
//        }
    else if (i == 1){
            SearchBookJiViewController * vcs = [SearchBookJiViewController new];
            [self addChildViewController:vcs];
            [childVC addObject:vcs];
        }else if (i == 2){
            SearchZSWViewController * vcs = [SearchZSWViewController new];
            [self addChildViewController:vcs];
            [childVC addObject:vcs];
        }
        else{
            UIViewController * vcs = [UIViewController new];
            [self addChildViewController:vcs];
            [childVC addObject:vcs];
        }
   
    }
    view.controllerArray = childVC;
    // Do any additional setup after loading the view.
}


- (void)LoadDate:(NSString *)title{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_SOUSUOALL];
    //studentid 学生id
    NSDictionary * dic = @{@"studentid":Me.ssid,@"bookName":title};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ALLSearchModel * model = [ALLSearchModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}
- (void)UpData:(ALLSearchModel *)model{
    for (int i = 0; i < childVC.count; i++) {
        if (i == 0) {
            SearchAllViewController * vcs = childVC[i];
            vcs.model = model;
        }
//        else if (i ==1){
//            SearchWenZhangViewController * vcs = childVC[i];
//            vcs.model = model;
//        }
        else if (i == 1){
            SearchBookJiViewController * vcs = childVC[i];
            vcs.model = model;
        }else if (i == 2){
            SearchZSWViewController * vcs = childVC[i];
            vcs.model = model;
        }
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
