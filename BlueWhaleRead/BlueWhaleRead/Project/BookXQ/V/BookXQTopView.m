
//
//  BookXQTopView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookXQTopView.h"
#import "BlueWhaleRead-Swift.h"
#import "HuiBenViewController.h"
#import "StareMoreView.h"

@implementation BookXQTopView{
    FLAnimatedImageView * leftImageView;
    StareMoreView * stareview;
    BaseLabel * Title;
    BaseLabel * subtitle;

    BaseLabel * dengji;
    BaseLabel * nengli;
    
    BaseLabel * zxyd;
    UIImageView * huo;
    BaseLabel * ydcs;
    
    UIImageView * xihuanimage;
    BaseLabel * xihuanlabel;
    MBProgressHUD * mb;
    
    //电子书
    NSURLSessionDownloadTask *_downloadTask;
    NSString * bookstring;
    NSMutableArray * viewarray;
    
    NSString * zipname;
    
    
    NSString * bookpngfile;
    NSArray * bookpng;
    
//    BaseLabel * longtext;
    BaseLabel * jd ;
    
    FLAnimatedImageView * backImageView;
    UIView * yy;

    
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
    backImageView = [FLAnimatedImageView new];
    backImageView.image = UIIMAGE(@"上");
    [self addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
    }];

    backImageView.userInteractionEnabled = YES;
    self.userInteractionEnabled = YES;
    UIView * yinyig = [UIView new];
    yinyig.backgroundColor = [UIColor whiteColor];
    [self addSubview:yinyig];
    [yinyig mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(14));
        make.top.equalTo(ws).with.offset(15);
        make.width.mas_equalTo(LENGTH(110));
        make.height.equalTo(yinyig.mas_width).multipliedBy(1.4283333333);
        make.bottom.equalTo(ws.mas_bottom).with.offset(-LENGTH(18));
    }];
    yinyig.layer.shadowOpacity = 0.16;
    yinyig.layer.shadowColor = [UIColor blackColor].CGColor;
    yinyig.layer.shadowRadius = LENGTH(4);
    yinyig.layer.shadowOffset = CGSizeMake(0,0);
    yinyig.layer.cornerRadius = LENGTH(5);
    
    yy = [UIView new];
    yy.backgroundColor = [UIColor whiteColor];
    [self addSubview:yy];
    [yy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(14));
        make.top.equalTo(ws).with.offset(15);
        make.width.mas_equalTo(LENGTH(110));
        make.height.equalTo(self->yy.mas_width).multipliedBy(1.4283333333);
        make.bottom.equalTo(ws.mas_bottom).with.offset(-LENGTH(18));
    }];
    
    
    leftImageView = [FLAnimatedImageView new];
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    [yy addSubview:leftImageView];
    
    [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->yy);
    }];
    UIImageView * xian = [UIImageView new];
    xian.image = UIIMAGE(@"书线");
    [yy addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.and.left.mas_equalTo(self->yy);
        make.width.mas_equalTo(LENGTH(9));
    }];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    Title.numberOfLines = 1;
    [self addSubview:Title];
    
    
    stareview = [StareMoreView new];
    [self addSubview:stareview];


    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"书名"];
    [self addSubview:subtitle];
    
    BaseLabel * DJ = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"阅读分级："];
    [self addSubview:DJ];
    
    dengji = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"0"];
    [self addSubview:dengji];
    
    BaseLabel * NL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(137,159,159) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@"分值："];
    [self addSubview:NL];
    
    nengli = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(4,51,50) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:nengli];
    
    zxyd = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(13) TextAlignment:NSTextAlignmentCenter Text:@"在线阅读"];
    zxyd.backgroundColor = RGB(82,199,198);
    zxyd.layer.masksToBounds = YES;
    zxyd.layer.cornerRadius = LENGTH(5);
    [self addSubview:zxyd];
    
    huo = [UIImageView new];
    huo.contentMode = UIViewContentModeScaleAspectFit;
    huo.image = UIIMAGE(@"阅读次数-火");
    [self addSubview:huo];
    
    ydcs = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(83,83,83) LabelFont:TextFont(11) TextAlignment:NSTextAlignmentLeft Text:@"1000次阅读"];
    [self addSubview:ydcs];
    
    xihuanimage = [UIImageView new];
    xihuanimage.contentMode = UIViewContentModeScaleAspectFit;
    xihuanimage.image = UIIMAGE(@"喜欢未选中");
    [self addSubview:xihuanimage];
    
    xihuanlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(144,144,144) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentLeft Text:@"喜欢"];
    [self addSubview:xihuanlabel];
    
    BaseButton * oneButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [oneButton addTarget:self action:@selector(oneButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:oneButton];
    
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(20));
        make.top.equalTo(self->leftImageView.mas_top).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(-LENGTH(14));
