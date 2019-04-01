//
//  AppDelegate.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "AppDelegate.h"
#import "CYLPlusButtonSubclass.h"

#import "BaseNavigationViewController.h"
#import "MainTabBarController.h"
#import "UserLoginViewController.h"
#import "DTLianXUanXIang.h"
#import "WXApi.h"

#import "YDYViewController.h"

#import <Bugly/Bugly.h>
#import "JPUSHService.h"
// iOS10 注册 APNs 所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
@interface AppDelegate ()<WXApiDelegate,JPUSHRegisterDelegate,CYLTabBarControllerDelegate,UITabBarControllerDelegate>
@property (nonatomic, weak) UIButton *selectedCover;

@end

@implementation AppDelegate
#define RANDOM_COLOR [UIColor colorWithHue: (arc4random() % 256 / 256.0) saturation:((arc4random()% 128 / 256.0 ) + 0.5) brightness:(( arc4random() % 128 / 256.0 ) + 0.5) alpha:1]

- (void)uodatazsfwq{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_GHYM];
        NSString * str = APP_VERSION;
        NSString *sysVersion = [[UIDevice currentDevice] systemName]; //获取系统名称 例如：iPhone OS
        NSString *sysVersions = [[UIDevice currentDevice] systemVersion]; //获取系统版本 例如：9.2
        
        NSDictionary * dic = @{@"UUID":[[UIDevice currentDevice] identifierForVendor].UUIDString,@"mobileModel":[BaseObject deviceModelName],@"os":sysVersion,@"osVersion":sysVersions,@"appVersionCode":str};
        [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
            if (responseObject) {
                
            }else{
//                            ZSFWQ = @"http://39.106.100.235/";
            }
        }];
    });
}
- (void)addwenjian{
    NSArray *pathArray =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // 创建一个文件管理器
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *filePath = [[pathArray firstObject] stringByAppendingPathComponent:@"booktext"];
    // 创建文件夹
    [manager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    // 文件是否存在
    [manager fileExistsAtPath:filePath];
    // 删除文件
    //    NSString *bookPath = [[pathArray firstObject] stringByAppendingPathComponent:@"book.plist"];
    //    BOOL isDele = [manager removeItemAtPath:bookPath error:nil];
//    if (isExists) {
//        NSLog(@"文件夹存在");
//    }else{
//        NSLog(@"文件夹不存在");
//    }
}

- (void)jiantingwangluo{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
//                NSLog(@"未识别的网络");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
//                NSLog(@"不可达的网络(未连接)");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                [self uodatazsfwq];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [self uodatazsfwq];
                break;
            default:
                break;
        }
    }];
    [manager startMonitoring];

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [WXApi registerApp:@"wx5b092cd426a86253"];
    [Bugly startWithAppId:@"b5582f5e48"];
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    if (@available(iOS 12.0, *)) {
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|JPAuthorizationOptionProvidesAppNotificationSettings;
    } else {
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
        // Fallback on earlier versions
    }
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 可以添加自定义 categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];

    [JPUSHService setupWithOption:launchOptions appKey:@"4e472e2fb2a2991cadc6a1a0"
                          channel:@"appstore"
                 apsForProduction:NO
            advertisingIdentifier:nil];
    //2.1.9版本新增获取registration id block接口。
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        if(resCode == 0){
            NSLog(@"registrationID获取成功：%@",registrationID);
            
        }
        else{
            NSLog(@"registrationID获取失败，code：%d",resCode);
        }
    }];
    
    
    
    [self jiantingwangluo];
    [self addwenjian];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(denglu) name:kNotificationDenglu object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tuichudenglu) name:kNotificationTuiChuDenglu object:nil];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    Me = [[MeModel SharedModel] ADDvalue];
    //发送错误文件
//    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    [self loadModel];
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
//    UILocalNotification *localNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
//    if (localNotification) {
//        NSLog(@"Recieved Notification === %@",localNotification);
//    }
    
    /** App判断第一次启动的方法 */
    NSString *key = @"isFirst";
    BOOL isFirst = [[NSUserDefaults standardUserDefaults] boolForKey:key];
    if (!isFirst) {
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
        BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:[YDYViewController new]];
        self.window.rootViewController = homenav;
        [self.window makeKeyAndVisible];
    }else{
        [CYLPlusButtonSubclass registerPlusButton];
        MainTabBarController * main = [MainTabBarController new];
        main.delegate = self;
        [main hideTabBadgeBackgroundSeparator];
        [self customizeInterfaceWithTabBarController:main];
        self.window.rootViewController = main;
        [self.window makeKeyWindow];
    }

    [NSThread sleepForTimeInterval:1];
    return YES;

}

