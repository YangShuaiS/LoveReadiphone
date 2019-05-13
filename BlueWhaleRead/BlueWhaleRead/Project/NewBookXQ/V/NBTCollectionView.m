//
//  NBTCollectionView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBTCollectionView.h"
#import "NBTCollectionViewCell.h"
#import "NewBookTopClickModel.h"
#import "BlueWhaleRead-Swift.h"
#import "HuiBenViewController.h"
#import "NBookBuyViewController.h"
#import "DTALLiewController.h"

#import "NewHpViewModel.h"
#import "GuideDaTiTwoView.h"
#import "GuideDaTiOneView.h"
#import "GuideDaTiThreeView.h"
#import "GuideDaTiFourView.h"
#import "BuyPopPurchaseView.h"
@interface NBTCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation NBTCollectionView{
    NSString * bookpngfile;
    NSArray * bookpng;
    NSURLSessionDownloadTask *_downloadTask;
    NSString * bookstring;
    NSMutableArray * viewarray;
    
    NSString * zipname;
    TheTopPicModel * Topmodel;
    MBProgressHUD * mb ;
    BuyPopPurchaseView *PopPurchase;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //注册cell和ReusableView（相当于头部）
        [self registerClass:[NBTCollectionViewCell class] forCellWithReuseIdentifier:@"NBTCollectionViewCell"];
        
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        // 设置是否允许滚动
        self.scrollEnabled = YES;
        //背景颜色
        self.backgroundColor = [UIColor clearColor];
        //自适应大小
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.scrollsToTop = NO;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        WS(ws);
        mb = [MBProgressHUD new];
        mb.label.text = @"";
//        [mb showAnimated:YES];
        mb.removeFromSuperViewOnHide = NO;
//        [mb hideAnimated:YES afterDelay:0];
        [[[[UIApplication sharedApplication] delegate] window] addSubview:mb];
        [mb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo([[[UIApplication sharedApplication] delegate] window]);
        }];

    }
    return self;
}
#pragma mark *** UICollectionViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _itemArray.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NBTCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NBTCollectionViewCell" forIndexPath:indexPath];
    cell.model = _itemArray[indexPath.row];
    return cell;
}


-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    WS(ws);
    NewBookTopClickModel * model = _itemArray[indexPath.row];
    if (model.style == 0) {
        if (indexPath.row == 0) {
            if (_is_read == 1||_is_read == 2||_is_read == 999){
                model.is_like = model.is_like == 1?0:1;
                [self loadLove:[NSString stringWithFormat:@"%ld",model.is_like] NewBookTopClickModel:model];
            }else{
                [self addbookcityNewBookTopClickModel:model];
            }
        }
        if (indexPath.row == 1) {
            [self dati];
        }
        
        if (indexPath.row == 2) {
            [self gomai];
        }
        
        if (indexPath.row == 3) {
            if (Me.is_member == 0) {
                if (PopPurchase == nil) {
                    PopPurchase = [BuyPopPurchaseView new];
                    PopPurchase.nav = [self viewController].navigationController;
                    [[self viewController].view addSubview:PopPurchase];
                    [PopPurchase mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.edges.mas_equalTo([self viewController].view);
                    }];
                    [PopPurchase setRemove:^{
                        self->PopPurchase = nil;
                    }];
                }
            }else{
                [self createProgress];
            }
        }
    }
}



- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.contentSize.height);
    }];
}

- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}


- (void)loadLove:(NSString *)love NewBookTopClickModel:(NewBookTopClickModel*)models{
    __block NBTCollectionView * blockSelf = self;
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_LOVEANDNOLOVE];
    
    NSDictionary * dic = @{@"studentid":Me.ssid,@"bookid":_bookid,@"islike":love};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomePage * model = [HomePage mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                models.image = [models.image isEqualToString:@"组 457"]?@"组 459":@"组 457";
                [blockSelf reloadData];
            }else if ([model.code isEqual:@Notloggedin]){
                blockSelf.block();
            }
            
        }else{
            
        }
    }];
}

