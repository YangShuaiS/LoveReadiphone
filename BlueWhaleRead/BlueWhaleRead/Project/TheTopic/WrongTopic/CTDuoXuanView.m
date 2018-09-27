
//
//  CTDuoXuanView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/25.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "CTDuoXuanView.h"
#import "DTTiMuView.h"
#import "CTTableViewCell.h"
#import "DTDownLasOrNextView.h"

@interface CTDuoXuanView ()<UITableViewDelegate,UITableViewDataSource,DtDownDelegate>
@property (strong, nonatomic) BaseTableView *tableView;

@end
@implementation CTDuoXuanView

{
    DTTiMuView * tiMu;
    NSArray * cellarray;
    
    UIScrollView * scrollView;
    DTDownLasOrNextView * downView;
    BaseLabel * bookName;

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
    
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    bookName = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(25) TextAlignment:NSTextAlignmentLeft Text:@"《书名》"];
    [scrollView addSubview:bookName];
    [bookName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws);
        make.top.equalTo(self->scrollView.mas_top).with.offset(NavHeight+LENGTH(46));
    }];
    
    tiMu = [DTTiMuView new];
    tiMu.style = DTDuoXuanStyle;
    tiMu.TiMuText = @"我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题";
    [scrollView addSubview:tiMu];
    [tiMu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->bookName.mas_bottom).with.offset(LENGTH(23));
        make.left.equalTo(ws).with.offset(LENGTH(52));
        make.right.equalTo(ws).with.offset(-LENGTH(52));
    }];
    
    [scrollView addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->tiMu.mas_bottom).with.offset(LENGTH(50));
        make.left.equalTo(ws).with.offset(LENGTH(134));
        make.right.equalTo(ws).with.offset(-LENGTH(92));
        make.height.mas_equalTo(HEIGHT);
    }];
    
    downView = [DTDownLasOrNextView new];
    downView.delegate = self;
    [scrollView addSubview:downView];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.tableView.mas_bottom).with.offset(LENGTH(80));
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(50));
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
    return 6;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    CTTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[CTTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.style = 0;
    }else{
        cell.style = 1;
        
    }
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
- (void)setDtdownstyle:(DtLastOrNext)dtdownstyle{
    if (downView.dtdownstyle==0) {
        _dtdownstyle = dtdownstyle;
        downView.dtdownstyle = dtdownstyle;
    }
    
}

- (void)DtDownClick:(PushModel *)model{
    [self.delegate PushFriendViewCOntroller:model];
}

@end
