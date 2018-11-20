//
//  SearchView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/21.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "SearchView.h"
#import "BookTableViewCell.h"
#import "BookXqViewController.h"
@interface SearchView ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) BaseTableView *tableView;

@end
@implementation SearchView{
    UITextField * textField;
    NSMutableArray * array;
    GeneraNoDataView * wdView;

}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{

    
    BaseView * backView = [BaseView new];
    backView.backgroundColor = [UIColor whiteColor];
    backView.alpha = 0.7;
    [self addSubview:backView];
    
    BaseView * NavView = [BaseView new];
    NavView.backgroundColor = MAINCOLOR;
    [self addSubview:NavView];
    
    BaseView * text = [BaseView new];
    text.backgroundColor = RGB(255, 255, 255);
    text.alpha = 0.3;
    text.layer.masksToBounds = YES;
    text.layer.cornerRadius = 15;
    [NavView addSubview:text];
    
    textField = [UITextField new];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.backgroundColor = [UIColor clearColor];
    textField.placeholder = @"请输入书名";
//    textField.font = TextFont(15);
    [textField becomeFirstResponder];//默认编辑状态
    [textField addTarget:self action:@selector(phoneNum_tfChange:) forControlEvents:UIControlEventEditingChanged];

//    textField.textColor = [UIColor redColor]; //字体颜色
    [text addSubview:textField];
    
    BaseButton * quxiao = [BaseButton buttonWithType:UIButtonTypeCustom];
    [quxiao addTarget:self action:@selector(quxiao) forControlEvents:UIControlEventTouchUpInside];
    [quxiao setTitle:@"取消" forState:UIControlStateNormal];
    [quxiao setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    quxiao.titleLabel.font = TextFont(16);
    quxiao.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:quxiao];
    
    WS(ws);
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    [NavView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
        make.height.mas_equalTo(NavHeight);
    }];
    
    [text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(NavView.mas_left).with.offset(LENGTH(60));
        make.right.mas_equalTo(NavView.mas_right).with.offset(-LENGTH(60));
        make.bottom.mas_equalTo(NavView.mas_bottom).with.offset(-6);
        make.height.mas_equalTo(30);
    }];

    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(NavView.mas_left).with.offset(LENGTH(60));
        make.right.mas_equalTo(NavView.mas_right).with.offset(-LENGTH(60));
        make.bottom.mas_equalTo(NavView.mas_bottom).with.offset(-6);
        make.height.mas_equalTo(30);
    }];
    
    [quxiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->textField.mas_right).with.offset(LENGTH(0));
        make.centerY.mas_equalTo(self->textField.mas_centerY);
        make.right.equalTo(backView.mas_right).with.offset(0);
        make.height.mas_equalTo(self->textField.mas_height);
    }];
    
    [self addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(NavView.mas_bottom).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[BaseTableView alloc] init];
        _tableView.separatorStyle = UITableViewStylePlain;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.allowsMultipleSelectionDuringEditing = YES;
        
        _tableView.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
        //使tableview无数据时候无下划线
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.estimatedRowHeight = 300;//估算高度
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
    }
    return _tableView;
}
#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;
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
        cell.nav = self.nav;
        cell.lastview = self;
    }
    cell.model = array[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return
//}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return LENGTH(5);
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
    BookXqViewController * vc = [BookXqViewController new];
    CityBookListModel * model = array[indexPath.row];
    vc.loadId = model.ssid;
    [self.nav pushViewController:vc animated:YES];
    [self quxiao];

}

#pragma mark ---------- textfieltdel
- (void)phoneNum_tfChange:(UITextField *)textField
{
    UITextRange *selectedRange = textField.markedTextRange;
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    if (position) {
        return;
    }
    if (textField.text.length>=2) {
        NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_SOUSUOSHUKU];
        //studentid 学生id
        NSDictionary * dic = @{@"studentid":Me.ssid,@"bookName":textField.text};
        [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
            if (responseObject) {
                SearchCitBookModel * model = [SearchCitBookModel mj_objectWithKeyValues:responseObject];
                if ([model.code isEqual:@200]) {
                    [self UpData:model];
                }
            }else{
                
            }
        }];
    }else{
        array = [NSMutableArray array];
        [_tableView reloadData];
    }
    
}

- (void)UpData:(SearchCitBookModel *)model{
    array = model.data;
    if (array.count == 0) {
        if (wdView == nil) {
            [self addShaFa];
        }else{
            [wdView removeFromSuperview];
            [self addShaFa];
        }
    }else{
        if (wdView != nil) {
            [wdView removeFromSuperview];
        }
    }
    [_tableView reloadData];
}
- (void)quxiao{
    [textField resignFirstResponder];

    [UIView animateWithDuration:1 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)addShaFa{
    WS(ws);
    wdView = [GeneraNoDataView new];
    wdView.backgroundColor = WhitColor;
    wdView.image = @"icon_缺省页_书";
    wdView.titlename = @"哎呀，这本书好像溜走了，换一本试试～";
    wdView.style = NoDtaaViewStyleImageLabel;
    [self addSubview:wdView];
    [wdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(NavHeight);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
    }];
    
}
@end
