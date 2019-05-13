//
//  BuyMembersViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/24.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyMembersViewController.h"
#import "BuyMembersView.h"
#import "BuyPaymentButtonView.h"
@interface BuyMembersViewController (){
    UIScrollView * scrollView;
    BuyMembersView * allView;
    BuyPaymentButtonView * buyPay;

}

@end

@implementation BuyMembersViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self LoadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.delegate = self;
    scrollView.backgroundColor = RGB(245,245,245);
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    buyPay = [BuyPaymentButtonView new];
    [self.view addSubview:buyPay];
    [buyPay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws.view);
        make.left.and.right.mas_equalTo(ws.view);
    }];
    [buyPay setReloade:^{
        [ws LoadData];
    }];
    
    allView = [BuyMembersView new];
    [scrollView addSubview:allView];
    [allView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->scrollView);
    }];
    [allView setBuyStyle:^(BuyPackage * _Nonnull pack) {
        [ws up:pack];
    }];
    // Do any additional setup after loading the view.
}
- (void)up:(BuyPackage*)pack{
    buyPay.model = pack;
}
- (void)LoadData{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_MYMEMBER];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            BuyAllModel * model = [BuyAllModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}
- (void)UpData:(BuyAllModel *)model{
        NSCalendarUnit dayInfoUnits  = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour |NSCalendarUnitMinute|NSCalendarUnitSecond;
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        model.student.end_time = [gregorian components:dayInfoUnits fromDate:[BaseObject TimeStringForDate:model.student.member_end_time]];
        model.student.begin_time = [gregorian components:dayInfoUnits fromDate:[BaseObject TimeStringForDate:model.student.member_begin_time]];
    allView.model = model;
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
