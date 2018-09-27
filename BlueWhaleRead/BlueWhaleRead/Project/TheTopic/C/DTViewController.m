//
//  DTViewController.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/23.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTViewController.h"
#import "DTTableViewCell.h"
#import "RTDragCellTableView.h"
#import "BookCityViewController.h"
@interface DTViewController ()<RTDragCellTableViewDataSource,RTDragCellTableViewDelegate,NavDelegate>
@property (nonatomic, strong) NSArray *data;

@end

@implementation DTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    self.view.backgroundColor = [UIColor redColor];
    [self AddNavtion];
    RTDragCellTableView *tableView = [[RTDragCellTableView alloc]init];
    tableView.allowsSelection = YES;
    [self.view addSubview:tableView];
//    tableView.frame = self.view.bounds;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.estimatedRowHeight = 300;//估算高度
    tableView.backgroundColor = [UIColor clearColor];
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.tableFooterView = [[UIView alloc]init];
    tableView.separatorStyle = UITableViewStylePlain;
    tableView.scrollEnabled =NO; 
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
            make.left.equalTo(ws.view).with.offset(0);
            make.right.equalTo(ws.view).with.offset(0);
            make.bottom.equalTo(ws.view).with.offset(0);
        }];
}

#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"home-Click" Title:@"挑战答题" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    
}
- (void)NavLeftClick{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[BookCityViewController class]]) {
            BookCityViewController *A =(BookCityViewController *)controller;
            [self.navigationController popToViewController:A animated:YES];
        }
    }
    
    //    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}
//
//
//- (UITableView *)tableView
//{
//    if (!_tableView) {
//        _tableView = [[BaseTableView alloc] init];
//        _tableView.separatorStyle = UITableViewStylePlain;
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//        _tableView.backgroundColor = [UIColor clearColor];
//        //使tableview无数据时候无下划线
//        _tableView.tableFooterView = [[UIView alloc]init];
//        _tableView.estimatedRowHeight = 300;//估算高度
//        _tableView.rowHeight = UITableViewAutomaticDimension;
//
//    }
//    return _tableView;
//}
//
//#pragma mark  - tableViewDelegate代理方法
//
//- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 1000;
//}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSString * rid = @"cell";
//    XinZengXunZhangTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
//    if(cell==nil){
//        cell=[[XinZengXunZhangTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
//    }
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    return cell;
//
//}
//
//
////- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
////{
////    return
////}
//- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 0;
//}
//-(NSArray *)cellsForTableView:(UITableView *)tableView
//{
//    NSInteger sections = tableView.numberOfSections;
//    NSMutableArray *cells = [[NSMutableArray alloc]  init];
//    for (int section = 0; section < sections; section++) {
//        NSInteger rows =  [tableView numberOfRowsInSection:section];
//        for (int row = 0; row < rows; row++) {
//            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
//            [cells addObject:[tableView cellForRowAtIndexPath:indexPath]];
//        }
//    }
//    return cells;
//}
//- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 0;
//}
//
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView * v = [UIView new];
//    v.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
//    return v;
//}
//
//- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//
//}
//
//#pragma mark 选择编辑模式，添加模式很少用,默认是删除
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return UITableViewCellEditingStyleNone;
//}
//#pragma mark 排序 当移动了某一行时候会调用
//
//- (BOOL)tableView:(UITableView *)tableview shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
//    return NO;
//}
//
////编辑状态下，只要实现这个方法，就能实现拖动排序
//-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
//{
//    // 取出要拖动的模型数据
////    Goods *goods = _goodsAry[sourceIndexPath.row];
//    //删除之前行的数据
////    [_goodsAry removeObject:goods];
//    // 插入数据到新的位置
////    [_goodsAry insertObject:goods atIndex:destinationIndexPath.row];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
























- (NSArray *)data{
    if (!_data) {
        NSMutableArray *arr2 = [NSMutableArray array];
        for (int j = 0; j < 7 ; j ++) {
            NSString * str = @"123";
            [arr2 addObject:str];
        }
        _data = arr2;
    }
    return _data;
}

#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    DTTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[DTTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.name = [NSString stringWithFormat:@"#############%ld",(long)indexPath.row];
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

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}



- (NSArray *)originalArrayDataForTableView:(RTDragCellTableView *)tableView{
    return _data;
}

- (void)tableView:(RTDragCellTableView *)tableView newArrayDataForDataSource:(NSArray *)newArray{
    _data = newArray;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 50;
//}

@end
