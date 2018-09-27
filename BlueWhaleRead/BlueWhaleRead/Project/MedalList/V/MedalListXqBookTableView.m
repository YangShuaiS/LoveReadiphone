//
//  MedalListXqBookTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/7/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalListXqBookTableView.h"
#import "BookTableViewCell.h"
#import "BookXqViewController.h"
@interface MedalListXqBookTableView()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation MedalListXqBookTableView
- (instancetype)init{
    self = [super init];
    if (self) {
        self.separatorStyle = UITableViewStyleGrouped;
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = WhitColor;
        //使tableview无数据时候无下划线
        self.tableFooterView = [[UIView alloc]init];
        self.estimatedRowHeight = 300;//估算高度
        self.rowHeight = UITableViewAutomaticDimension;
        self.layer.cornerRadius = LENGTH(20);
        self.layer.masksToBounds = YES;
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
    BookTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[BookTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.nav = self.nav;
    if ([_itemarray[0]isMemberOfClass:[CityBookListModel class]]){
        cell.model = _itemarray[indexPath.row];
    }else if ([_itemarray[0]isMemberOfClass:[AllBookListModel class]]){
        cell.allmodel = _itemarray[indexPath.row];
    }
    [cell CellColorStyleXZ];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return LENGTH(110)*0.75;
    }else{
        return 0;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return _itemarray.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = [UIColor clearColor];
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(255,251,238);
    BaseLabel * label = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:ChangYongTitLe LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    label.numberOfLines = 0;
    NSString * XZStyle = @"【点亮规则】";
    NSString * onetextstr = [NSString stringWithFormat:@"%@%@",XZStyle,_model.descriptions];
    AttributedStringModel * models = [AttributedStringModel new];
    models.textString = onetextstr;
    models.bianString = XZStyle;
    models.fount = 16;
    NSArray * modelarray = @[models];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    label.attributedText = AttributedStr;
    [v addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(v.mas_top).with.offset(LENGTH(12));
        make.left.mas_equalTo(v.mas_left).with.offset(LENGTH(2));
        make.right.mas_equalTo(v.mas_right).with.offset(-LENGTH(2));
    }];
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AllBookListModel * model = _itemarray[indexPath.row];
    BookXqViewController * vc = [BookXqViewController new];
    vc.loadId = model.ssid;
    [self.nav pushViewController:vc animated:YES];
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = LENGTH(110);
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    self.block(contentOffsetY);
}
- (void)setModel:(MedalListBadgeInfoModel *)model{
    _model = model;
}
@end
