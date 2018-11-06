//
//  AppDelegate.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavigationViewController.h"
#import "MainTabBarViewController.h"
#import "UserLoginViewController.h"
#import "YDYView.h"

#import "DTLianXUanXIang.h"

#import "MOBShareSDKHelper.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)uodatazsfwq{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_GHYM];
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:nil andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
  
        }else{
//                        ZSFWQ = @"http://192.168.1.221:8080/";
                        ZSFWQ = @"http://39.106.100.235:8081/";
        }

    }];
}
- (void)addwenjian{
    NSArray *pathArray =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // 创建一个文件管理器
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *filePath = [[pathArray firstObject] stringByAppendingPathComponent:@"booktext"];
    // 创建文件夹
    [manager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    // 文件是否存在
    BOOL isExists = [manager fileExistsAtPath:filePath];
    // 删除文件
    //    NSString *bookPath = [[pathArray firstObject] stringByAppendingPathComponent:@"book.plist"];
    //    BOOL isDele = [manager removeItemAtPath:bookPath error:nil];
    if (isExists) {
        NSLog(@"文件夹存在");
    }else{
        NSLog(@"文件夹不存在");
        
    }
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self uodatazsfwq];
    [self addwenjian];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(denglu) name:kNotificationDenglu object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tuichudenglu) name:kNotificationTuiChuDenglu object:nil];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    Me = [[MeModel SharedModel] ADDvalue];
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);

    if (Me.ssid.length>0) {
        MainTabBarViewController * main = [MainTabBarViewController new];
        self.window.rootViewController = main;
    }else{
        BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:[UserLoginViewController new]];
        self.window.rootViewController = homenav;
    }

    [self.window makeKeyWindow];
    [self loadModel];
    
    /** App判断第一次启动的方法 */
    NSString *key = @"isFirst";

    BOOL isFirst = [[NSUserDefaults standardUserDefaults] boolForKey:key];
    if (!isFirst) {
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self addYDYView];
    } else {
    }
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [NSThread sleepForTimeInterval:1];
    return YES;

}
- (void)addYDYView{
    WS(ws);
    YDYView * view = [YDYView new];
    [self.window.rootViewController.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.window.rootViewController.view);
    }];
}
- (void)denglu{
    [self.window.rootViewController removeFromParentViewController];
    MainTabBarViewController * main = [MainTabBarViewController new];
    self.window.rootViewController = main;
    [self.window makeKeyAndVisible];
}
- (void)tuichudenglu{
    [self.window.rootViewController removeFromParentViewController];
    BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:[UserLoginViewController new]];
    self.window.rootViewController = homenav;
    [self.window makeKeyAndVisible];
}
void UncaughtExceptionHandler(NSException *exception) {
    /**
     *  获取异常崩溃信息
     */
    NSArray *callStack = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    NSString *content = [NSString stringWithFormat:@"========异常错误报告========\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",name,reason,[callStack componentsJoinedByString:@"\n"]];
    
    NSString *urlStr = [NSString stringWithFormat:@"mailto://1395325260@qq.com?subject=bug报告&body=感谢您的配合!" "错误详情:%@",content];
    
    NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    [[UIApplication sharedApplication] openURL:url];
    
    
//    /**
//     *  把异常崩溃信息发送至开发者邮件
//     */
//    NSMutableString *mailUrl = [NSMutableString string];
//    //添加收件人,如有多个收件人，可以使用componentsJoinedByString方法连接，连接符为","
//    NSString *recipients = @"15718862830@163.com";
//    [mailUrl appendFormat:@"mailto:%@?", recipients];
//    //添加抄送人
//    NSString *ccRecipients = @"1395325260@qq.com";
//    [mailUrl appendFormat:@"&cc=%@", ccRecipients];
//    //添加密送人
////    NSString *bccRecipients = @"15690725786@163.com";
////    [mailUrl appendFormat:@"&bcc=%@", bccRecipients];
//    //添加邮件主题
//    [mailUrl appendFormat:@"&subject=%@",@"程序异常崩溃，请配合发送异常报告，谢谢合作"];
//    //添加邮件内容
//
//    [mailUrl appendString:[NSString stringWithFormat:@"&body=%@",content]];
//
////    [mailUrl appendFormat:@"&body=%@", content];
//    // 打开地址
//    NSString *mailPath = [mailUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailPath]];
}
- (void)loadModel{
    [BookCityModel InitializeModel];//书城
    [HomePage InitializeModel];//首页
    [MyDeModel InitializeModel];//我的
    [ZHUTIMODEL InitializeModel];//主题
    [AchievementModel InitializeModel];//成就报表
    [SearchCitBookModel InitializeModel];//搜索
    [MyMessageListModel InitializeModel];//
    [MonthPMModel InitializeModel];
    [ClassBJDTModel InitializeModel];//班级动态
    [MyBadgeListModel InitializeModel];//我的勋章
    [TKJIEGUOMODEL InitializeModel];//挑战结果
    [HomeFriendHYHModel InitializeModel];//首页换一换
    [JoinBookModel InitializeModel];//加入书架弹出视图
    
    [BookXQModel InitializeModel];
    [MedalListModel InitializeModel];
    [MedalListXqModel InitializeModel];
    [UnreadBookListModel InitializeModel];
    [ReadBookListModel InitializeModel];
    [MyClassListModel InitializeModel];
    [FriendCodeModel InitializeModel];
    [TheTopPicModel InitializeModel];
    [TXXunZhangModel InitializeModel];
    [ShiZiLiangModel InitializeModel];
    [ShiCiLiangModel InitializeModel];
    [FoundModel InitializeModel];
    [LCBMilestone InitializeModel];
    [ZhiShiShuModel InitializeModel];//知识树
    [ZhiShiShuXqModel InitializeModel];
    [ZhiShiShuFLModel InitializeModel];//知识树分类
    [UserCityModel InitializeModel];//城市
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"BlueWhaleRead"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
//                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"application:openURL:sourceApplication:annotation:");
    //    [self application:application handleOpenURL:url];
    return  YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    NSLog(@"application:handleOpenURL:");
    //    [self application:application openURL:url sourceApplication:nil annotation:nil];
    return  YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    return  YES;
}
@end
