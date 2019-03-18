//
//  TakSZView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TakSZView.h"
#import "TKChooseCollectionView.h"
#import <PGDatePickManager.h>
#import <AVFoundation/AVFoundation.h>


@interface TakSZView()<PGDatePickerDelegate>{
    NSString *time;
    NSString * txinter;//提醒
}
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;

@end

@implementation TakSZView{
    BaseLabel * title;
    UIImageView * leftimage;
    
    TKChooseCollectionView *collectview;
    BaseLabel * subtitle;
    BaseLabel * times;
    
    UIView * duigouback;
    UIImageView * duigou;
    
    UIView * oneview;
    UIView * twoview;
    UIView * timeview;
    UIImageView * imageview;
    BaseLabel * tx;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        time = @"19:00";
        [self addview];
        txinter = @"0";
    }
    return self;
}
- (void)addview{
    WS(ws);
    self.backgroundColor = [UIColor clearColor];
    UIView * backview = [UIView new];
    backview.backgroundColor = RGB(255, 255, 255);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(28)-TabBarHeight);
    }];
    backview.layer.shadowOpacity = 0.24;
    backview.layer.shadowColor = RGB(171, 171, 171).CGColor;
    backview.layer.shadowRadius = LENGTH(8);
    backview.layer.shadowOffset = CGSizeMake(0,4);
    backview.layer.cornerRadius = LENGTH(12);
    
    
    leftimage = [UIImageView new];
//    leftimage.contentMode = UIViewContentModeScaleAspectFit;
    leftimage.image = UIIMAGE(@"标题装饰紫色");
    leftimage.image = [leftimage.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    [backview addSubview:leftimage];
    
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,51,51) LabelFont:TextFontCu(19) TextAlignment:NSTextAlignmentCenter Text:@"读书设置"];
    [backview addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backview).with.offset(LENGTH(15));
        make.left.mas_equalTo(backview).with.offset(LENGTH(15));
        make.right.mas_equalTo(backview).with.offset(-LENGTH(15));
    }];
    
    [leftimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.left.mas_equalTo(self->title.mas_left).with.offset(LENGTH(34));
        make.right.mas_equalTo(self->title.mas_right).with.offset(-LENGTH(34));
        make.centerY.mas_equalTo(self->title);
    }];
    
    BaseLabel * reedbooktime = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51, 51, 51) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"每日读书时间"];
    [backview addSubview:reedbooktime];
    [reedbooktime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(43));
        make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(22));
    }];
    
    oneview = [self addyuanquan];
    [backview addSubview:oneview];
    [oneview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(26));