- (void)denglu{
    [self.window.rootViewController removeFromParentViewController];
    [CYLPlusButtonSubclass registerPlusButton];
    MainTabBarController * main = [MainTabBarController new];
    main.delegate = self;
    [main hideTabBadgeBackgroundSeparator];
    [self customizeInterfaceWithTabBarController:main];
    self.window.rootViewController = main;
    [self.window makeKeyWindow];
}
- (void)tuichudenglu{
    [self.window.rootViewController removeFromParentViewController];
    BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:[UserLoginViewController new]];
    self.window.rootViewController = homenav;
    [self.window makeKeyAndVisible];
}
//void UncaughtExceptionHandler(NSException *exception) {
//    /**
//     *  获取异常崩溃信息
//     */
//    NSArray *callStack = [exception callStackSymbols];
//    NSString *reason = [exception reason];
//    NSString *name = [exception name];
//    NSString *content = [NSString stringWithFormat:@"========异常错误报告========\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",name,reason,[callStack componentsJoinedByString:@"\n"]];
//    
//    NSString *urlStr = [NSString stringWithFormat:@"mailto://1395325260@qq.com?subject=bug报告&body=感谢您的配合!" "错误详情:%@",content];
//    
//    NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
//    [[UIApplication sharedApplication] openURL:url];
//    
//    
////    /**
////     *  把异常崩溃信息发送至开发者邮件
////     */
////    NSMutableString *mailUrl = [NSMutableString string];
////    //添加收件人,如有多个收件人，可以使用componentsJoinedByString方法连接，连接符为","
////    NSString *recipients = @"15718862830@163.com";
////    [mailUrl appendFormat:@"mailto:%@?", recipients];
////    //添加抄送人
////    NSString *ccRecipients = @"1395325260@qq.com";
////    [mailUrl appendFormat:@"&cc=%@", ccRecipients];
////    //添加密送人
//////    NSString *bccRecipients = @"15690725786@163.com";
//////    [mailUrl appendFormat:@"&bcc=%@", bccRecipients];
////    //添加邮件主题
////    [mailUrl appendFormat:@"&subject=%@",@"程序异常崩溃，请配合发送异常报告，谢谢合作"];
////    //添加邮件内容
////
////    [mailUrl appendString:[NSString stringWithFormat:@"&body=%@",content]];
////
//////    [mailUrl appendFormat:@"&body=%@", content];
////    // 打开地址
////    NSString *mailPath = [mailUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
////    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailPath]];
//}
- (void)loadModel{
    [NewHomeModel InitializeModel];//新首页
    [NewKnowledgeModel InitializeModel];//知识网首页
    [ALLSearchModel InitializeModel];//搜索Model
    [TKAllTaskModel InitializeModel];//任务列表
    [LunBoTuXQModel InitializeModel];//轮播图
    [MyFavoritesModel InitializeModel];//我的收藏
    
    [BookCityModel InitializeModel];//书城
    [HomePage InitializeModel];//首页
    [MyDeModel InitializeModel];//我的
    [ZHUTIMODEL InitializeModel];//主题
    [AchievementModel InitializeModel];//成就报表
    [SearchCitBookModel InitializeModel];//搜索
    [MyMessageListModel InitializeModel];//
    [MonthPMModel InitializeModel];
    [MyBadgeListModel InitializeModel];//我的勋章
    [TKJIEGUOMODEL InitializeModel];//挑战结果
    [JoinBookModel InitializeModel];//加入书架弹出视图
    [UserLoginModel InitializeModel];//获取年级
    
    [BookXQModel InitializeModel];
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
    [NBCALLModel InitializeModel];//新书城
    
    [self onechushihua];
}
- (void)onechushihua{

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
    JPushNotificationIdentifier *identifier = [[JPushNotificationIdentifier alloc] init];
    identifier.identifiers = nil;
    if (@available(iOS 10.0, *)) {
        identifier.delivered = YES;
    } else {
        // Fallback on earlier versions
    }
    identifier.findCompletionHandler = ^(NSArray *results) {
        NSLog(@"查找所有通知 - 返回结果为：%@", results);
//        NSString *title = [NSString stringWithFormat:@"查找所有通知 %ld 条",results.count];
//        NSString *message = [NSString stringWithFormat:@"%@",results];
//        [self showAlertControllerWithTitle:title message:message];
    };
    [JPUSHService findNotification:identifier];

    [[UIApplication sharedApplication]setApplicationIconBadgeNumber:0];
    [JPUSHService setBadge:0];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer  API_AVAILABLE(ios(10.0)){
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            if (@available(iOS 10.0, *)) {
                _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"BlueWhaleRead"];
            } else {
                // Fallback on earlier versions
            }
            if (@available(iOS 10.0, *)) {
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
            } else {
                // Fallback on earlier versions
            }
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
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options NS_AVAILABLE_IOS(9_0); // no equiv. notification. return NO if the application can't open for some reason
{
    return [WXApi handleOpenURL:url delegate:self];
}


-(void) onReq:(BaseReq*)reqonReq{
    
}
-(void) onResp:(BaseResp*)resp{
    if([resp isKindOfClass:[SendAuthResp class]]){//判断是否为授权登录类
        
        SendAuthResp *req = (SendAuthResp *)resp;
        
        if([req.state isEqualToString:@"123"]){//微信授权成功
            
        }
    }
    
    if([resp isKindOfClass:[WXSubscribeMsgResp class]]){//判断是否为授权登录类
        WXSubscribeMsgResp *req = (WXSubscribeMsgResp *)resp;
    }
}
-(BOOL) sendReq:(BaseReq*)req{
    return YES ;
}

-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    if (self.allowRotation) {//如果设置了allowRotation属性，支持全屏
        return UIInterfaceOrientationMaskAll;
    }
    return UIInterfaceOrientationMaskPortrait;//默认全局不支持横屏
}
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}
- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [JPUSHService handleRemoteNotification:userInfo];
    NSLog(@"iOS6及以下系统，收到通知:%@", [self logDic:userInfo]);
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:
(void (^)(UIBackgroundFetchResult))completionHandler {
    [JPUSHService handleRemoteNotification:userInfo];
    NSLog(@"iOS7及以上系统，收到通知:%@", [self logDic:userInfo]);
    
    if ([[UIDevice currentDevice].systemVersion floatValue]<10.0 || application.applicationState>0) {
    }
    
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application
didReceiveLocalNotification:(UILocalNotification *)notification {
    [JPUSHService showLocalNotificationAtFront:notification identifierKey:nil];
}

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#pragma mark- JPUSHRegisterDelegate
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    NSDictionary * userInfo = notification.request.content.userInfo;
    
    UNNotificationRequest *request = notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; // 收到推送的消息内容
    
    NSNumber *badge = content.badge;  // 推送消息的角标
    NSString *body = content.body;    // 推送消息体
    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    NSString *title = content.title;  // 推送消息的标题
    
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        NSLog(@"iOS10 前台收到远程通知:%@", [self logDic:userInfo]);
        
    }
    else {
        // 判断为本地通知
        NSLog(@"iOS10 前台收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
    }
    completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以设置
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    UNNotificationRequest *request = response.notification.request; // 收到推送的请求
    UNNotificationContent *content = request.content; // 收到推送的消息内容
    
    NSNumber *badge = content.badge;  // 推送消息的角标
    NSString *body = content.body;    // 推送消息体
    UNNotificationSound *sound = content.sound;  // 推送消息的声音
    NSString *subtitle = content.subtitle;  // 推送消息的副标题
    NSString *title = content.title;  // 推送消息的标题
    
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        NSLog(@"iOS10 收到远程通知:%@", [self logDic:userInfo]);
        
    }
    else {
        // 判断为本地通知
        NSLog(@"iOS10 收到本地通知:{\nbody:%@，\ntitle:%@,\nsubtitle:%@,\nbadge：%@，\nsound：%@，\nuserInfo：%@\n}",body,title,subtitle,badge,sound,userInfo);
    }
    
    completionHandler();  // 系统要求执行这个方法
}
#endif

