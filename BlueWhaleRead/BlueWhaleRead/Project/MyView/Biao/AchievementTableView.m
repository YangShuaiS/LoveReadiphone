//
//  AchievementTableView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "AchievementTableView.h"
#import "AchievementTableViewCell.h"
@interface AchievementTableView ()<UITableViewDelegate,UITableViewDataSource>{
    NSIndexPath *lastIndePath;
    NSMutableArray * itemarray;

}

@end

@implementation AchievementTableView
- (instancetype)init{
    self = [super init];
    if (self) {
        itemarray = [NSMutableArray array];
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
    return itemarray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = [NSString stringWithFormat:@"cell%ld",(long)indexPath.row];
    AchievementTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[AchievementTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.glossaryNum = _model.glossaryNum;
    cell.literacyNum = _model.literacyNum;
    cell.myReadNum = _model.myReadNum;
    if (indexPath.row == 0) {
        cell.style = ChartStyleRadar;
        cell.readBalance = _model.readBalance;
    }else if (indexPath.row == 1){
        cell.style = ChartStyleRadarNengLi;
        cell.readPower = _model.readPower;
    }else if (indexPath.row == 2){
        cell.style = ChartStyleYueDuLiang;
        cell.readNum = _model.readNum;
    }else if (indexPath.row == 3){
        cell.style = ChartStyleSHIZI;
        cell.literacy = _model.literacy;
    }else if (indexPath.row == 4){
        cell.style = ChartStyleSHICI;
        cell.glossary = _model.glossary;
    }
    else{
        cell.style = 999;
    }
    cell.name = itemarray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    dispatch_async(dispatch_get_main_queue(), ^{
        CGFloat contentOffsetY = scrollView.contentOffset.y;
        NSArray * array = [self indexPathsForVisibleRows];
        NSIndexPath *scrollIndexPath;
        if (array.count>0) {
            scrollIndexPath = array[0];
        }
        if (self->lastIndePath == nil) {
            self->lastIndePath = scrollIndexPath;
        }
        if (![scrollIndexPath isEqual:self->lastIndePath]) {
            NSInteger inter = scrollIndexPath.row;
            self.clickTag(inter);
            self->lastIndePath = scrollIndexPath;
        }
        self.floa(contentOffsetY);
    });
    
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

- (void)setDowninter:(NSInteger)downinter{
    _downinter = downinter;
    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:downinter inSection:0];
    
    [self scrollToRowAtIndexPath:scrollIndexPath
                            atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)setTiao:(NSInteger)tiao{
    _tiao = tiao;
    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:tiao inSection:0];
    
    [self scrollToRowAtIndexPath:scrollIndexPath
                atScrollPosition:UITableViewScrollPositionTop animated:NO];
}
- (void)setModel:(AchievementModel *)model{
    _model = model;
    itemarray = [NSMutableArray array];
    for (AchievementReportModel * m in model.report) {
        [itemarray addObject:m.report_name];
    }
    
    [self reloadData];
}
@end