//        make.top.mas_equalTo(reedbooktime).with.offset(LENGTH(4));
        make.centerY.mas_equalTo(reedbooktime);
        make.width.and.height.mas_equalTo(LENGTH(4));
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(72),LENGTH(32));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(2);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(2);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(31), LENGTH(0), LENGTH(31));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collectview = [[TKChooseCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    collectview.decelerationRate = UIScrollViewDecelerationRateNormal;
    [self addSubview:collectview];
    [collectview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(reedbooktime.mas_bottom).with.offset(LENGTH(15));
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(32));
    }];
    NSMutableArray * itemarr = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        TKbuiltModel * model = [TKbuiltModel new];
        if (i == 0) {
            model.name = @"半小时";
            model.style = @"1";
        }else{
            model.style = @"0";
            if (i == 1) {
                model.name = @"1小时";
            }else if (i == 2){
                model.name = @"1.5小时";
            }else if (i == 3){
                model.name = @"2小时";
            }
        }
        [itemarr addObject:model];
    }
    collectview.itemArray = itemarr;
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51, 51, 51) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:@"每日开始读书时间"];
    [backview addSubview:subtitle];
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(43));
        make.top.mas_equalTo(self->collectview.mas_bottom).with.offset(LENGTH(22));
    }];
    
    twoview = [self addyuanquan];
    [backview addSubview:twoview];
    [twoview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backview).with.offset(LENGTH(26));
        make.centerY.mas_equalTo(self->subtitle);
        make.width.and.height.mas_equalTo(LENGTH(4));
    }];
    

    
    timeview = [UIView new];
    timeview.layer.borderWidth = LENGTH(1);
    timeview.layer.borderColor = RGB(73,172,171).CGColor;
    timeview.layer.cornerRadius = LENGTH(7);
    [backview addSubview:timeview];
    [timeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(15));
        make.left.mas_equalTo(ws).with.offset(LENGTH(26));
        make.width.mas_equalTo(LENGTH(121));
        make.height.mas_equalTo(LENGTH(32));
        make.bottom.mas_equalTo(backview).with.offset(-LENGTH(20));
    }];
    
    times = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(49,87,86) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentLeft Text:[NSString stringWithFormat:@"%@开始",time]];
    [timeview addSubview:times];
    [times mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(self->timeview);
        make.left.mas_equalTo(self->timeview).with.offset(LENGTH(13));
    }];
    
    imageview = [UIImageView new];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.image = UIIMAGE(@"icon_读后感_展开");
    imageview.image = [imageview.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    [timeview addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->timeview);
        make.right.mas_equalTo(self->timeview).with.offset(-LENGTH(10));
        make.width.mas_equalTo(LENGTH(8));
        make.height.mas_equalTo(LENGTH(4));
    }];
    
    timeview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(xzsj)];
    //将手势添加到需要相应的view中去
    [timeview addGestureRecognizer:tap];
    
    duigouback = [UIView new];
    duigouback.layer.cornerRadius = LENGTH(12);
    duigouback.layer.masksToBounds = YES;
    duigouback.layer.borderWidth = 1;
    [backview addSubview:duigouback];
    [duigouback mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->timeview);
        make.left.mas_equalTo(self->timeview.mas_right).with.offset(LENGTH(30));
        make.width.and.height.mas_equalTo(LENGTH(24));
    }];
    
    duigou = [UIImageView new];
    duigou.contentMode = UIViewContentModeScaleAspectFit;
    duigou.image = [duigou.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
    [duigouback addSubview:duigou];
    [duigou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->duigouback);
//        make.left.mas_equalTo(self->timeview.mas_right).with.offset(LENGTH(30));
        make.width.and.height.mas_equalTo(LENGTH(14));
    }];
    NSArray *notificaitons = [[UIApplication sharedApplication] scheduledLocalNotifications];
    for (UILocalNotification *notify in notificaitons) {
        if ([[notify.userInfo objectForKey:@"id"] isEqualToString:@"naozhong"]) {
            duigou.image = UIIMAGE(@"对勾白色");
            duigou.image = [duigou.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
            break;
        }
    }
    
    tx = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(105,189,185) LabelFont:TextFont(15) TextAlignment:NSTextAlignmentCenter Text:@"提醒"];
    [backview addSubview:tx];
    [tx mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->duigou);
        make.left.mas_equalTo(self->duigouback.mas_right).with.offset(LENGTH(8));
    }];
    
    UIView * txview  =[UIView new];
    txview.backgroundColor = [UIColor clearColor];
    [self addSubview:txview];
    [txview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->duigouback);
        make.left.mas_equalTo(self->duigouback.mas_left);
        make.right.mas_equalTo(self->tx.mas_right);
        make.height.mas_equalTo(LENGTH(50));
    }];
    
    txview.userInteractionEnabled = YES;
    UITapGestureRecognizer * txtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(txclick)];
    //将手势添加到需要相应的view中去
    [txview addGestureRecognizer:txtap];
    

}
- (void)setVc:(UIViewController *)vc{
    _vc = vc;
        BaseLabel * lqrw = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"领取任务"];
        lqrw.backgroundColor = RGB(91,199,198);
        [vc.view addSubview:lqrw];
        [lqrw mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.mas_equalTo(backview.mas_bottom).with.offset(LENGTH(28));
            make.left.and.right.and.bottom.mas_equalTo(vc.view);
            make.height.mas_equalTo(TabBarHeight);
        }];
        lqrw.userInteractionEnabled = YES;
        UITapGestureRecognizer * lqrwtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lqrwclick)];
        //将手势添加到需要相应的view中去
        [lqrw addGestureRecognizer:lqrwtap];
}
- (void)xzsj{
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.datePickerMode = PGDatePickerModeTime;
    datePicker.delegate = self;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSDate *date = [dateFormatter dateFromString:time];//上次设置的日期
    if (!time) {
        date = [NSDate date];
    }
    [datePicker setDate:date];
    
    [[self viewController] presentViewController:datePickManager animated:false completion:nil];
    
    datePickManager.titleLabel.text = @"选择时间";
    //设置半透明的背景颜色
    datePickManager.isShadeBackgroud = true;
    //    //设置头部的背景颜色
    //    datePickManager.headerViewBackgroundColor = [UIColor blueColor];
    //    //设置线条的颜色
    //    datePicker.lineBackgroundColor = [UIColor cyanColor];
    //    //设置选中行的字体颜色
    //    datePicker.textColorOfSelectedRow = [UIColor redColor];
    //    //设置未选中行的字体颜色
    //    datePicker.textColorOfOtherRow = [UIColor blackColor];
    //设置取消按钮的字体颜色
    //    datePickManager.cancelButtonTextColor = [UIColor blackColor];
    //设置取消按钮的字
    datePickManager.cancelButtonText = @"取消";
    //设置取消按钮的字体大小
    datePickManager.cancelButtonFont = [UIFont boldSystemFontOfSize:17];
    
    //设置确定按钮的字体颜色
    //    datePickManager.confirmButtonTextColor = [UIColor redColor];
    //设置确定按钮的字
    datePickManager.confirmButtonText = @"确定";
    //设置确定按钮的字体大小
    datePickManager.confirmButtonFont = [UIFont boldSystemFontOfSize:17];
    
}
- (void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents {
    NSString * day = [NSString stringWithFormat:@"%ld:%ld",(long)dateComponents.hour,(long)dateComponents.minute];
    time = day;
    times.text = [NSString stringWithFormat:@"%@开始",time];
}
- (void)txclick{
    if ([duigou.image isEqual:[UIIMAGE(@"对勾白色") imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)]]) {
        duigou.image = UIIMAGE(@"");
        NSArray *notificaitons = [[UIApplication sharedApplication] scheduledLocalNotifications];
        for (UILocalNotification *notify in notificaitons) {
            if ([[notify.userInfo objectForKey:@"id"] isEqualToString:@"naozhong"]) {
                //取消一个特定的通知
                [[UIApplication sharedApplication] cancelLocalNotification:notify];
                [self remindController:@"闹钟提醒已经取消"];
                break;
            }
        }
    }else{
        duigou.image = UIIMAGE(@"对勾白色");
        duigou.image = [duigou.image imageWithRenderingMode:(UIImageRenderingModeAlwaysTemplate)];
        txinter = @"1";
        NSDateFormatter *formats = [[NSDateFormatter alloc] init];
        formats.dateFormat = @"HH:mm";
        NSDate *date = [formats dateFromString:time];
        [self scheduleLocalNotificationWithDate:date];
        [self remindController:@"闹钟已添加"];
    }
    
//    [self voiceAnnouncementsText:@"闹钟已添加"];
//    [self voiceAnnouncementsText:@"支付宝到账  9万9千9百9十9亿9万9千9百9十9万9万9千9百9十9"];


}

