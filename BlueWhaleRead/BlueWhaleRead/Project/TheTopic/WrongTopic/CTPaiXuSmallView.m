//
//  CTPaiXuSmallView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "CTPaiXuSmallView.h"
#import "DTTiMuView.h"
#import "DTPaiXUnLeftView.h"

#import "CTTableViewCell.h"
@interface CTPaiXuSmallView ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) BaseTableView *tableView;

@end
@implementation CTPaiXuSmallView{
    DTTiMuView * tiMu;
    NSArray * cellarray;
    BaseLabel * bookName;
    
    DTPaiXUnLeftView * leftView;
    NSMutableArray * endarray;

}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    endarray = [NSMutableArray array];
    bookName = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(19) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:bookName];
    [bookName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws);
        make.top.equalTo(ws).with.offset(NavHeight+LENGTH(12));
    }];
    
    tiMu = [DTTiMuView new];
    [self addSubview:tiMu];
    [tiMu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->bookName.mas_bottom).with.offset(LENGTH(30));
        make.left.equalTo(ws).with.offset(LENGTH(15));
        make.right.equalTo(ws).with.offset(-LENGTH(15));
    }];
    [self addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->tiMu.mas_bottom).with.offset(LENGTH(15));
        make.left.equalTo(ws).with.offset(LENGTH(58));
        make.right.equalTo(ws).with.offset(-LENGTH(16));
        make.height.mas_equalTo(HEIGHT);
        make.bottom.mas_equalTo(ws).with.offset(-LENGTH(16));
    }];
    
    leftView = [DTPaiXUnLeftView new];
    [self addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.tableView.mas_top);
        make.bottom.mas_equalTo(ws.tableView.mas_bottom).with.offset(-LENGTH(11));
        make.right.mas_equalTo(ws.tableView.mas_left).with.offset(-LENGTH(8));
        make.width.mas_equalTo(LENGTH(35));
    }];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self uptableview];
    });
}
- (void)uptableview{
    cellarray = [self cellsForTableView:_tableView];
    CGFloat itemHeight = 0;
    for (CTTableViewCell * cell in cellarray) {
        itemHeight = itemHeight + cell.frame.size.height;
    }
    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(itemHeight);
    }];
}
- (void)setStyle:(DaTiStyle)style{
    _style = style;
    tiMu.style = style;
    tiMu.TiMuText = @"我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题";
}
- (void)setTImu:(NSString *)tImu{
    _tImu = tImu;
    tiMu.TiMuText = tImu;
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
- (void)layoutSubviews{
    [super layoutSubviews];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[BaseTableView alloc] init];
        _tableView.separatorStyle = UITableViewStylePlain;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        //使tableview无数据时候无下划线
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.estimatedRowHeight = 300;//估算高度
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.scrollEnabled =NO;
        
    }
    return _tableView;
}

#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return endarray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TiMuModel * zqmodel = endarray[indexPath.row];

    NSString * rid = @"cell";
    CTTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[CTTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
     cell.timodel = zqmodel;
    cell.style = 2;
    return cell;
    
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
    UIView * v = [UIView new];
    v.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    return v;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)setBookname:(NSString *)bookname{
    _bookname = bookname;
    bookName.text = bookname;
}
- (void)setTiModel:(TiStyleModel *)tiModel{
    if (_tiModel == nil) {
        _tiModel = tiModel;
        leftView.inter = tiModel.timuarray.count;
        if (_style == DTPaiXuStyle) {
            endarray = tiModel.yhdaarray;
        }else{
            endarray = tiModel.zqdaarray;
        }
        
        
        [_tableView reloadData];
    }
}

@end
