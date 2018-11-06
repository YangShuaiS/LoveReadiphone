//
//  BookXQDownView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/13.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookXQDownView.h"
#import "DTALLiewController.h"
#import "BlueWhaleRead-Swift.h"

@implementation BookXQDownView{
    BaseView * yueduview;
    BaseView * Lefttview;
    BaseLabel * leftLabel;
    FLAnimatedImageView * leftImageView;

    BaseLabel * yuedulabel;;
    BaseView * rightview;
    BaseLabel * RightLabel;
    
    FLAnimatedImageView * rightImageView;
    
    TheTopPicModel * Topmodel;
    
    MBProgressHUD * mb;
    //电子书
    NSURLSessionDownloadTask *_downloadTask;
    NSString * bookstring;

}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    BaseView * bacView = [BaseView new];
    bacView.backgroundColor = RGBA(1,78,136,0.6);
    [self addSubview:bacView];
    [bacView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    yueduview  = [BaseView new];
    yueduview.backgroundColor = RGB(247,203,103);
    yueduview.layer.masksToBounds = YES;
    yueduview.layer.cornerRadius = LENGTH(21);
    [self addSubview:yueduview];
    [yueduview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(16);
        make.width.mas_equalTo(LENGTH(100));
        make.height.mas_equalTo(LENGTH(42));
    }];
    
    yuedulabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"免费畅读"];
    [yueduview addSubview:yuedulabel];
    
    [yuedulabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->yueduview.mas_centerY);
        make.centerX.mas_equalTo(self->yueduview.mas_centerX);
    }];

    
    
    Lefttview  = [BaseView new];
    Lefttview.backgroundColor = RGB(255,167,96);
    Lefttview.layer.masksToBounds = YES;
    Lefttview.layer.cornerRadius = LENGTH(21);
    [self addSubview:Lefttview];
    [Lefttview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(self->yueduview.mas_right).with.offset(8);

//        make.centerX.mas_equalTo(ws).with.offset(-LENGTH(89));
        make.width.mas_equalTo(LENGTH(100));
        make.height.mas_equalTo(LENGTH(42));
    }];
    
    
    leftLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"答题"];
    [self addSubview:leftLabel];
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->Lefttview.mas_centerY);
        make.centerX.mas_equalTo(self->Lefttview.mas_centerX);
    }];

    rightview  = [BaseView new];
    rightview.backgroundColor = RGB(1,195,193);
    rightview.layer.masksToBounds = YES;
    rightview.layer.cornerRadius = LENGTH(21);
    [self addSubview:rightview];
    [rightview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
//        make.centerX.mas_equalTo(ws).with.offset(LENGTH(80+9));
        make.left.mas_equalTo(self->Lefttview.mas_right).with.offset(8);

        make.width.mas_equalTo(LENGTH(100));
        make.height.mas_equalTo(LENGTH(42));
    }];
    
    RightLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"加入书架"];
    [rightview addSubview:RightLabel];

    [RightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->rightview.mas_centerY);
        make.centerX.mas_equalTo(self->rightview.mas_centerX);
    }];


    yueduview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(createProgress)];
    //将手势添加到需要相应的view中去
    [yueduview addGestureRecognizer:tapGesture1];
    
    Lefttview.userInteractionEnabled = YES;
    rightview.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture0 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bookcity)];
    //将手势添加到需要相应的view中去
    [Lefttview addGestureRecognizer:tapGesture0];
    
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addbookcity)];
    //将手势添加到需要相应的view中去
    [rightview addGestureRecognizer:tapGesture2];
    
    rightImageView = [FLAnimatedImageView new];
    rightImageView.image = UIIMAGE(@"icon_书籍详情_选中对勾");
    [rightview addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->rightview.mas_left).with.offset(-LENGTH(22));
        make.centerY.mas_equalTo(self->rightview.mas_centerY);
        make.width.mas_equalTo(LENGTH(22));
        make.height.mas_equalTo(LENGTH(22));
    }];
    
    leftImageView = [FLAnimatedImageView new];
    leftImageView.image = UIIMAGE(@"icon_书籍详情_选中对勾");
    [Lefttview addSubview:leftImageView];
    [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->Lefttview.mas_left).with.offset(-LENGTH(22));
        make.centerY.mas_equalTo(self->Lefttview.mas_centerY);
        make.width.mas_equalTo(LENGTH(22));
        make.height.mas_equalTo(LENGTH(22));
    }];

}
- (void)bookcity{
    if ([self.nav respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.nav.interactivePopGestureRecognizer.enabled = NO;
    }
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.nav.view addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.nav.view);
    }];
    
    leftLabel.userInteractionEnabled = NO;
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TZDTTIMU];
    NSDictionary * dic = @{@"bookid":_model.ssid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            self->Topmodel = [TheTopPicModel mj_objectWithKeyValues:responseObject];
            if ([self->Topmodel.code isEqual:@200]) {
                
                WS(ws);
                ws.model.dayTimes --;
                ws.model = ws.model;
                GeneralUpView * genView = [GeneralUpView new];
                genView.style = PopUpViewStyleAnswer;
                [self.nav.view addSubview:genView];
                [genView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.mas_equalTo(ws.nav.view);
                }];
                NSString *str_minute = [NSString stringWithFormat:@"%02ld",(self->Topmodel.time%3600)/60];//分

                GenPopViewModel * m = [GenPopViewModel new];
                m.title = @"答题说明";
                NSMutableArray * arr = ws.model.badgeList;
                CityBadgeListModel * citymodel = [CityBadgeListModel new];
                if (arr.count>0) {
                    citymodel = arr[0];
                }else{
                    citymodel.name = @"";
                }
                m.subtitle = [NSString stringWithFormat:@"一共%ld道题\n你必须在%@分钟之内答完所有题目\n答题成功之后可以点亮\n%@\n你准备好了吗？",self->Topmodel.bookProblems.count,str_minute,citymodel.name];
                genView.model = m;
                [genView setBlock:^{
                    DTALLiewController * vc = [DTALLiewController new];
                    vc.style = DTBookStyle;
                    vc.titles = @"挑战答题";
                    vc.Topmodel = self->Topmodel;
                    vc.bookid = self.model.ssid;
                    vc.bookname = self.model.name;
                    vc.bookfenshu = self.model.b_score;
                    [self.nav pushViewController:vc animated:YES];
                }];
                [mb hideAnimated:NO afterDelay:1];
            }else{
                mb.label.text = self->Topmodel.message;
                [mb hideAnimated:NO afterDelay:1];
            }
            self->leftLabel.userInteractionEnabled = YES;
        }else{
            mb.label.text = @"网络请求失败";
            [mb hideAnimated:NO afterDelay:1];
            self->leftLabel.userInteractionEnabled = YES;
        }
    }];
}
//加入书架
- (void)addBook{
//    [UIView animateWithDuration:0.5 animations:^{
        self->RightLabel.text = @"已加入";
        [self->RightLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self->rightview.mas_centerX).with.offset(LENGTH(5));
        }];
        [self->rightImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->rightview.mas_left).with.offset(LENGTH(20));
        }];
        [self->RightLabel layoutIfNeeded];
        [self->rightImageView layoutIfNeeded];
