//
//  NHMingYanViewTabView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/26.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NHMingYanViewTabView.h"
#import "NHMingYanViewTableViewCell.h"
@interface NHMingYanViewTabView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation NHMingYanViewTabView{
    SSDKPlatformType platformType;

}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.separatorStyle = UITableViewStylePlain;
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];
        //使tableview无数据时候无下划线
        self.tableFooterView = [[UIView alloc]init];
        self.estimatedRowHeight = 300;//估算高度
        self.rowHeight = UITableViewAutomaticDimension;
        platformType = SSDKPlatformSubTypeWechatSession;
//        self.scrollEnabled = NO;
        //        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _itemarray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    NHMingYanViewTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[NHMingYanViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.model = _itemarray[indexPath.row];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [UIView new];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self shareMiniProgram];
}
- (void)shareMiniProgram
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters SSDKSetupWeChatMiniProgramShareParamsByTitle:@"测试"
                                                 description:@"测试"
                                                  webpageUrl:[NSURL URLWithString:@"http://www.mob.com"]
                                                        path:@"pages/showsystem/showsystem?txid=5c80daac8ffaed7d746519e6"
                                                  thumbImage:[[NSBundle mainBundle] pathForResource:@"礼物盒" ofType:@"gif"]
                                                hdThumbImage:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522154322305&di=7f4bf3d0803fe8c2c66c140f0a6ea0b4&imgtype=0&src=http%3A%2F%2Fa4.topitme.com%2Fo%2F201007%2F29%2F12803876734174.jpg"
                                                    userName:@"gh_c8cdee2a68eb"
                                             withShareTicket:YES
                                             miniProgramType:0
                                          forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    
    [self shareWithParameters:parameters];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}



- (void)shareWithParameters:(NSMutableDictionary *)parameters
{
    if(parameters.count == 0){
        return;
    }
    [ShareSDK share:platformType
         parameters:parameters
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         return;
     }];
}
@end
