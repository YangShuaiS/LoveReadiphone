//
//  MyMedalTableView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyMedalTableView.h"
#import "MyMedalTopTableViewCell.h"
#import "MyMedalTableViewCell.h"
@interface MyMedalTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MyMedalTableView
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
    if (_model.badgestudent.count ==0) {
        return _model.myBadge.count;

    }else{
        return _model.myBadge.count+1;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_model.badgestudent.count ==0) {
        NSString * rid = @"cell";
        MyMedalTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[MyMedalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        }
        cell.nav = self.nav;
        cell.model = _model.myBadge[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        if (indexPath.row == 0) {
            NSString * rid = @"celltop";
            MyMedalTopTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
            if(cell==nil){
                cell=[[MyMedalTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
            }
            cell.nav = self.nav;
            cell.model = _model;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            NSString * rid = @"cell";
            MyMedalTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
            if(cell==nil){
                cell=[[MyMedalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
            }
            cell.nav = self.nav;
            cell.model = _model.myBadge[indexPath.row-1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
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
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
}
- (void)setModel:(MyBadgeListModel *)model{
    _model = model;
    [self reloadData];
}
@end