//    } completion:^(BOOL finished) {
        self->rightview.userInteractionEnabled = NO;
//    }];
}
- (void)addbookcity{
    WS(ws);
    MBProgressHUD * mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.nav.view addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.nav.view);
    }];

    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_JOOINBOOKCITY];
    //studentid 学生id
    NSDictionary * dic = @{@"bookid":_model.ssid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            JoinBookModel * models = [JoinBookModel mj_objectWithKeyValues:responseObject];
            if ([models.code isEqual:@200]) {
                [self addBook];
                NSMutableArray * bagearray = self->_model.badgeList;
                NSMutableArray * arr = ws.model.badgeList;
                if (arr.count>0) {
                    CityBadgeListModel * city = bagearray[0];
                    WS(ws);
                    GeneralUpView * genView = [GeneralUpView new];
                    genView.nav = self.nav;
                    genView.style = PopUpViewStyleBelong;
                    [self.nav.view addSubview:genView];
                    [genView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.edges.mas_equalTo(ws.nav.view);
                    }];
                    
                    GenPopViewModel * m = [GenPopViewModel new];
                    m.title = self->_model.name;
                    m.subtitle = city.name;
                    genView.model = m;
                    genView.joinmodel = models;
                }
                [mb hideAnimated:NO afterDelay:1];

            }else{
                mb.label.text = models.message;
                [mb hideAnimated:NO afterDelay:1];
            }
        }else{
            mb.label.text = @"网络请求失败";
            [mb hideAnimated:NO afterDelay:1];
        }
    }];
    //待定

}
- (void)setModel:(BookXQbookModel *)model{
    _model = model;
    if (model.is_read == 1) {
        [self addBook];
        if (model.dayTimes<=0) {
            [self noread];
        }
    }else if (model.is_read ==2){
        [self yidu];
    }
}
- (void)yidu{
    self->RightLabel.text = @"已加入书架";
    [self->RightLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->rightview.mas_centerX).with.offset(LENGTH(5));
    }];
    [self->rightImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->rightview.mas_left).with.offset(LENGTH(20));
    }];
    [self->RightLabel layoutIfNeeded];
    [self->rightImageView layoutIfNeeded];
    //    } completion:^(BOOL finished) {
    self->rightview.userInteractionEnabled = NO;
    
    leftLabel.text = @"已答完";
    [self->leftLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->Lefttview.mas_centerX).with.offset(LENGTH(5));
    }];
    [self->leftImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->Lefttview.mas_left).with.offset(LENGTH(20));
    }];
    [self->leftLabel layoutIfNeeded];
    [self->leftImageView layoutIfNeeded];

