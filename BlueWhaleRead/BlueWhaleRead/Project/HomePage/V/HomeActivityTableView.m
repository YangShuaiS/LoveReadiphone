//
//  HomeActivityTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeActivityTableView.h"
#import "HomeActivityTopTableViewCell.h"
#import "BookTableViewCell.h"
#import "NewBookXQViewController.h"
#import "BookDanTableViewCell.h"

#import "HomeActivityHeaderView.h"
@interface HomeActivityTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HomeActivityTableView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.separatorStyle = UITableViewStyleGrouped;
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];
        //使tableview无数据时候无下划线
        self.tableFooterView = [[UIView alloc]init];
        self.estimatedRowHeight = 300;//估算高度
        self.rowHeight = UITableViewAutomaticDimension;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti1) name:kNotificationAcitivity object:nil];
    }
    
    return self;
}
- (void)noti1{
    //保证立马刷新
    [self reloadData];
    
//    UITableViewRowAnimationFade,
//    UITableViewRowAnimationRight,           // slide in from right (or out to right)
//    UITableViewRowAnimationLeft,
//    UITableViewRowAnimationTop,
//    UITableViewRowAnimationBottom,
//    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];
//    [self reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
//            NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:0];
//            [self reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}
#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 ) {
        return 1;
    }else{
        NSMutableArray * array = _itemarray[section-1];
        return array.count;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _itemarray.count+1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid;
    if (indexPath.section == 0) {
        rid = @"celltopview";
        HomeActivityTopTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[HomeActivityTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (_model != nil) {
            cell.hiden = _hiden;
            cell.model = _model.tag;
        }
        return cell;
    }else{
//        if ([_model.tag.style_id isEqualToString:@"2"]) {
//            rid = @"cell";
//            BookDanTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
//            if(cell==nil){
//                cell=[[BookDanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
//            }
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            if (cell.nav == nil) {
//                cell.nav = self.nav;
//            }
//            cell.dj = [NSString stringWithFormat:@"%ld",indexPath.section];
//            cell.model = _itemarray[indexPath.section-1];
//
//            cell.layer.shadowColor = RGB(0, 0, 0).CGColor;
//            cell.layer.shadowOffset = CGSizeMake(0,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
//            cell.layer.shadowRadius = LENGTH(10);
//            cell.layer.shadowOpacity = 0.08;
//
//            return cell;
//        }else{
        NSMutableArray * array = _itemarray[indexPath.section-1];
            rid = @"cell";
            BookTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
            if(cell==nil){
                cell=[[BookTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if (cell.nav == nil) {
                cell.nav = self.nav;
            }
        if (array.count != 0) {
            cell.model = array[indexPath.row];
        }
        
//            cell.layer.shadowColor = RGB(0, 0, 0).CGColor;
//            cell.layer.shadowOffset = CGSizeMake(0,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
//            cell.layer.shadowRadius = LENGTH(10);
//            cell.layer.shadowOpacity = 0.08;
        
            return cell;
//        }
  
    }


}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return
//}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    if (section == 0) {
        return 0;
    }else{
        NSMutableArray * array = _itemarray[section-1];
        if (array.count == 0) {
            return 0;
        }else{
            return LENGTH(70);
        }
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{

    return LENGTH(0);

//    if (section == 0) {
//        return LENGTH(0);
//    }else{
//        NSMutableArray * array = _itemarray[section-1];
//        if (array.count == 0) {
//            return 0;
//        }else{
//            return LENGTH(23);
//        }
//    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
//    v.layer.shadowOffset = CGSizeMake(0,LENGTH(5));//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
//    v.layer.shadowRadius = LENGTH(5);
//    v.layer.shadowOpacity = 0.8;
    if (section == 1) {
//        v.layer.shadowColor = RGB(250,184,184).CGColor;
        v.backgroundColor = RGB(211,242,242);
    }else if (section == 2){
//        v.layer.shadowColor = RGB(149,199,245).CGColor;
        v.backgroundColor = RGB(252,218,218);
    }else if (section == 3){
//        v.layer.shadowColor = RGB(255,219,152).CGColor;
        v.backgroundColor = RGB(211,231,249);
    }else if (section == 4){
//        v.layer.shadowColor = RGB(211,203,252).CGColor;
        v.backgroundColor = RGB(251,238,213);
    }else if (section == 5){
//        v.layer.shadowColor = RGB(253,185,240).CGColor;
        v.backgroundColor = RGB(235,232,250);
//        v.layer.shadowOpacity = 1;
    }else if (section == 6){
//        v.layer.shadowRadius = 0;
        v.backgroundColor = RGB(247,233,244);
    }
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UIView * v = [UIView new];
        return v;
    }else{
        NSMutableArray * array = _itemarray[section-1];
        if (array.count == 0) {
            UIView * v = [UIView new];
            return v;
        }else{
            NSString * rid = [NSString stringWithFormat:@"cell%ld",section];
            HomeActivityHeaderView*headV=[tableView  dequeueReusableHeaderFooterViewWithIdentifier:rid];
            if (!headV) {
                headV=[[HomeActivityHeaderView alloc]initWithReuseIdentifier:rid];
                headV.itemarray = _itemarray;
                headV.section = section;
            }
            return headV;
        }
    }
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section>0) {
        NSMutableArray * array = _itemarray[indexPath.section-1];
        CityBookListModel * mod = array[indexPath.row];
        NewBookXQViewController * vc = [NewBookXQViewController new];
        vc.loadId = mod.ssid;
        [self.nav pushViewController:vc animated:YES];
    }
    
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}
- (void)setModel:(ZHUTIMODEL *)model{
    _model = model;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView == self)
//    {
//        CGFloat sectionHeaderHeight = LENGTH(70);
//        CGFloat sectionFooterHeight = LENGTH(23);
//        CGFloat offsetY = scrollView.contentOffset.y;
//        if (offsetY >= 0 && offsetY <= sectionHeaderHeight)
//        {
//            scrollView.contentInset = UIEdgeInsetsMake(-offsetY, 0, -sectionFooterHeight, 0);
//        }else if (offsetY >= sectionHeaderHeight && offsetY <= scrollView.contentSize.height - scrollView.frame.size.height - sectionFooterHeight)
//        {
//            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, -sectionFooterHeight, 0);
//        }else if (offsetY >= scrollView.contentSize.height - scrollView.frame.size.height - sectionFooterHeight && offsetY <= scrollView.contentSize.height - scrollView.frame.size.height)
//        {
//            scrollView.contentInset = UIEdgeInsetsMake(-offsetY, 0, -(scrollView.contentSize.height - scrollView.frame.size.height - sectionFooterHeight), 0);
//        }
//    }
//
//}
@end
