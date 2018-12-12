//
//  ShiZiOrCiLiangViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ShiZiOrCiLiangViewController.h"
#import "BookCityViewController.h"
#define itemWidth WIDTH
#define itemHeight HEIGHT

#import "ShiZiOrShiCiTableViewCell.h"

#import "DTJieGuoViewController.h"
#import "TZJieGuoViewController.h"
#import "ShiZiOrShiCIJieGuoViewController.h"

#import "BeiJingView.h"
@interface ShiZiOrCiLiangViewController ()<NavDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView; /**< 集合视图 */

@end

@implementation ShiZiOrCiLiangViewController{
    BaseLabel * page;
    BaseLabel * TimeLabel;
    
    NSTimer * time;
    NSInteger  seconds;
    
    NSInteger nextInter;
    NSMutableArray * itemarray;
    BaseLabel * title;
}
#pragma mark ------------- 请求数据
- (void)loadUpData{
    if ([_titles isEqualToString:@"识字量检测"]) {
        [self loadszl];
    }else if ([_titles isEqualToString:@"识词量检测"]){
        [self loadscl];
    }
}

- (void)loadszl{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TISHIZILIANGKS];
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:nil andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ShiZiLiangModel * model = [ShiZiLiangModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }
        }else{

        }
    }];
}

- (void)UpData:(ShiZiLiangModel *)model{
    itemarray = [NSMutableArray array];
//    itemarray = model.literacy;
    [_collectionView reloadData];
    page.text = [NSString stringWithFormat:@"1/%lu",(unsigned long)itemarray.count];

}


- (void)loadscl{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TISHIZILIANGKS];
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:nil andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ShiCiLiangModel * model = [ShiCiLiangModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpDatasc:model];
            }
            
        }else{
            
        }
    }];
}

- (void)UpDatasc:(ShiCiLiangModel *)model{
    itemarray = [NSMutableArray array];
//    itemarray = model.glossary;
    [_collectionView reloadData];
    page.text = [NSString stringWithFormat:@"1/%lu",(unsigned long)itemarray.count];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    WS(ws);

    [self loadUpData];
    BeiJingView * backImageView = [BeiJingView new];
    [self.view addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    [self.view addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.mas_equalTo(ws);
        make.left.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    [self AddNavtion];

    page = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(20) TextAlignment:NSTextAlignmentLeft Text:@"1/1"];
    [self.view addSubview:page];
    [page mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(LENGTH(55));
        make.top.equalTo(ws.view).with.offset(NavHeight+LENGTH(46));
    }];
    
//    FLAnimatedImageView * TimeImage = [FLAnimatedImageView new];
//    TimeImage.backgroundColor = RANDOMCOLOR;
//    [self.view addSubview:TimeImage];
    
    
//    seconds = 60*60 + 2*60 + 40;//总秒数
//    time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownAction) userInfo:nil repeats:YES]; //启动倒计时后会每秒钟调用一次方法 countDownAction
//    [[NSRunLoop mainRunLoop] addTimer:time forMode:NSRunLoopCommonModes];
    
//    //设置倒计时显示的时间
//    NSString *str_hour = [NSString stringWithFormat:@"%02d",seconds/3600];//时
//    NSString *str_minute = [NSString stringWithFormat:@"%02d",(seconds%3600)/60];//分
//    NSString *str_second = [NSString stringWithFormat:@"%02d",seconds%60];//秒
//    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
//    TimeLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentRight Text:format_time];
//    [self.view addSubview:TimeLabel];
//    [TimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(ws.view).with.offset(-LENGTH(55));
//        make.centerY.mas_equalTo(self->page.mas_centerY);
//    }];
    
//    [TimeImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self->TimeLabel.mas_left).with.offset(-LENGTH(10));
//        make.centerY.mas_equalTo(self->page.mas_centerY);
//    }];
    
}
//-(void) countDownAction{
//    //倒计时-1
//    seconds--;
//    NSString *str_hour = [NSString stringWithFormat:@"%02d",seconds/3600];
//    NSString *str_minute = [NSString stringWithFormat:@"%02d",(seconds%3600)/60];
//    NSString *str_second = [NSString stringWithFormat:@"%02d",seconds%60];
//    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
//    //修改倒计时标签现实内容
//    TimeLabel.text = format_time;
//    //当倒计时到0时，做需要的操作，比如验证码过期不能提交
//    if(seconds==0){
//        [time invalidate];
//        time = nil;
//    }
//    MJExtensionLog(@"%d",seconds);
//}


