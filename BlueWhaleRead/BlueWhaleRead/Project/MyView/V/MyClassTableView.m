//
//  MyClassTableView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/6/1.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyClassTableView.h"
#import "MyClassTableViewCell.h"
#import "FriendViewController.h"
@interface MyClassTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation MyClassTableView

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
        self.bounces = NO;
    }
    return self;
}

#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    if (_weizhi > 3) {
        return _itemarray.count;

//    }else{
//        return _itemarray.count;
//    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    MyClassTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[MyClassTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        cell.nav = self.nav;
    }
//    if (_weizhi > 3) {
        if (indexPath.section == 0) {
            cell.paiming = _weizhi+1;
            cell.model = _itemarray[indexPath.section];
        }else{
            cell.paiming = indexPath.section;
            cell.model = _itemarray[indexPath.section];
        }
//    }else{
//        cell.paiming = indexPath.section+1;
//        cell.model = _itemarray[indexPath.section];
//    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
    if (_weizhi > 3) {
        if (section == 0) {
            return LENGTH(10);
        }else{
            return LENGTH(5);
        }
    }else{
        return LENGTH(5);

    }
   
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = [UIColor clearColor];
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyClassModel * m = _itemarray[indexPath.section];
    FriendViewController * vc = [FriendViewController new];
    vc.itemid = m.ssid;
    [self.nav pushViewController:vc animated:YES];
    
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
//    if (_weizhi > 3) {
        MyClassModel * model = itemarray[_weizhi];
        [_itemarray insertObject:model atIndex:0];
//    }
    dispatch_async(dispatch_get_main_queue(), ^{
        // UI更新代码
        [self reloadData];
    });
}
@end
