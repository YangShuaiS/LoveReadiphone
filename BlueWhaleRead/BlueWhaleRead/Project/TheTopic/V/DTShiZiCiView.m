//
//  DTShiZiCiView.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/30.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DTShiZiCiView.h"
#import "DTTableViewCell.h"
#import "DTTiMuView.h"
@interface DTShiZiCiView ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) BaseTableView *tableView;

@end
@implementation DTShiZiCiView

{
    DTTableViewCell * lastCell;
    NSArray * cellarray;
    DTTiMuView * tiMu;
    BaseLabel *Confirm;
    
    NSMutableArray * itemarray;
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
    itemarray = [NSMutableArray array];

    
    tiMu = [DTTiMuView new];
    [self addSubview:tiMu];
    [tiMu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(87)+NavHeight);
        make.left.equalTo(ws).with.offset(LENGTH(52));
        make.right.equalTo(ws).with.offset(-LENGTH(52));
    }];
    
    [self addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->tiMu.mas_bottom).with.offset(LENGTH(58));
        make.left.equalTo(ws).with.offset(LENGTH(126));
        make.right.equalTo(ws).with.offset(-LENGTH(126));
        make.height.mas_equalTo(HEIGHT);
        
    }];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self uptableview];
    });
}
- (void)uptableview{
    cellarray = [self cellsForTableView:_tableView];
    CGFloat itemHeight = 0;
    for (DTTableViewCell * cell in cellarray) {
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
    return itemarray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    DTTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[DTTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.name = itemarray[indexPath.row];
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
    if (lastCell == nil) {
        lastCell = cellarray[indexPath.row];
        lastCell.style = 0;
    }else{
        lastCell.style = 1;
        lastCell = cellarray[indexPath.row];
        lastCell.style = 0;
    }
    PushModel * model = [PushModel new];
    model.style = DaTiTiaoCHuanXiaYiTi;
    [self.delegate PushFriendViewCOntroller:model];
}



-(void)setEndCell:(NSInteger)EndCell{
    _EndCell = EndCell;
    if (EndCell == 1) {
        Confirm = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255, 255, 255) LabelFont:TextFont(18) TextAlignment:NSTextAlignmentCenter Text:@"提交"];
        Confirm.backgroundColor = RGB(61,112,201);
        Confirm.layer.masksToBounds = YES;
        Confirm.layer.cornerRadius = LENGTH(28);
        Confirm.userInteractionEnabled = YES;
        [self addSubview:Confirm];
        
        WS(ws);
        [Confirm mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.tableView.mas_bottom).with.offset(LENGTH(58));
            make.centerX.mas_equalTo(ws);
            make.width.mas_equalTo(LENGTH(208));
            make.height.mas_equalTo(LENGTH(56));
        }];
        
        //添加手势
        UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
        //将手势添加到需要相应的view中去
        [Confirm addGestureRecognizer:tapGesture1];
    }
}

//确认答案点击事件
- (void)tapGesture1{
    PushModel * model = [PushModel new];
    
    if (_EndCell == 1) {
        model.style = PushDaTiJieGuo;
    }else{
        model.style = DaTiTiaoCHuanXiaYiTi;
    }
    [self.delegate PushFriendViewCOntroller:model];
}

- (void)setInter:(NSInteger)inter{
    _inter = inter;
    if (_inter == 0) {
        tiMu.style = CTPaiXuStyle;
        tiMu.TiMuText = @"我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题我是题";
    }else{
        tiMu.style = DTShiZiTu;
    }
}


- (void)setModel:(SZLListModel *)model{
    _model = model;
    if (_inter == 0) {
        tiMu.TiMuText = model.meaning;
    }else{
        tiMu.image = model.picture;
    }
    
    
    if (![model.word1 isEqualToString:@""]) {
        [itemarray addObject:model.word1];
    }
    if (![model.word2 isEqualToString:@""]) {
        [itemarray addObject:model.word2];

    }
    if (![model.word3 isEqualToString:@""]) {
        [itemarray addObject:model.word3];

    }
    if (![model.word4 isEqualToString:@""]) {
        [itemarray addObject:model.word4];
    }
}

- (void)setScmodel:(SCLListMOdel *)scmodel{
    _scmodel = scmodel;
    if (_inter == 0) {
        tiMu.TiMuText = scmodel.meaning;
    }else{
        tiMu.image = scmodel.picture;
    }
    
    
    if (![scmodel.vocabulary1 isEqualToString:@""]) {
        [itemarray addObject:scmodel.vocabulary1];
    }
    if (![scmodel.vocabulary2 isEqualToString:@""]) {
        [itemarray addObject:scmodel.vocabulary2];
    }
    if (![scmodel.vocabulary3 isEqualToString:@""]) {
        [itemarray addObject:scmodel.vocabulary3];
    }
    if (![scmodel.vocabulary4 isEqualToString:@""]) {
        [itemarray addObject:scmodel.vocabulary4];
    }

}
@end
