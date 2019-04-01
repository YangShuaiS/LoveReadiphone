//
//  SearchXGBookTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/15.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchXGBookTableView.h"
#import "BookTableViewCell.h"
#import "NewBookXQViewController.h"
@interface SearchXGBookTableView()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation SearchXGBookTableView
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
    if (_allinter == 0) {
        return _itemarray.count;
    }else{
        NSInteger inter = 0;
        if (_itemarray.count > _allinter) {
            inter = _allinter;
        }else{
            inter = _itemarray.count;
        }
        return inter;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid;
    rid = @"cell";
    BookTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[BookTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.model = _itemarray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

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
   
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    return v;
   
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewBookXQViewController * vc = [NewBookXQViewController new];
    CityBookListModel * model = _itemarray[indexPath.row];
    vc.loadId = model.ssid;
    [[self viewController].navigationController pushViewController:vc animated:YES];
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (_allinter!=0) {
    WS(ws);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.contentSize.height);
    }];
    }
}

@end
