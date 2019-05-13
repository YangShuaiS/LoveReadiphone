//
//  PersonSZTableView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "PersonSZTableView.h"
#import "PersonalTableViewCell.h"
#import "FeedbackViewController.h"
#import "AboutViewController.h"
#import "PersonQingChuHUanCunView.h"
#import "PersonXiuGaiMimaViewController.h"

#import "BaseNavigationViewController.h"
#import "UserLoginViewController.h"
#import "UserXZageView.h"
#import "PersonalViewController.h"
#import <AdSupport/AdSupport.h>
@interface PersonSZTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation PersonSZTableView{
    NSArray * titleArray;
    NSArray * subArray;
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
    }
    return self;
}

- (void)setModel:(MyZiLiaoModel *)model{
    _model = model;
    NSString * currentVolum = [self HuanCunDaXiao];
    if ([Me.is_rebot isEqualToString:@"2"]) {
        titleArray = @[@"个人资料",@"消息推送",@"清除缓存",@"意见反馈",@"关于博万卷",@"退出登录"];
    }else{
        titleArray = @[@"个人资料",@"消息推送",@"清除缓存",@"意见反馈",@"关于博万卷",@"登录"];
    }
    subArray = @[@"",@"",currentVolum,@"",@"",@""];
    [self reloadData];
}
- (NSString *)HuanCunDaXiao{
    NSUInteger intg = [[SDImageCache sharedImageCache] getSize];
    //
    NSString * currentVolum = [NSString stringWithFormat:@"%@",[self fileSizeWithInterge:intg]];
    return currentVolum;
}

//计算出大小
- (NSString *)fileSizeWithInterge:(NSInteger)size{
    NSArray *pathArray =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[pathArray firstObject] stringByAppendingPathComponent:@"booktext"];
    NSString *filePathtwo = [[pathArray firstObject] stringByAppendingPathComponent:@"DZMeBookRead"];
    float booktext = [self folderSizeAtPath:filePath];
    float DZMeBookRead = [self folderSizeAtPath:filePathtwo];
    size = booktext+DZMeBookRead+size;
    // 1k = 1024, 1m = 1024k
    if (size < 1024) {// 小于1k
        return [NSString stringWithFormat:@"%ldB",(long)size];
    }else if (size < 1024 * 1024){// 小于1m
        CGFloat aFloat = size/1024;
        return [NSString stringWithFormat:@"%.0fK",aFloat];
    }else if (size < 1024 * 1024 * 1024){// 小于1G
        CGFloat aFloat = size/(1024 * 1024);
        return [NSString stringWithFormat:@"%.1fM",aFloat];
    }else{
        CGFloat aFloat = size/(1024*1024*1024);
        return [NSString stringWithFormat:@"%.1fG",aFloat];
    }
}
- (float)folderSizeAtPath:(NSString *)folderPath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil)
    {
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize;
}
- (long long)fileSizeAtPath:(NSString*)filePath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = [NSString stringWithFormat:@"cell%ld",(long)indexPath.row];
    PersonalTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
//        if (indexPath.row == 0){
//            cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewDownStyle];
//        }else
        if (indexPath.row == 1){
            cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewDownSwith];

        }else{
            cell=[[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid ViewStyle:ViewDownClickStyle];

        }
    }
    cell.nav = self.nav;
    cell.title = titleArray[indexPath.row];
    cell.subtitle = subArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return