- (void)addbookcityNewBookTopClickModel:(NewBookTopClickModel*)model{
    __block NBTCollectionView * blockSelf = self;
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_JOOINBOOKCITY];
    //studentid 学生id
    NSDictionary * dic = @{@"bookid":_bookid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            JoinBookModel * models = [JoinBookModel mj_objectWithKeyValues:responseObject];
            if ([models.code isEqual:@200]) {
                model.is_like = model.is_like == 1?0:1;
                blockSelf.is_read = 999;
                [self loadLove:[NSString stringWithFormat:@"%ld",model.is_like] NewBookTopClickModel:model];
            }else if ([models.code isEqual:@Notloggedin]){
                blockSelf.block();
            }
            [self->mb showAnimated:YES];
            self->mb.label.text = models.message;
            [self->mb hideAnimated:YES afterDelay:1];
        }else{
            [self->mb showAnimated:YES];
            self->mb.label.text = @"网络请求失败";
            [self->mb hideAnimated:YES afterDelay:1];
        }
    }];
    //待定
    
}




- (NSString *)dataFilePath{
    NSArray *pathArray =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePaths = [[pathArray firstObject] stringByAppendingPathComponent:@"booktext"];
    return filePaths;
}
- (void)createProgress{
    YSGmBouncedView * view = [[YSGmBouncedView alloc] initWithMessage:@"正在读取...."];
    [view AddWindow];
    NSFileManager* fm=[NSFileManager defaultManager];
    NSString * paths = [self dataFilePath] ;
    NSArray *files = [fm subpathsAtPath:paths];
    __weak NBTCollectionView *weakSelf = self;
    if ([files containsObject: [NSString stringWithFormat:@"%@.txt",_model.book.name]]) {
        NSString * booklujing = [paths stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.txt",_model.book.name]];
        NSURL *fileURL = [[NSBundle mainBundle] URLForAuxiliaryExecutable:booklujing];
        
        [DZMReadParser ParserLocalURLWithUrl:fileURL complete:^(DZMReadModel * _Nonnull readModel) {
//            [self->mb showAnimated:YES];
//            self->mb.label.text = @"读取成功";
//            [self->mb hideAnimated:YES afterDelay:1];
            YSGmBouncedView * view = [[YSGmBouncedView alloc] initWithMessage:@"读取成功"];
            [view AddWindow];

            DZMReadController * read = [[DZMReadController alloc] init];
            
            read.readModel = readModel;
            
            [[weakSelf viewController].navigationController pushViewController:read animated:YES];
        }];
    }else if ([files containsObject: [NSString stringWithFormat:@"%@",_model.book.name]]) {
//        [self->mb showAnimated:YES];
//        self->mb.label.text = @"读取成功";
//        [self->mb hideAnimated:YES afterDelay:1];
        YSGmBouncedView * view = [[YSGmBouncedView alloc] initWithMessage:@"读取成功"];
        [view AddWindow];
        bookpngfile = [NSString stringWithFormat:@"%@/%@",paths,_model.book.name];
        bookpng = [fm subpathsAtPath:bookpngfile];
        HuiBenViewController * vc = [HuiBenViewController new];
        vc.bookpngfile = bookpngfile;
        vc.itemarray = (NSMutableArray *)bookpng;
        [[weakSelf viewController].navigationController pushViewController:vc animated:YES];
    }else{
        [self down];
    }
    
}

- (void)down{
    [self->mb showAnimated:YES];
    self->mb.label.text = @"正在下载...";
    [self->mb hideAnimated:YES afterDelay:1];
    NSString * url = [NSString stringWithFormat:@"%@%@",IMAGEURL,_model.book.b_download];
    
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
            [self->mb showAnimated:YES];
            [self->mb hideAnimated:YES afterDelay:1];
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
    [self->mb showAnimated:YES];
    self->mb.label.text = @"正在解压...";
    [self->mb hideAnimated:YES afterDelay:1];
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
        [self->mb showAnimated:YES];
        self->mb.label.text = @"解压成功";
        [self->mb hideAnimated:YES afterDelay:1];
        // 删除文件
        BOOL isDele = [manager removeItemAtPath:self->bookstring error:nil];
        if (isDele) {
            NSLog(@"删除成功");
        } else {
            NSLog(@"删除失败");
        }
        [self->mb showAnimated:YES];
        self->mb.label.text = @"正在读取...";
        [self->mb hideAnimated:YES afterDelay:1];
        NSFileManager* fm=[NSFileManager defaultManager];
        NSString * paths = [self dataFilePath] ;
        NSArray *files = [fm subpathsAtPath:paths];
        __weak NBTCollectionView *weakSelf = self;
        if ([files containsObject: [NSString stringWithFormat:@"%@.txt",_model.book.name]]) {
            NSString * booklujing = [paths stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.txt",_model.book.name]];
            NSURL *fileURL = [[NSBundle mainBundle] URLForAuxiliaryExecutable:booklujing];
            
            [DZMReadParser ParserLocalURLWithUrl:fileURL complete:^(DZMReadModel * _Nonnull readModel) {
//                [self->mb showAnimated:YES];
//                self->mb.label.text = @"读取成功";
//                [self->mb hideAnimated:YES afterDelay:1];
                YSGmBouncedView * view = [[YSGmBouncedView alloc] initWithMessage:@"读取成功"];
                [view AddWindow];
                DZMReadController * read = [[DZMReadController alloc] init];
                
                read.readModel = readModel;
                
                [[weakSelf viewController].navigationController pushViewController:read animated:YES];
            }];
        }else if ([files containsObject: [NSString stringWithFormat:@"%@",_model.book.name]]) {
//            [self->mb showAnimated:YES];
//            self->mb.label.text = @"读取成功";
//            [self->mb hideAnimated:YES afterDelay:1];
            YSGmBouncedView * view = [[YSGmBouncedView alloc] initWithMessage:@"读取成功"];
            [view AddWindow];
            bookpngfile = [NSString stringWithFormat:@"%@/%@",paths,_model.book.name];
            bookpng = [fm subpathsAtPath:bookpngfile];
            HuiBenViewController * vc = [HuiBenViewController new];
            vc.bookpngfile = bookpngfile;
            vc.itemarray = (NSMutableArray *)bookpng;
            [[weakSelf viewController].navigationController pushViewController:vc animated:YES];
        }
        
    } else {
        [self->mb showAnimated:YES];
        self->mb.label.text = @"解压失败";
        [self->mb hideAnimated:YES afterDelay:1];
    }
}


- (void)dati{
    if (_is_read == 1||_is_read == 2||_is_read == 999){
        [self upviewdati];
    }else{
        [self addbookcity];

    }
}
- (void)upviewdati{
    __weak NBTCollectionView * blockSelf = self;

    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TZDTTIMU];
    NSDictionary * dic = @{@"bookid":_model.book.ssid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            self->Topmodel = [TheTopPicModel mj_objectWithKeyValues:responseObject];
            if ([self->Topmodel.code isEqual:@200]) {
                blockSelf.model.book.dayTimes --;
                blockSelf.model = blockSelf.model;
                GeneralUpView * genView = [GeneralUpView new];
                genView.style = PopUpViewStyleAnswer;
                [blockSelf.window addSubview:genView];
                [genView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.mas_equalTo(blockSelf.window);
                }];
                NSString *str_minute = [NSString stringWithFormat:@"%02ld",(self->Topmodel.time%3600)/60];//分

                GenPopViewModel * m = [GenPopViewModel new];
                m.title = @"答题说明";
//                NSMutableArray * arr = blockSelf.model.badgeList;
                CityBadgeListModel * citymodel = [CityBadgeListModel new];
//                if (arr.count>0) {
//                    citymodel = arr[0];
//                }else{
                    citymodel.name = @"";
//                }
                m.subtitle = [NSString stringWithFormat:@"一共%ld道题\n你必须在%@分钟之内答完所有题目\n\n你准备好了吗？",self->Topmodel.bookProblems.count,str_minute];
                genView.model = m;
                [genView setBlock:^{
                    DTALLiewController * vc = [DTALLiewController new];
                    vc.style = DTBookStyle;
                    vc.titles = @"挑战答题";
                    vc.Topmodel = self->Topmodel;
                    vc.bookid = blockSelf.model.book.ssid;
                    vc.bookname = blockSelf.model.book.name;
                    vc.bookfenshu = blockSelf.model.book.b_score;
                    [[blockSelf viewController].navigationController pushViewController:vc animated:YES];
                }];
                if ([[[BaseObject jsd_getCurrentViewController] class] isEqual:[[self viewController] class]]) {
                    static dispatch_once_t onceToken;
                    dispatch_once(&onceToken, ^{
                        [blockSelf addGuideDaTiOneView];
                    });
                }
            }else if ([self->Topmodel.code isEqual:@Notloggedin]){
                blockSelf.block();
            }
            [self->mb showAnimated:YES];
            self->mb.label.text = self->Topmodel.message;
            [self->mb hideAnimated:YES afterDelay:1];
        }else{
            [self->mb showAnimated:YES];
            self->mb.label.text = @"网络请求失败";
            [self->mb hideAnimated:YES afterDelay:1];
        }
    }];
}
- (void)addbookcity{
    __weak NBTCollectionView * blockSelf = self;
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_JOOINBOOKCITY];
    //studentid 学生id
    NSDictionary * dic = @{@"bookid":_model.book.ssid,@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            JoinBookModel * models = [JoinBookModel mj_objectWithKeyValues:responseObject];
            if ([models.code isEqual:@200]) {
                blockSelf.model.book.is_read = 1;
                [blockSelf upviewdati];
            }else if ([models.code isEqual:@Notloggedin]){
                blockSelf.block();
            }
            [self->mb showAnimated:YES];
            self->mb.label.text = models.message;
            [self->mb hideAnimated:YES afterDelay:1];
        }else{
            [self->mb showAnimated:YES];
            self->mb.label.text = @"网络请求失败";
            [self->mb hideAnimated:YES afterDelay:1];
        }
    }];
}
- (void)gomai{
    NBookBuyViewController * vc = [NBookBuyViewController new];
    for (BookBuyLinkModel * model in _model.bookBuyLink) {
//        NSLog(@"%ld",model.source);
    }
    vc.itemarray = _model.bookBuyLink;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}