#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    WS(ws);
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:_titles];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+14);
    }];
    
}

//
//- (void)NavCenterClick {
//
//}
//
//
//- (void)NavRightClick {
//
//}


#pragma mark *** UICollectionViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return itemarray.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // item重用机制
    NSString * rid = [NSString stringWithFormat:@"cell%ld",(long)indexPath.row];
    WS(ws);
    if ([itemarray[indexPath.row]isMemberOfClass:[SZLListModel class]]) {
        SZLListModel * model = itemarray[indexPath.row];
        ShiZiOrShiCiTableViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];
        //        cell.backgroundColor = RANDOMCOLOR;
//        if (model.type == 1) {
//            cell.style = DTSHiZiOrShiCiTu;
//        }else{
//            cell.style = DTSHiZiOrShiCi;
//        }
        cell.szorci = model;
        [cell setClickTag:^(PushModel *model) {
            [ws PushFriendViewCOntroller:model];
        }];
        return cell;
    }else{
        SCLListMOdel * model = itemarray[indexPath.row];
        ShiZiOrShiCiTableViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];
        //        cell.backgroundColor = RANDOMCOLOR;
        if (model.type == 1) {
            cell.style = DTSHiZiOrShiCiTu;
        }else{
            cell.style = DTSHiZiOrShiCi;
        }
        cell.scorci = model;
        [cell setClickTag:^(PushModel *model) {
            [ws PushFriendViewCOntroller:model];
        }];
        return cell;
    }
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize size = CGSizeMake(itemWidth,itemHeight);
    return size;
}
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
        //定义每个UICollectionView 横向的间距
        flowLayout.minimumLineSpacing = LENGTH(0);
        //定义每个UICollectionView 纵向的间距
        flowLayout.minimumInteritemSpacing = LENGTH(0);
        //定义每个UICollectionView 的边距距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(0), 0, LENGTH(0));//上左下右
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
        
        //注册cell和ReusableView（相当于头部）
        for (NSInteger i = 0 ; i<10; i++) {
            NSString * rid = [NSString stringWithFormat:@"cell%ld",(long)i];
            [_collectionView registerClass:[ShiZiOrShiCiTableViewCell class] forCellWithReuseIdentifier:rid];
        }
        //设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // 设置是否允许滚动
        _collectionView.scrollEnabled = NO;
        //背景颜色
        _collectionView.pagingEnabled = YES;
        _collectionView.scrollsToTop = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        //自适应大小
        _collectionView.bounces = NO;
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.scrollsToTop = NO;
        
    }
    return _collectionView;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/WIDTH+1;
    page.text = [NSString stringWithFormat:@"%ld/%lu",(long)index,(unsigned long)itemarray.count];
    
    if (index ==itemarray.count) {
        NSIndexPath * indextoath = [NSIndexPath indexPathForRow:index-1 inSection:0];
        ShiZiOrShiCiTableViewCell *cell = (ShiZiOrShiCiTableViewCell*)[_collectionView cellForItemAtIndexPath:indextoath];
        cell.EndCell = 1;
        //    cell.style = DTLianXianStyle;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc{
    
}


- (void)PushFriendViewCOntroller:(PushModel *)model{
    switch (model.style) {
        case PushDaTiJieGuo:
            [self pushjieguo];
            break;
        case DaTiTiaoCHuanXiaYiTi:
            [self NextTI];
            break;
        default:
            break;
    }
}


- (void)pushjieguo{
    
    if ([_titles isEqualToString:@"识字量检测"]) {
        [self pushszjieguo];
    }else if ([_titles isEqualToString:@"识词量检测"]){
        [self pushscjieguo];
    }
}
- (void)pushszjieguo{
    ShiZiOrShiCIJieGuoViewController * vc = [ShiZiOrShiCIJieGuoViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)pushscjieguo{
    ShiZiOrShiCIJieGuoViewController * vc = [ShiZiOrShiCIJieGuoViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)NextTI{
    NSInteger inter = _collectionView.contentOffset.x/WIDTH;
    inter ++;
    if (inter<=itemarray.count-1) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:inter inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}
@end
