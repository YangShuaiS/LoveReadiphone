//
//  ChaKanCuoTiViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ChaKanCuoTiViewController.h"
#import "BookCityViewController.h"
#import "DTDanXuanCollectionViewCell.h"

#import "DTALLiewController.h"
#import "BookListViewController.h"
#import "BeiJingView.h"
#define itemWidth WIDTH
#define itemHeight HEIGHT
@interface ChaKanCuoTiViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate,MedalXQDelegate>
@property (nonatomic, strong) UICollectionView *collectionView; /**< 集合视图 */

@end

@implementation ChaKanCuoTiViewController{
    BaseLabel * title;
    BaseLabel * fankuilabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WS(ws);
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

}

#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    WS(ws);
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"查看错题"];
    [self.view addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.view).with.offset(StatusBar+14);
    }];
    
    FLAnimatedImageView * right = [FLAnimatedImageView new];
    right.image = UIIMAGE(@"icon_返回_细");
    [self.view addSubview:right];
    
    [right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(LENGTH(27));
        make.top.equalTo(ws.view).with.offset(StatusBar+LENGTH(10));
        make.height.mas_equalTo(22);
        make.width.mas_equalTo(12);
    }];
    
    
    BaseButton * LeftBigButton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [LeftBigButton addTarget:self action:@selector(left) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:LeftBigButton];
    
    [LeftBigButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(@44);
        make.width.mas_equalTo(@75);
    }];
    
//    BaseView * fankui = [BaseView new];
//    fankui.backgroundColor = RGBA(255,255,255,0.6);
//    fankui.layer.masksToBounds = YES;
//    fankui.layer.cornerRadius = LENGTH(19);
//    [self.view addSubview:fankui];
//    [fankui mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(right.mas_centerY);
//        make.right.mas_equalTo(ws.view).with.offset(-LENGTH(27));
//        make.width.mas_equalTo(LENGTH(238));
//        make.height.mas_equalTo(LENGTH(38));
//    }];
//
//    fankuilabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(252,132,3) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@"题有错误，反馈一下"];
//    [self.view addSubview:fankuilabel];
//    [fankuilabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(fankui);
//    }];
//
//    BaseButton * rightBigButton = [BaseButton buttonWithType:UIButtonTypeCustom];
//    [rightBigButton addTarget:self action:@selector(right) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:rightBigButton];
//
//    [rightBigButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self->fankuilabel);
//    }];
    
}
- (void)left{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)right{
//    fankuilabel.text = @"已反馈";
//    fankuilabel.textColor = RGB(33, 33, 33);
}
#pragma mark *** UICollectionViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _cuotiarray.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // item重用机制
    NSString * rid = [NSString stringWithFormat:@"cell%ld",(long)indexPath.row];
    DTDanXuanCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];
    cell.delegate = self;
    TiStyleModel * model = _cuotiarray[indexPath.row];
    if (model.type == 1) {
        cell.style = CTDuoXuanStyle;
    }else if (model.type == 2){
        cell.style = CTLianXianStyle;
    }else if (model.type == 3){
        cell.style = CTPaiXuStyle;
    }else{
        cell.style = CTDanXuanStyle;
    }
    if (indexPath.row == 0) {
                if (_cuotiarray.count == 1) {
                    cell.dtdownstyle = DTStyleWithBack;
                }else{
                    cell.dtdownstyle = DTStyleWithOneNext;
                }
    }else if (indexPath.row == _cuotiarray.count-1){
            cell.dtdownstyle = DTStyleWithLastAndPushBack;
    }else{
        cell.dtdownstyle = DTStyleWithLastAndNext;
    }
    cell.bookName = _bookname;
    cell.stylemodel = model;
    return cell;

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
        for (NSInteger i = 0 ; i<20; i++) {
            NSString * rid = [NSString stringWithFormat:@"cell%ld",(long)i];
            [_collectionView registerClass:[DTDanXuanCollectionViewCell class] forCellWithReuseIdentifier:rid];
        }
        //设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // 设置是否允许滚动
        _collectionView.scrollEnabled = YES;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc{
    
}

- (void)PushFriendViewCOntroller:(PushModel *)model{
    switch (model.style) {
        case DtPushBookList:
            [self pushjieguo];
            break;
        case DaTiTiaoCHuanXiaYiTi:
            [self NextTI];
            break;
        case DaTiTiaoCHuanShangYiTi:
            [self LastTI];
            break;
        default:
            break;
    }
}

- (void)pushjieguo{

    switch (_style) {
        case DTBookStyle:
            [self bookjieguo];
            break;
        case DTXunZhangStyle:
            [self xunzhangJieguo];
            break;
        default:
            break;
    }
}
- (void)bookjieguo{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    NSMutableArray *marr = [[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
    for (UIViewController *vc in marr) {
        if ([vc isKindOfClass:[BookListViewController class]]) {
            [self.navigationController popToViewController:vc animated:YES];
            return;
        }
    }
    BookListViewController * vc = [BookListViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)NextTI{
    NSInteger inter = _collectionView.contentOffset.x/WIDTH;
    inter ++;
    if (inter<=_cuotiarray.count-1) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:inter inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    
}
- (void)LastTI{
    NSInteger inter = _collectionView.contentOffset.x/WIDTH;
    inter --;
    if (inter<=_cuotiarray.count-1) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:inter inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}

- (void)xunzhangJieguo{
//    TZJieGuoViewController * vc = [TZJieGuoViewController new];
//    vc.style = _style;
//    [self.navigationController pushViewController:vc animated:YES];
}


- (void)setCuotiarray:(NSMutableArray *)cuotiarray{
    _cuotiarray = cuotiarray;

    [_collectionView reloadData];
}
@end