- (void)addGuideDaTiOneView{
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",BENDIXINXI]];
    NSMutableDictionary *dataDictionary = [BaseObject BenDiXinXi];
    NewHpViewModel * model = [NewHpViewModel mj_objectWithKeyValues:dataDictionary];
    if ([model.ydydati integerValue]<3) {
        WS(ws);
        GuideDaTiOneView * view = [GuideDaTiOneView new];
        [self.window addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.window);
        }];
        [view setBlock:^{
            [ws addGuideDaTiTwoView];
        }];
        
        NSString * str = [NSString stringWithFormat:@"%ld",[model.ydydati integerValue]+1];
        [dataDictionary setValue:str forKey:@"ydydati"];
        [dataDictionary writeToFile:filePatch atomically:YES];
    }
    
    
    
}
- (void)addGuideDaTiTwoView{
    WS(ws);
    GuideDaTiTwoView * view = [GuideDaTiTwoView new];
    [self.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.window);
    }];
    [view setBlock:^{
        [ws addGuideDaTiThreeView];
    }];
}

- (void)addGuideDaTiThreeView{
    WS(ws);
    GuideDaTiThreeView * view = [GuideDaTiThreeView new];
    [self.window addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.window);
        }];
    [view setBlock:^{
        [ws addGuideDaTiFourView];
    }];
}

- (void)addGuideDaTiFourView{
    WS(ws);
    GuideDaTiFourView * view = [GuideDaTiFourView new];
    [self.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.window);
    }];
    [view setBlock:^{
        
    }];
}

@end
