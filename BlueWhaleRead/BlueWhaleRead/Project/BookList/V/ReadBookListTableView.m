  //
//  ReadBookListTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ReadBookListTableView.h"
#import "BookTableViewCell.h"
#import "BookXqViewController.h"
@interface ReadBookListTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation ReadBookListTableView

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
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _itemarray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    BookTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[BookTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.nav = self.nav;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([_itemarray[0]isMemberOfClass:[ReadbookModel class]]) {
        cell.bookCase = BookCaseStyleSJYD;
        cell.readBookModel = _itemarray[indexPath.section];
    }else if ([_itemarray[0]isMemberOfClass:[AllBookListModel class]]){
        cell.allmodel  = _itemarray[indexPath.section];
    }
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (_inter == 0) {
        return LENGTH(5);
    }else{
        return LENGTH(1);
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(231,242,242);
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookXqViewController * vc = [BookXqViewController new];
    AllBookListModel * model = _itemarray[indexPath.section];
    vc.loadId = model.ssid;
    [self.nav pushViewController:vc animated:YES];
    
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self UpDataHeight];
    });
}

- (void)UpDataHeight{
    if (_itemarray.count >0) {
//        CGFloat tabheight = 0.0;
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//        BookTableViewCell * cell = [self cellForRowAtIndexPath:indexPath];
//        tabheight = cell.frame.size.height*_itemarray.count+LENGTH(1)*_itemarray.count;
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(HEIGHT);
        }];
    }
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
- (void)layoutSubviews{
    [super layoutSubviews];
}
@end