#ifdef __IPHONE_12_0
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{
//    NSString *title = nil;
//    if (notification) {
//        title = @"从通知界面直接进入应用";
//    }else{
//        title = @"从系统设置界面进入应用";
//    }
//    UIAlertView *test = [[UIAlertView alloc] initWithTitle:title
//                                                   message:@"pushSetting"
//                                                  delegate:self
//                                         cancelButtonTitle:@"yes"
//                                         otherButtonTitles:nil, nil];
//    [test show];
    
}
#endif

// log NSSet with UTF8
// if not ,log will be \Uxxx
- (NSString *)logDic:(NSDictionary *)dic {
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    [NSPropertyListSerialization propertyListFromData:tempData
                                     mutabilityOption:NSPropertyListImmutable
                                               format:NULL
                                     errorDescription:NULL];
    return str;
}
#pragma mark -JPUSHGeofenceDelegate
//进入地理围栏区域
- (void)jpushGeofenceIdentifer:(NSString * _Nonnull)geofenceId didEnterRegion:(NSDictionary * _Nullable)userInfo error:(NSError * _Nullable)error{
    NSLog(@"进入地理围栏区域");
    if (error) {
        NSLog(@"error = %@",error);
        return;
    }
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {
        [self testAlert:userInfo];
    }else{
        // 进入后台
        [self geofenceBackgroudTest:userInfo];
    }
}
//离开地理围栏区域
- (void)jpushGeofenceIdentifer:(NSString * _Nonnull)geofenceId didExitRegion:(NSDictionary * _Nullable)userInfo error:(NSError * _Nullable)error{
    NSLog(@"离开地理围栏区域");
    if (error) {
        NSLog(@"error = %@",error);
        return;
    }
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {
        [self testAlert:userInfo];
    }else{
        // 进入后台
        [self geofenceBackgroudTest:userInfo];
    }
}
//
- (void)geofenceBackgroudTest:(NSDictionary * _Nullable)userInfo{
    //静默推送：
    if(!userInfo){
        NSLog(@"静默推送的内容为空");
        return;
    }
    //TODO
    
}

