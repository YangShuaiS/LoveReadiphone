//
//  CommentsTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/9.
//  Copyright © 2019 YS. All rights reserved.
//

#import "CommentsTableView.h"
#import "CommentsTableViewCell.h"
@interface CommentsTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation CommentsTableView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.separatorStyle = UITableViewStyleGrouped;
//        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];
        //使tableview无数据时候无下划线
        self.tableFooterView = [[UIView alloc]init];
        self.estimatedRowHeight = 300;//估算高度
        self.rowHeight = UITableViewAutomaticDimension;
//        self.scrollEnabled = NO;
        //        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _itemarray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    WS(ws);
    CommentsTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[CommentsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.model = _itemarray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setBlocks:^(PingLunModel * _Nonnull model) {
        [ws upmodel:model];
    }];
    return cell;
}
- (void)upmodel:(PingLunModel *)model{
    [_itemarray removeObject:model];
    [self reloadData];
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [UIView new];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.contentSize.height);
    }];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
@end