//        make.height.mas_equalTo(LENGTH(50));
    }];
    
    [stareview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(20));
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(4));
        make.width.mas_equalTo(LENGTH(60));
    }];


    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(20));
        make.top.equalTo(self->stareview.mas_bottom).with.offset(LENGTH(5));
        make.right.equalTo(ws).with.offset(-LENGTH(14));
    }];

    [DJ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(20));
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(8));
    }];

    [dengji mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(DJ.mas_right).with.offset(0);
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(8));
    }];

    [NL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->dengji.mas_right).with.offset(LENGTH(10));
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(8));
    }];

    [nengli mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(NL.mas_right).with.offset(LENGTH(0));
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(8));
    }];

    [zxyd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->nengli.mas_bottom).with.offset(LENGTH(10));
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(96));
        make.height.mas_equalTo(LENGTH(28));
    }];
    
    [huo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->nengli.mas_bottom).with.offset(LENGTH(22)+LENGTH(28));
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(8));
        make.height.mas_equalTo(LENGTH(12));
    }];
    
    [ydcs mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->huo.mas_right).with.offset(LENGTH(3));
        make.centerY.mas_equalTo(self->huo);
    }];
    
    [xihuanlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-LENGTH(12));
        make.centerY.mas_equalTo(self->ydcs);
    }];
    
    [xihuanimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->xihuanlabel.mas_left).with.offset(-LENGTH(2));
        make.centerY.mas_equalTo(self->ydcs);
        make.width.mas_equalTo(LENGTH(18));
        make.height.mas_equalTo(LENGTH(15));
    }];

    [oneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->xihuanimage).with.offset(LENGTH(10));
        make.right.mas_equalTo(ws);
        make.centerY.mas_equalTo(self->ydcs);
        make.height.mas_equalTo(LENGTH(20));
    }];
    
    zxyd.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(createProgress)];
    //将手势添加到需要相应的view中去
    [zxyd addGestureRecognizer:tapGesture2];
  
}