- (void)testAlert:(NSDictionary*)userInfo{
    if(!userInfo){
        NSLog(@"messageDict 为 nil ");
        return;
    }
    NSString *title = userInfo[@"title"];
    NSString *body = userInfo[@"content"];
    if (title &&  body ) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:body delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
}




- (void)setSelectedCoverShow:(BOOL)show {
    if (_selectedCover.superview && show) {
        [self addOnceScaleAnimationOnView:_selectedCover];
        return;
    }
    UIControl *selectedTabButton = [[self cyl_tabBarController].viewControllers[0].tabBarItem cyl_tabButton];
    if (show && !_selectedCover.superview) {
        UIButton *selectedCover = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [UIImage imageNamed:@"home_select_cover"];
        [selectedCover setImage:image forState:UIControlStateNormal];
        selectedCover.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        if (selectedTabButton) {
            selectedCover.center = CGPointMake(selectedTabButton.cyl_tabImageView.center.x, selectedTabButton.center.y);
            [self addOnceScaleAnimationOnView:selectedCover];
            [selectedTabButton addSubview:(_selectedCover = selectedCover)];
            [selectedTabButton bringSubviewToFront:_selectedCover];
        }
    } else if (_selectedCover.superview){
        [_selectedCover removeFromSuperview];
        _selectedCover = nil;
    }
    if (selectedTabButton) {
        selectedTabButton.cyl_tabLabel.hidden =
        (show );
        selectedTabButton.cyl_tabImageView.hidden = (show);
    }
}

