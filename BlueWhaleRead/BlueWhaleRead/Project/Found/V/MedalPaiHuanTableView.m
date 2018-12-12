//
//  MedalPaiHuanTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/5.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalPaiHuanTableView.h"
#import "MyClassTableViewCell.h"
@interface MedalPaiHuanTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation MedalPaiHuanTableView{
    BaseView * v;

}

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
        
        v = [BaseView new];
        v.backgroundColor = [UIColor clearColor];
//        self.bounces = NO;
        

//        [self setTableHeaderView:classRanking];
//        WS(ws);
//        [classRanking mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(ws.tableHeaderView);
//            make.right.mas_equalTo(ws.tableHeaderView);
//            make.top.mas_equalTo(ws.tableHeaderView);
//            make.bottom.mas_equalTo(ws.tableHeaderView);
//            make.height.mas_equalTo(LENGTH(361));
//        }];
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
    MyClassTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[MyClassTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        cell.nav = self.nav;
    }
    if (indexPath.section == 0) {
        cell.paiming = _monthBadgeList.myRank+1;
        cell.model = _itemarray[indexPath.section];
    }else{
        cell.paiming = indexPath.section;
        cell.model = _itemarray[indexPath.section];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return
//}

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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return LENGTH(235);
    }else if (section == 1){
        return LENGTH(14);
    }
    else{
        return LENGTH(5);
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(231,242,242);
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
        return v;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"");
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
}
- (void)setMonthBadgeList:(MonthstudentModel *)monthBadgeList{
    _monthBadgeList = monthBadgeList;
    _itemarray = monthBadgeList.studentList;
    MyClassModel  * model = _itemarray[monthBadgeList.myRank];
    [_itemarray insertObject:model atIndex:0];

}

@end
