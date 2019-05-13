//
//  NBCOtherReadBookTableView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/11.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NBCOtherReadBookTableView.h"
#import "NBCOtherReadBookTableViewCell.h"
@interface NBCOtherReadBookTableView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation NBCOtherReadBookTableView

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
//    return _itemArray.count;
//    TypeListModel * model = _itemArray[section];
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _itemArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    NBCOtherReadBookTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[NBCOtherReadBookTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    TypeListModel * model = _itemArray[indexPath.section];
    cell.itemArray = model.bookList;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return
//}
//- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return LENGTH(15);
//}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
    return v;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    TypeListModel * model = _itemArray[section];

    BaseLabel * title = [[BaseLabel alloc] initWithTxteColor:RGB(39, 39, 39) LabelFont:TextFontCu(16) TextAlignment:NSTextAlignmentLeft Text:model.name];
    [v addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(v).with.offset(LENGTH(10));
        make.bottom.mas_equalTo(v).with.offset(LENGTH(10));
        make.left.mas_equalTo(v).with.offset(LENGTH(22));
    }];
    
    FLAnimatedImageView * bakimage = [FLAnimatedImageView new];
    bakimage.image = UIIMAGE(@"backhei");
    [v addSubview:bakimage];
    [bakimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(title.mas_right).with.offset(LENGTH(7));
        make.centerY.mas_equalTo(title);
        make.width.mas_equalTo(LENGTH(7));
        make.height.mas_equalTo(LENGTH(14));
    }];
    bakimage.transform = CGAffineTransformMakeRotation(M_PI);

    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    [self reloadData];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.contentSize.height);
    }];
}
@end