//    leftLabel.alpha = 0.6;
    Lefttview.userInteractionEnabled = NO;
}
- (void)noread{
    leftLabel.text = @"明日再来";
//    leftLabel.alpha = 0.6;
    Lefttview.userInteractionEnabled = NO;
}



- (NSString *)dataFilePath{
    NSArray *pathArray =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *filePaths = [[pathArray firstObject] stringByAppendingPathComponent:@"booktext"];
    return filePaths;
}
- (void)createProgress{
    WS(ws);
    mb = [MBProgressHUD new];
    mb.mode = MBProgressHUDModeIndeterminate;
    mb.label.text = @"正在读取...";
    [mb showAnimated:YES];
    mb.removeFromSuperViewOnHide = YES;
    [self.window addSubview:mb];
    [mb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.window);
    }];
    NSFileManager* fm=[NSFileManager defaultManager];
    NSString * paths = [self dataFilePath] ;
    NSArray *files = [fm subpathsAtPath:paths];
    if ([files containsObject: @"山居岁月.txt"]) {
        NSString * booklujing = [paths stringByAppendingPathComponent:@"山居岁月.txt"];
        __weak BookXQDownView *weakSelf = self;
        NSURL *fileURL = [[NSBundle mainBundle] URLForAuxiliaryExecutable:booklujing];
        
        [DZMReadParser ParserLocalURLWithUrl:fileURL complete:^(DZMReadModel * _Nonnull readModel) {
            self->mb.label.text = @"读取成功";
            [self->mb hideAnimated:NO afterDelay:1];
            DZMReadController * read = [[DZMReadController alloc] init];
            
            read.readModel = readModel;
            
            [weakSelf.nav pushViewController:read animated:YES];
        }];
    }else{
        [self down];
    }
}