- (NSString *)dataFilePath{
    NSArray *pathArray =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
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
    if ([files containsObject: [NSString stringWithFormat:@"%@.txt",_model.name]]) {
        NSString * booklujing = [paths stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.txt",_model.name]];
        __weak BookXQTopView *weakSelf = self;
        NSURL *fileURL = [[NSBundle mainBundle] URLForAuxiliaryExecutable:booklujing];
        
        [DZMReadParser ParserLocalURLWithUrl:fileURL complete:^(DZMReadModel * _Nonnull readModel) {
            self->mb.label.text = @"读取成功";
            [self->mb hideAnimated:NO afterDelay:1];
            DZMReadController * read = [[DZMReadController alloc] init];
            
            read.readModel = readModel;
            
            [weakSelf.nav pushViewController:read animated:YES];
        }];
    }else if ([files containsObject: [NSString stringWithFormat:@"%@",_model.name]]) {
        self->mb.label.text = @"读取成功";
        [self->mb hideAnimated:NO afterDelay:1];
        __weak BookXQTopView *weakSelf = self;
        bookpngfile = [NSString stringWithFormat:@"%@/%@",paths,_model.name];
        bookpng = [fm subpathsAtPath:bookpngfile];
        HuiBenViewController * vc = [HuiBenViewController new];
        vc.bookpngfile = bookpngfile;
        vc.itemarray = (NSMutableArray *)bookpng;
        [weakSelf.nav pushViewController:vc animated:YES];
    }else{
        [self down];
    }
    
}

- (void)down{
    //[NSString stringWithFormat:@"%@%@",DOWNLOADZHENGSHUURL,@"1097449557765533696489"]
    mb.label.text = @"正在下载...";
    NSString * url = [NSString stringWithFormat:@"%@%@",IMAGEURL,_model.b_download];
    
    
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
        self->zipname = response.suggestedFilename;
        self->bookstring = fullPath;
        return [NSURL fileURLWithPath:fullPath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        /**
         *filePath:下载后文件的保存路径
         */
        NSArray *pathArray =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSFileManager *manager = [NSFileManager defaultManager];
        NSString *filePaths = [[pathArray firstObject] stringByAppendingPathComponent:@"booktext"];
        NSString *movePath = [filePaths stringByAppendingPathComponent:self->zipname];;
        BOOL isMove = [manager moveItemAtPath:self->bookstring toPath:movePath error:nil];
        if (isMove) {
            // 删除文件
            BOOL isDele = [manager removeItemAtPath:self->bookstring error:nil];
            if (isDele) {
                
                
            } else {
                NSLog(@"删除失败");
            }
            
        } else {
            NSLog(@"移动失败");
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
    NSString *path = [savePath stringByAppendingPathComponent:zipname];
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
        
        NSFileManager* fm=[NSFileManager defaultManager];
        NSString * paths = [self dataFilePath] ;
        NSArray *files = [fm subpathsAtPath:paths];
        if ([files containsObject: [NSString stringWithFormat:@"%@.txt",_model.name]]) {
            NSString * booklujing = [paths stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.txt",_model.name]];
            __weak BookXQTopView *weakSelf = self;
            NSURL *fileURL = [[NSBundle mainBundle] URLForAuxiliaryExecutable:booklujing];
            
            [DZMReadParser ParserLocalURLWithUrl:fileURL complete:^(DZMReadModel * _Nonnull readModel) {
                self->mb.label.text = @"读取成功";
                [self->mb hideAnimated:NO afterDelay:1];
                DZMReadController * read = [[DZMReadController alloc] init];
                
                read.readModel = readModel;
                
                [weakSelf.nav pushViewController:read animated:YES];
            }];
        }else if ([files containsObject: [NSString stringWithFormat:@"%@",_model.name]]) {
            self->mb.label.text = @"读取成功";
            [self->mb hideAnimated:NO afterDelay:1];
            __weak BookXQTopView *weakSelf = self;
            bookpngfile = [NSString stringWithFormat:@"%@/%@",paths,_model.name];
            bookpng = [fm subpathsAtPath:bookpngfile];
            HuiBenViewController * vc = [HuiBenViewController new];
            vc.bookpngfile = bookpngfile;
            vc.itemarray = (NSMutableArray *)bookpng;
            [weakSelf.nav pushViewController:vc animated:YES];
        }
        
    } else {
        self->mb.label.text = @"解压失败";
        [self->mb hideAnimated:NO afterDelay:1];
    }
}

- (void)setModel:(BookXQbookModel *)model{
    _model = model;
    zxyd.hidden = NO;
    ydcs.text = [NSString stringWithFormat:@"%@次阅读",model.read_times];
    [leftImageView sd_setImageWithURL:URLIMAGE(model.cover) placeholderImage:UIIMAGE(ZHANWEITUSHU)];
    if ([model.b_download isEqualToString:@""]) {
        zxyd.hidden = YES;
    }
    Title.text = model.name;
    stareview.redValue = [model.mark floatValue];

    subtitle.text =[NSString stringWithFormat:@"%@",model.author];
    dengji.text = [NSString stringWithFormat:@"%@",model.levels];
    nengli.text = model.b_score;
    if (_model.is_like==0) {
        xihuanimage.image =UIIMAGE(@"喜欢未选中");
    }else{
        xihuanimage.image =UIIMAGE(@"喜欢选中");
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [backImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.frame.size.height);
    }];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:yy.bounds byRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopRight cornerRadii:CGSizeMake(LENGTH(5),LENGTH(5))];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = yy.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    yy.layer.mask = maskLayer;
//    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, LENGTH(600));
    
}
- (void)setCitymodel:(CityBadgeListModel *)citymodel{
    _citymodel = citymodel;
}
- (void)setStatus:(BookReadingStyle)status{
        switch (status) {
            case BookIntensiveReading:
                jd.hidden = NO;
                break;
            case BookExtensiveReading:
                jd.hidden = YES;
                break;
            default:
                break;
        }
}


- (void)oneButton{
    if (_model.is_read ==1||_model.is_read == 2){
        NSString * love = [xihuanimage.image isEqual:UIIMAGE(@"喜欢未选中")]?@"1":@"0";
        [self loadLove:love];
    }else{
        self.block();
    }
}
- (void)oneButtons{
    _model.is_read = 1;
    NSString * love = [xihuanimage.image isEqual:UIIMAGE(@"喜欢未选中")]?@"1":@"0";
    [self loadLove:love];
}

- (void)upview:(NSString *)love{
    xihuanimage.image = [xihuanimage.image isEqual:UIIMAGE(@"喜欢未选中")]?UIIMAGE(@"喜欢选中"):UIIMAGE(@"喜欢未选中");
}
- (void)loadLove:(NSString *)love{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_LOVEANDNOLOVE];
    
    NSDictionary * dic = @{@"studentid":Me.ssid,@"bookid":_model.ssid,@"islike":love};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomePage * model = [HomePage mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self upview:love];
                //                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
            
        }else{
            
        }
    }];
}
@end