//通知
- (void)scheduleLocalNotificationWithDate:(NSDate *)fireDate
{
//    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    //0.创建推送
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
//    localNotification.repeatInterval = 10;
    //1.设置推送类型
    UIUserNotificationType type = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    //2.设置setting
    UIUserNotificationSettings *setting  = [UIUserNotificationSettings settingsForTypes:type categories:nil];
    //3.主动授权
    [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    //4.设置推送时间
    [localNotification setFireDate:fireDate];
    //5.设置时区
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    //6.推送内容
    [localNotification setAlertBody:@"读书时间到了！"];
    //7.推送声音
    localNotification.soundName = UILocalNotificationDefaultSoundName;
//    [localNotification setSoundName:<#(NSString * _Nullable)#>]
//    localNotification.sound = [UNNotificationSound defaultSound];
//    [localNotification setSoundName:@"Thunder Song.m4r"];
    localNotification.repeatInterval = kCFCalendarUnitDay;
    localNotification.userInfo = @{@"id":@"naozhong"};

    //8.添加推送到UIApplication
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}
//提示页面
- (void)remindController:(NSString *)remindText
{
    //提示页面（8.0出现）
    /**
     *  1.创建UIAlertController的对象
     2.创建UIAlertController的方法
     3.控制器添加action
     4.用presentViewController模态视图控制器
     */
    UIAlertController *alart = [UIAlertController alertControllerWithTitle:@"提示" message:remindText preferredStyle:UIAlertControllerStyleAlert];
    [[self viewController] presentViewController:alart animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alart dismissViewControllerAnimated:YES completion:nil];
        });
    }];
}