- (void)down{
    //[NSString stringWithFormat:@"%@%@",DOWNLOADZHENGSHUURL,@"1097449557765533696489"]
    mb.label.text = @"正在下载...";
    NSString * url = [NSString stringWithFormat:@"%@download/山居岁月.zip",ZSFWQ];
//    NSString * url = [NSString stringWithFormat:@"http://192.168.1.114:8069/download/山居岁月.zip"];
    
    //    NSString * url = [NSString stringWithFormat:@"http://192.168.1.114/山居岁月.zip"];
    
    //    NSString * url = [NSString stringWithFormat:@"http://192.168.1.114:8075/download/山居岁月.zip"];
    
    NSString *encoded = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *URL = [NSURL URLWithString:encoded];
    //1.创建会话管理者
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    //2.下载文件
    /*
     第一个参数:请求对象
     第二个参数:progress 进度回调 downloadProgress
     第三个参数:destination 回调(目标位置)
     有返回值
     targetPath:临时文件路径
     response:响应头信息
     第四个参数:completionHandler 下载完成之后的回调
     filePath:最终的文件路径
     */
    
    /*
     第一个参数：请求对象
     第二个参数：进度回调
     downloadProgress.completedUnitCount :已经下载的数据
     downloadProgress.totalUnitCount：数据的总大小
     第三个参数：destination回调，该block需要返回值（NSURL类型），告诉系统应该把文件剪切到什么地方
     targetPath：文件的临时保存路径tmp，随时可能被删除
     response：响应头信息
     第四个参数：completionHandler请求完成后回调
     response：响应头信息
     filePath：文件的保存路径，即destination回调的返回值
     error：错误信息
     */
    NSURLSessionDownloadTask *download = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        //监听下载进度
        //completedUnitCount 已经下载的数据大小
        //totalUnitCount     文件数据的中大小
        dispatch_async(dispatch_get_main_queue(), ^{
            self->mb.label.text = [NSString stringWithFormat: @"%f",1.0 *downloadProgress.completedUnitCount / downloadProgress.totalUnitCount];
        });
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        /**
         * 1:1：请求路径：NSUrl *url = [NSUrl urlWithString:path];从网络请求路径  2：把本地的file文件路径转成url，NSUrl *url = [NSURL fileURLWithPath:fullPath]；
         2：返回值是一个下载文件的路径
         *
         */
        NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:response.suggestedFilename];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self->mb.label.text = fullPath;
            [self->mb hideAnimated:NO afterDelay:1];
        });
        
        self->bookstring = fullPath;
        return [NSURL fileURLWithPath:fullPath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        /**
         *filePath:下载后文件的保存路径
         */
        NSArray *pathArray =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSFileManager *manager = [NSFileManager defaultManager];
        NSString *filePaths = [[pathArray firstObject] stringByAppendingPathComponent:@"booktext"];
        NSString *movePath = [filePaths stringByAppendingPathComponent:@"山居岁月.zip"];;
        BOOL isMove = [manager moveItemAtPath:self->bookstring toPath:movePath error:nil];
        if (isMove) {
            NSLog(@"移动成功");
        } else {
            NSLog(@"移动失败");
        }
        
        // 删除文件
        BOOL isDele = [manager removeItemAtPath:self->bookstring error:nil];
        if (isDele) {
            NSLog(@"删除成功");
        } else {
            NSLog(@"删除失败");
        }
        self->bookstring = movePath;
        [self jieya];
        
    }];
    
    //3.执行Task
    [download resume];
}
- (void)jieya{
    self->mb.label.text = @"正在解压...";
    [self->mb hideAnimated:NO afterDelay:1];
    NSArray *pathArray =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSFileManager *manager = [NSFileManager defaultManager];
    
    //创建解压缩对象
    ZipArchive *zip = [[ZipArchive alloc]init];
    //Caches路径
    //    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    //解压目标路径
    NSString *savePath = [[pathArray firstObject] stringByAppendingPathComponent:@"booktext"];
    //zip压缩包的路径
    NSString *path = [savePath stringByAppendingPathComponent:@"山居岁月.zip"];
    //解压不带密码压缩包
    [zip UnzipOpenFile:path];
    //解压带密码压缩包
    //[zip UnzipOpenFile:path Password:@"ZipArchive.zip"];
    //解压
    [zip UnzipFileTo:savePath overWrite:YES];
    //关闭解压
    BOOL success = [zip UnzipCloseFile];
    if (success) {
        self->mb.label.text = @"解压成功";
        [self->mb hideAnimated:NO afterDelay:1];
        // 删除文件
        BOOL isDele = [manager removeItemAtPath:self->bookstring error:nil];
        if (isDele) {
            NSLog(@"删除成功");
        } else {
            NSLog(@"删除失败");
        }
        self->mb.label.text = @"正在读取...";
        [self->mb hideAnimated:NO afterDelay:1];
        NSString * booklujing = [savePath stringByAppendingPathComponent:@"山居岁月.txt"];
        //        NSString *encoded = [booklujing stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        __weak BookXQDownView *weakSelf = self;
        NSURL *fileURL = [[NSBundle mainBundle] URLForAuxiliaryExecutable:booklujing];
        
        [DZMReadParser ParserLocalURLWithUrl:fileURL complete:^(DZMReadModel * _Nonnull readModel) {
            self->mb.label.text = @"读取成功";
            [self->mb hideAnimated:NO afterDelay:1];
            DZMReadController * read = [[DZMReadController alloc] init];
            
            read.readModel = readModel;
            
            [weakSelf.nav pushViewController:read animated:YES];
        }];
        
        //        dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //            LSYReadPageViewController *pageView = [[LSYReadPageViewController alloc] init];
        //            NSURL *fileURL = [[NSBundle mainBundle] URLForAuxiliaryExecutable:booklujing];
        //            pageView.resourceURL = fileURL;    //文件位置
        //            pageView.model = [LSYReadModel getLocalModelWithURL:fileURL];
        //
        //            dispatch_async(dispatch_get_main_queue(), ^{
        //
        //                [self.vc presentViewController:pageView animated:YES completion:nil];
        //            });
        //        });
        
        //        ReadOCViewController * vc = [ReadOCViewController new];
        //        [_vc presentViewController:vc animated:YES completion:^{
        //            vc.wancheng = booklujing;
        //            self->mb.label.text = @"读取成功...";
        //            [self->mb hideAnimated:NO afterDelay:1];
        //        }];
    } else {
        self->mb.label.text = @"解压失败";
        [self->mb hideAnimated:NO afterDelay:1];
    }
}
@end
