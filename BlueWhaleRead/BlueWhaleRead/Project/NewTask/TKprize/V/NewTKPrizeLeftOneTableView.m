//
//  NewTKPrizeLeftOneTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/28.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NewTKPrizeLeftOneTableView.h"
#import "NewTKPrizeLeftOneTableViewCell.h"
@interface NewTKPrizeLeftOneTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation NewTKPrizeLeftOneTableView

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
    }
    return self;
}

#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    TKPListModel * model = _itemArray[section];
//    return model.prizeList.count;
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    NewTKPrizeLeftOneTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[NewTKPrizeLeftOneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.itemArray = _itemArray;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return LENGTH(1000);
//}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = [UIColor whiteColor];
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.blocks(scrollView.contentOffset.y);
}
@end