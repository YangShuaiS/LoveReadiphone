//
//  ShouCangTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/14.
//  Copyright © 2019 YS. All rights reserved.
//

#import "ShouCangTableView.h"
#import "ShouCangTableViewCell.h"
@interface ShouCangTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation ShouCangTableView

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
        self.allowsSelectionDuringEditing=YES;

        self.rowHeight = UITableViewAutomaticDimension;
    }
    return self;
}
#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _itemarray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return _itemarray.count;
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = [NSString stringWithFormat:@"cell"];
    ShouCangTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[ShouCangTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.model = _itemarray[indexPath.row];
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

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return LENGTH(0);
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
    //处于编辑状态下
    if (self.editing) {
        NHProverbModel * promodel = _itemarray[indexPath.row];
        promodel.clicksatatus = promodel.clicksatatus==1?0:1;
        [self reloadData];
    }else{
        //非编辑状态下
        self.blocks(indexPath.row);
    }
}
- (void)updata:(NSIndexPath *)indexPath{
    [_itemarray removeObjectAtIndex:indexPath.section];
    [self reloadData];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return UITableViewCellEditingStyleNone;
}


- (void)setIntertype:(NSInteger)intertype{
    _intertype = intertype;
    if (intertype == 0) {
        [self setEditing:NO animated:YES];
    }else{
        [self setEditing:YES animated:YES];

    }
}

- (void)EditEndRefresh {
    [self reloadData];
}

@end
