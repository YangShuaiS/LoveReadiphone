//
//  NBCBookDanTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/11.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NBCBookDanTableView.h"
#import "NBCBookDanTableViewCell.h"
@interface NBCBookDanTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation NBCBookDanTableView

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
        self.scrollEnabled = NO;
    }
    return self;
}

#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return _itemArray.count;
//    return 4;
    if (_itemArray.count > 4) {
        return 4;
    }else{
        return _itemArray.count;
    }

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    NBCBookDanTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[NBCBookDanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.model = _itemArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return
//}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return LENGTH(0);
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return LENGTH(0);
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = [UIColor clearColor];
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}

@end
