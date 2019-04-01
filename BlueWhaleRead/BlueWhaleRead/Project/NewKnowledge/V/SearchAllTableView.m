//
//  SearchAllTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/2/20.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "SearchAllTableView.h"
#import "SearchAllTableViewCell.h"
#import "SearchbannerdataTableViewCell.h"
#import "SearchbookdataTableViewCell.h"
#import "SearchknowledgedataTableViewCell.h"
@interface SearchAllTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation SearchAllTableView{
    NSMutableArray * itemarray;
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
        self.scrollEnabled = YES;
        
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
    WS(ws);
    AllSearchZYModel * models = itemarray[indexPath.row];
    if (models.style == 1) {
        SearchAllTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"SearchAllTableViewCell"];
        if(cell==nil){
            cell=[[SearchAllTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchAllTableViewCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setBlock:^(NSString * _Nonnull string) {
            ws.block(string);
        }];
        return cell;
    }else if (models.style == 2){
        SearchbannerdataTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"SearchbannerdataTableViewCell"];
        if(cell==nil){
            cell=[[SearchbannerdataTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchbannerdataTableViewCell"];
        }
        cell.itemarray = models.itemarray;
        [cell setPushblock:^(NSInteger inter) {
            ws.pushblock(inter);
        }];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (models.style == 3){
        SearchbookdataTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"SearchbookdataTableViewCell"];
        if(cell==nil){
            cell=[[SearchbookdataTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchbookdataTableViewCell"];
        }
        cell.itemarray = models.itemarray;
        [cell setPushblock:^(NSInteger inter) {
            ws.pushblock(inter);
        }];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        SearchknowledgedataTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"SearchknowledgedataTableViewCell"];
        if(cell==nil){
            cell=[[SearchknowledgedataTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchknowledgedataTableViewCell"];
        }
        cell.itemarray = models.itemarray;
        [cell setPushblock:^(NSInteger inter) {
            ws.pushblock(inter);
        }];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
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
- (void)setModel:(ALLSearchModel *)model{
    _model = model;
    itemarray = [NSMutableArray array];
    NSMutableArray * array = [[NSUserDefaults standardUserDefaults] objectForKey:SEARCHHISTORY];
    if (array.count !=0) {
        AllSearchZYModel * models = [AllSearchZYModel new];
        models.style = 1;
        models.itemarray = array;
        [itemarray addObject:models];
    }
//    if (_model.bannerdata.count > 0) {
//        AllSearchZYModel * models = [AllSearchZYModel new];
//        models.style = 2;
//        models.itemarray = _model.bannerdata;
//        [itemarray addObject:models];
//    }
    if (_model.bookdata.count > 0) {
        AllSearchZYModel * models = [AllSearchZYModel new];
        models.style = 3;
        models.itemarray = _model.bookdata;
        [itemarray addObject:models];
    }
    if (_model.knowledgedata.count > 0) {
        AllSearchZYModel * models = [AllSearchZYModel new];
        models.style = 4;
        models.itemarray = _model.knowledgedata;
        [itemarray addObject:models];
    }
    [self reloadData];
}
@end
