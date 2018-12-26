//
//  TPHBViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TPHBViewController.h"
#import "TPHBTableView.h"
@interface TPHBViewController ()
@property (strong, nonatomic) TPHBTableView *tableView;

@end

@implementation TPHBViewController
- (void)setType:(NSString *)type{
    _type = type;
    [self LoadData];
}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_MRT];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"type":_type,@"missionid":_missionid};
    //    NSDictionary * dic = @{@"studentid":@"12"};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TFameViewModel * model = [TFameViewModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}
- (void)UpData:(TFameViewModel *)model{
    NSMutableArray * itemarray = model.studentRankList;
    if (model.student.myRank.length == 0 || ![model.student.myRank isEqualToString:@"0"]) {
        [itemarray insertObject:model.student atIndex:0];
        _tableView.bianse = @"1";
    }
    _tableView.nav = self.navigationController;
    _tableView.missionid = _missionid;
    _tableView.itemArray = itemarray;
}
- (void)setBianse:(NSString *)bianse{
    _tableView.bianse = bianse;

}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    _tableView.nav = self.nav;
    _tableView.missionid = @"1";
    _tableView.itemArray = itemarray;
    WS(ws);
    [_tableView setBlock:^{
        ws.block();
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(255,214,98);
    self.view.layer.cornerRadius = LENGTH(10);
    self.view.layer.masksToBounds = YES;
    self.view.layer.borderWidth = LENGTH(5);
    self.view.layer.borderColor = RGB(255,214,98).CGColor;
    
    WS(ws);
    _tableView = [TPHBTableView new];
    _tableView.nav = self.navigationController;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view).with.insets(UIEdgeInsetsMake(LENGTH(5), LENGTH(5), LENGTH(5), LENGTH(5)));
    }];
    // Do any additional setup after loading the view.
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
