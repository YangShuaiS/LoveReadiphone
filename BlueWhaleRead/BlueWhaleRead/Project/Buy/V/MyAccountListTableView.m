//
//  MyAccountListTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/26.
//  Copyright © 2019 YS. All rights reserved.
//

#import "MyAccountListTableView.h"
#import "MyAccountListTableViewCell.h"

@interface MyAccountListTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation MyAccountListTableView
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
    MyAccountListTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[MyAccountListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.model = _itemarray[indexPath.row];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

//- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 0;
//}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * view = [UIView new];
    BaseLabel * label = [[BaseLabel alloc] initWithTxteColor:RGB(171,171,171) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentCenter Text:@"暂无更多订单"];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(view).with.insets(UIEdgeInsetsMake(LENGTH(15), 0, LENGTH(15), 0));
    }];
    return view;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    [self shareMiniProgram];
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self)
    {
        CGFloat sectionHeaderHeight = 0;
        CGFloat sectionFooterHeight = LENGTH(40);
        CGFloat offsetY = scrollView.contentOffset.y;
        if (offsetY >= 0 && offsetY <= sectionHeaderHeight)
        {
            scrollView.contentInset = UIEdgeInsetsMake(-offsetY, 0, -sectionFooterHeight, 0);
        }else if (offsetY >= sectionHeaderHeight && offsetY <= scrollView.contentSize.height - scrollView.frame.size.height - sectionFooterHeight)
        {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, -sectionFooterHeight, 0);
        }else if (offsetY >= scrollView.contentSize.height - scrollView.frame.size.height - sectionFooterHeight && offsetY <= scrollView.contentSize.height - scrollView.frame.size.height)
        {
            scrollView.contentInset = UIEdgeInsetsMake(-offsetY, 0, -(scrollView.contentSize.height - scrollView.frame.size.height - sectionFooterHeight), 0);
        }
    }
}

@end
