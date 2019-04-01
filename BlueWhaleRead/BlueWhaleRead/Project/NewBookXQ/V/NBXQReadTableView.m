//
//  NBXQReadTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/19.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NBXQReadTableView.h"
#import "NBXQReadTableViewCell.h"
@interface NBXQReadTableView()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation NBXQReadTableView

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
    return _itemarray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WS(ws);
    NSString * rid;
    BookXQReadThoughtModel * model = _itemarray[indexPath.row];
    if (indexPath.row == 0) {
        if (model.cellstyle == 0) {
            rid = @"cell01";
            NBXQReadTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
            if(cell==nil){
                cell=[[NBXQReadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
                cell.top = 1;
                cell.styles = 0;
            }
            cell.model = _itemarray[indexPath.section];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBlock:^{
                [ws reloadData];
            }];
            return cell;
        }else{
            rid = @"cell02";
            NBXQReadTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
            if(cell==nil){
                cell=[[NBXQReadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
                cell.top = 1;
                cell.styles = model.cellstyle;
            }
            cell.model = _itemarray[indexPath.section];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBlock:^{
                [ws reloadData];
            }];
            return cell;
        }
    }else{
        if (model.cellstyle == 0) {
            rid = @"cell1";
            NBXQReadTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
            if(cell==nil){
                cell=[[NBXQReadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
                cell.styles = 0;
            }
            cell.model = _itemarray[indexPath.section];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBlock:^{
                [ws reloadData];
            }];
            return cell;
        }else{
            rid = @"cell2";
            NBXQReadTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
            if(cell==nil){
                cell=[[NBXQReadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
                cell.styles = model.cellstyle;
            }
            cell.model = _itemarray[indexPath.section];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setBlock:^{
                [ws reloadData];
            }];
            return cell;
        }
    }
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    //    if (Lastcell.frame.size.height>self.frame.size.height) {
    //        self.block(100);
    //    }
    
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return LENGTH(10);
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
    
    
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    self.blocks(contentOffsetY,NO);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    self.blocks(contentOffsetY,YES);
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    self.blocks(contentOffsetY,YES);
}
@end