//}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
-(NSArray *)cellsForTableView:(UITableView *)tableView
{
    NSInteger sections = tableView.numberOfSections;
    NSMutableArray *cells = [[NSMutableArray alloc]  init];
    for (int section = 0; section < sections; section++) {
        NSInteger rows =  [tableView numberOfRowsInSection:section];
        for (int row = 0; row < rows; row++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            [cells addObject:[tableView cellForRowAtIndexPath:indexPath]];
        }
    }
    return cells;
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(231,242,242);
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WS(ws);
    if (indexPath.row == 0) {
        [self push];
    }else if (indexPath.row == 2) {
        PersonQingChuHUanCunView * xuanze = [PersonQingChuHUanCunView new];
        [self.nav.view addSubview:xuanze];
        [xuanze mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.nav.view);
        }];
        [xuanze setBlock:^{
            [ws qingchu];
        }];
    }else if (indexPath.row == 3){
        FeedbackViewController * vc = [FeedbackViewController new];
        [self.nav pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        AboutViewController * vc = [AboutViewController new];
        [self.nav pushViewController:vc animated:YES];
    }else if (indexPath.row == 5){
        if ([Me.is_rebot isEqualToString:@"2"]) {
            [self tuichudenglu];
        }else{
            BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:[UserLoginViewController new]];
            [[self viewController] presentViewController:homenav animated:YES completion:^{
                
            }];
        }
    }
    
}
- (void)push{
    PersonalViewController * vc = [PersonalViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
}
#pragma mark  - 退出
- (void)hqid:(NSString *)nianji{
    WS(ws);
    NSString * idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_HQID];
    NSDictionary * dic = @{@"uuid":[[UIDevice currentDevice] identifierForVendor].UUIDString,@"level":nianji,@"idfa":idfa};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                NSString *filePatch = [BaseObject AddPathName:UserMe];
                Me = [MeModel mj_objectWithKeyValues:m.studentInfo];
                NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
                NSDictionary * dics = m.studentInfo;
                [usersDic setObject:dics forKey:UserMe];
                [usersDic writeToFile:filePatch atomically:YES];
                [[self viewController].navigationController popViewControllerAnimated:YES];
            }else if ([m.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
//            [ws hqid:nianji];
        }
    }];
    
}
- (void)addnianji{
    WS(ws);
    UserXZageView * view = [UserXZageView new];
    [self.window  addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.window);
    }];
    [view setBlock:^(NSString * _Nonnull str) {
        [ws bdstr:str];
        
    }];
    
}
- (void)bdstr:(NSString *)str{
    [[NSUserDefaults standardUserDefaults] setValue:str forKey:kNotificationNianJi];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self hqid:str];
}
- (void)QINGCHU{
    NSString *filePatch = [BaseObject AddPathName:UserMe];
    NSMutableDictionary *WXDic = [NSMutableDictionary dictionary];
    NSDictionary * dic = [NSDictionary dictionary];
    [WXDic setObject:dic forKey:UserMe];
    [WXDic writeToFile:filePatch atomically:YES];
//    NSNotification *notification =[NSNotification notificationWithName:kNotificationTuiChuDenglu object:nil userInfo:nil];
//    [[NSNotificationCenter defaultCenter] postNotification:notification];
    //    Me = [[MeModel SharedModel] ADDvalue];
    //        Me = nil;
    //    Me.token = @"";
}

- (void)tuichudenglu{
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在退出...";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = NO;
    [self.nav.view addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.nav.view);
    }];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TCDL];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            MyDeModel * model = [MyDeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [ws QINGCHU];
                NSString * nianji  = [[NSUserDefaults standardUserDefaults] objectForKey:kNotificationNianJi];
                if (nianji == nil || [nianji isEqualToString:@""]) {
                    [self addnianji];
                }else{
                    [self hqid:nianji];
                }
            }else if ([model.code isEqual:@Notloggedin]){
                [ws UpDengLu];
            }
            mb.label.text = @"退出成功";
            [mb hideAnimated:NO afterDelay:1];
        }else{
            mb.label.text = @"网络请求失败";
            [mb hideAnimated:NO afterDelay:1];
        }
    }];
}

- (void)qingchu{
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    [[SDImageCache sharedImageCache] clearMemory];//可不写
    NSString * currentVolum = [self HuanCunDaXiao];
    subArray = @[@"",currentVolum,@"",@"",@"",@""];
    // 创建一个文件管理器
    NSArray *pathArray =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *filePath = [[pathArray firstObject] stringByAppendingPathComponent:@"booktext"];
    NSString *filePathtwo = [[pathArray firstObject] stringByAppendingPathComponent:@"DZMeBookRead"];
    [manager removeItemAtPath:filePathtwo error:nil];
    BOOL isDele = [manager removeItemAtPath:filePath error:nil];
        if (isDele) {
            // 创建文件夹
            [manager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
            // 文件是否存在
            [manager fileExistsAtPath:filePath];
            [self reloadData];
        }else{
    
        }
}

@end