//语音播报
- (void)voiceAnnouncementsText:(NSString *)text
{
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:text];
    utterance.pitchMultiplier=0.8;
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    utterance.voice = voice;
    AVSpeechSynthesizer *synth = [[AVSpeechSynthesizer alloc]init];
    [synth speakUtterance:utterance];
}
- (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
- (void)lqrwclick{
//    [[UIApplication sharedApplication] cancelAllLocalNotifications];
//    [self remindController:@"闹钟提醒已经取消"];
//
//    [self voiceAnnouncementsText:@"闹钟提醒已经取消"];

    NSString * url = [NSString stringWithFormat:@"%@%@?studentid=%@&missionid=%@",ZSFWQ,JK_LQRW,Me.ssid,_model.mission.ssid];
    NSDictionary * dic = @{@"day_read_time":time,@"day_read_length":[NSString stringWithFormat:@"%.2f",collectview.time],@"is_remind":txinter};
//    NSString *jsonString = [self dictionaryToJson:dic];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    //    NSData *data =[jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:nil error:nil];
    request.timeoutInterval= 30;
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)data.length] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:data];
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                 @"text/html",
                                                 @"text/json",
                                                 @"text/javascript",
                                                 @"text/plain",
                                                 nil];
    manager.responseSerializer = responseSerializer;
    [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            NewHomeModel * model = [NewHomeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",BENDIXINXI]];
                NSMutableDictionary *dataDictionary = [BaseObject BenDiXinXi];
                [dataDictionary setValue:@"1" forKey:@"ydyqbrw"];
                [dataDictionary writeToFile:filePatch atomically:YES];
                [[self viewController].navigationController popViewControllerAnimated:YES];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
            [[MBProgressHUDYS SharedMBProgressHUDYS] addview:[self viewController].view.window];
            [[MBProgressHUDYS SharedMBProgressHUDYS] shoumessage:model.message];
            [[MBProgressHUDYS SharedMBProgressHUDYS] hideAnimated:YES afterDelay:1];
        } else {
            
        }
    }] resume];
    
    
//    [[BaseAppRequestManager manager] PostNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
//        if (responseObject) {
//            NewHomeModel * model = [NewHomeModel mj_objectWithKeyValues:responseObject];
//            if ([model.code isEqual:@200]) {
//                [[self viewController].navigationController popViewControllerAnimated:YES];
//            }
//
//        }else{
//
//        }
//    }];
}

- (void)setModel:(TAKALLModel *)model{
    _model = model;
    collectview.neirongcolor = _colorarray[0];
    UIColor *color = _colorarray[0];
    leftimage.tintColor = _colorarray[0];
    oneview.backgroundColor = _colorarray[0];
    twoview.backgroundColor = _colorarray[0];
    timeview.layer.borderColor = color.CGColor;
    times.textColor = color;
    imageview.tintColor = color;
    duigouback.layer.borderColor = color.CGColor;
    duigou.tintColor = color;
    tx.textColor = color;
}


- (UIView *)addyuanquan{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(51,51,51);
    v.layer.masksToBounds = YES;
    v.layer.cornerRadius = LENGTH(2);
    return v;
}
@end