//缩放动画
- (void)addOnceScaleAnimationOnView:(UIView *)animationView {
    //需要实现的帧动画，这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@0.5, @1.0];
    animation.duration = 0.1;
    //    animation.repeatCount = repeatCount;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}

- (void)customizeInterfaceWithTabBarController:(CYLTabBarController *)tabBarController {
    //设置导航栏
    [self setUpNavigationBarAppearance];
    
    [tabBarController hideTabBadgeBackgroundSeparator];
    //添加小红点
//    UIViewController *viewController = tabBarController.viewControllers[0];
//    UIView *tabBadgePointView0 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
//    [viewController.tabBarItem.cyl_tabButton cyl_setTabBadgePointView:tabBadgePointView0];
//    [viewController cyl_showTabBadgePoint];
//
//    UIView *tabBadgePointView1 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
//    @try {
//        [tabBarController.viewControllers[1] cyl_setTabBadgePointView:tabBadgePointView1];
//        [tabBarController.viewControllers[1] cyl_showTabBadgePoint];
//
//        UIView *tabBadgePointView2 = [UIView cyl_tabBadgePointViewWithClolor:RANDOM_COLOR radius:4.5];
//        [tabBarController.viewControllers[2] cyl_setTabBadgePointView:tabBadgePointView2];
//        [tabBarController.viewControllers[2] cyl_showTabBadgePoint];
//
//        [tabBarController.viewControllers[3] cyl_showTabBadgePoint];
//
//        //添加提示动画，引导用户点击
//        [self addScaleAnimationOnView:tabBarController.viewControllers[3].cyl_tabButton.cyl_tabImageView repeatCount:20];
//    } @catch (NSException *exception) {}
    
}

/**
 *  设置navigationBar样式
 */
- (void)setUpNavigationBarAppearance {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    UIImage *backgroundImage = nil;
    NSDictionary *textAttributes = nil;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        backgroundImage = [UIImage imageNamed:@"navigationbar_background_tall"];
        
        textAttributes = @{
                           NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
                           NSForegroundColorAttributeName : [UIColor whiteColor],
                           };
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
        backgroundImage = [UIImage imageNamed:@"navigationbar_background"];
        textAttributes = @{
                           UITextAttributeFont : [UIFont boldSystemFontOfSize:18],
                           UITextAttributeTextColor : [UIColor blackColor],
                           UITextAttributeTextShadowColor : [UIColor clearColor],
                           UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero],
                           };
#endif
    }
    
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    
}


#pragma mark - delegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    BOOL should = YES;
    [[self cyl_tabBarController] updateSelectionStatusIfNeededForTabBarController:tabBarController shouldSelectViewController:viewController];
    return should;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    UIView *animationView;
    //    NSLog(@"🔴类名与方法名：%@（在第%@行），描述：tabBarChildViewControllerIndex: %@, tabBarItemVisibleIndex : %@", @(__PRETTY_FUNCTION__), @(__LINE__), @(control.cyl_tabBarChildViewControllerIndex), @(control.cyl_tabBarItemVisibleIndex));
    if ([control cyl_isTabButton]) {
        //更改红标状态
//        if ([[self cyl_tabBarController].selectedViewController cyl_isShowTabBadgePoint]) {
//            [[self cyl_tabBarController].selectedViewController cyl_removeTabBadgePoint];
//        } else {
//            [[self cyl_tabBarController].selectedViewController cyl_showTabBadgePoint];
//        }
        animationView = [control cyl_tabImageView];
    }
    
    UIButton *button = CYLExternPlusButton;
    BOOL isPlusButton = [control cyl_isPlusButton];
    // 即使 PlusButton 也添加了点击事件，点击 PlusButton 后也会触发该代理方法。
    if (isPlusButton) {
        animationView = button.imageView;
    }
            [self addScaleAnimationOnView:animationView repeatCount:1];

//    [self addRotateAnimationOnView:animationView];
//
//    if ([self cyl_tabBarController].selectedIndex % 2 == 0) {
//    } else {
//    }
    
    //添加仿淘宝tabbar，第一个tab选中后有图标覆盖
    //    if ([control cyl_isTabButton]|| [control cyl_isPlusButton]) {
    //        BOOL shouldSelectedCoverShow = ([self cyl_tabBarController].selectedIndex == 0);
    //        [self setSelectedCoverShow:shouldSelectedCoverShow];
    //    }
    
}

//缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount {
    //需要实现的帧动画，这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 1;
    animation.repeatCount = repeatCount;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}

//旋转动画
- (void)addRotateAnimationOnView:(UIView *)animationView {
    // 针对旋转动画，需要将旋转轴向屏幕外侧平移，最大图片宽度的一半
    // 否则背景与按钮图片处于同一层次，当按钮图片旋转时，转轴就在背景图上，动画时会有一部分在背景图之下。
    // 动画结束后复位
    animationView.layer.zPosition = 65.f / 2;
    [UIView animateWithDuration:0.32 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.70 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
            animationView.layer.transform = CATransform3DMakeRotation(2 * M_PI, 0, 1, 0);
        } completion:nil];
    });
}


@end
