//
//  HomeActivityTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeActivityTableView.h"
#import "HomeActivityTopTableViewCell.h"
#import "BookTableViewCell.h"
#import "BookXqViewController.h"

@interface HomeActivityTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HomeActivityTableView

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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti1) name:kNotificationAcitivity object:nil];
    }
    
    return self;
}
- (void)noti1{
    //保证立马刷新
    [self reloadData];
    
//    UITableViewRowAnimationFade,
//    UITableViewRowAnimationRight,           // slide in from right (or out to right)
//    UITableViewRowAnimationLeft,
//    UITableViewRowAnimationTop,
//    UITableViewRowAnimationBottom,
//    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];
//    [self reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
//            NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];
//            [self reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}
#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _itemarray.count+1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid;
    if (indexPath.section == 0) {
        rid = @"celltopview";
        HomeActivityTopTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[HomeActivityTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.hiden = _hiden;
        cell.model = _model.tag;
        return cell;
    }else{
        rid = @"cell";
        BookTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[BookTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (cell.nav == nil) {
            cell.nav = self.nav;
        }
        cell.model = _itemarray[indexPath.section-1];
        return cell;
    }

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
    if (section == 0) {
        return LENGTH(10);
    }else{
        return LENGTH(6);
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = TABLEVIEWCELLROW;
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = TABLEVIEWCELLROW;
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section>0) {
        CityBookListModel * mod = _itemarray[indexPath.section-1];
        BookXqViewController * vc = [BookXqViewController new];
        vc.loadId = mod.ssid;
        [self.nav pushViewController:vc animated:YES];
    }
    
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}
- (void)setModel:(ZHUTIMODEL *)model{
    _model = model;
}

@end
