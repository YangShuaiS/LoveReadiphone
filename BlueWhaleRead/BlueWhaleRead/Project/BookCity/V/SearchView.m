//
//  SearchView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/21.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "SearchView.h"
#import "BookTableViewCell.h"
#import "NewBookXQViewController.h"
#import "SearchMENUView.h"
@interface SearchView ()<UITextFieldDelegate>

@end
@implementation SearchView{
    UITextField * textField;
    NSMutableArray * array;
    GeneraNoDataView * wdView;
    SearchMENUView * men;
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
    [self addSubview:backView];
    
    BaseView * NavView = [BaseView new];
    NavView.backgroundColor = RGB(242, 242, 242);
    [self addSubview:NavView];
    
    BaseView * text = [BaseView new];
    text.backgroundColor = RGB(255, 255, 255);
    text.layer.masksToBounds = YES;
    text.layer.cornerRadius = LENGTH(15);
    [NavView addSubview:text];
    
    textField = [UITextField new];
    textField.layer.masksToBounds = YES;
    textField.layer.cornerRadius = LENGTH(15);
    textField.borderStyle = UITextBorderStyleNone;
    textField.returnKeyType = UIReturnKeySearch;//变为搜索按钮
    textField.backgroundColor = [UIColor clearColor];
    textField.placeholder = @"请输入书名";
    textField.font = TextFont(11);
    [textField becomeFirstResponder];//默认编辑状态
    [textField addTarget:self action:@selector(phoneNum_tfChange:) forControlEvents:UIControlEventEditingChanged];
    textField.delegate = self;
//    textField.textColor = [UIColor redColor]; //字体颜色
    [text addSubview:textField];
    
    BaseButton * quxiao = [BaseButton buttonWithType:UIButtonTypeCustom];
    [quxiao addTarget:self action:@selector(quxiao) forControlEvents:UIControlEventTouchUpInside];
    [quxiao setTitle:@"取消" forState:UIControlStateNormal];
    [quxiao setTitleColor:RGB(31, 31, 41) forState:UIControlStateNormal];
    quxiao.titleLabel.font = TextFont(13);
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
        make.height.mas_equalTo(LENGTH(102));
    }];
    
    [text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(NavView.mas_left).with.offset(LENGTH(17));
        make.right.mas_equalTo(NavView.mas_right).with.offset(-LENGTH(54));
        make.top.mas_equalTo(NavView.mas_top).with.offset(LENGTH(27));
        make.height.mas_equalTo(LENGTH(30));
    }];

    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(text).with.offset(LENGTH(12));
        make.right.mas_equalTo(text).with.offset(-LENGTH(12));
        make.top.mas_equalTo(text);
        make.height.mas_equalTo(LENGTH(30));
    }];
    
    [quxiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->textField.mas_right).with.offset(LENGTH(0));
        make.centerY.mas_equalTo(self->textField.mas_centerY);
        make.right.equalTo(backView.mas_right).with.offset(0);
        make.height.mas_equalTo(self->textField.mas_height);
    }];
    
    men = [SearchMENUView new];
    [self addSubview:men];
    [men mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(text.mas_bottom);
        make.left.and.right.and.bottom.mas_equalTo(ws);
    }];
    men.titarray = @[@"全部",@"文章",@"书籍",@"知识图"];

}
- (void)setControllerArray:(NSMutableArray *)controllerArray{
    _controllerArray = controllerArray;
    men.controllerArray = controllerArray;
}


//#pragma mark ---------- textfieltdel
- (void)phoneNum_tfChange:(UITextField *)textField
{
//    UITextRange *selectedRange = textField.markedTextRange;
//    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
//    if (position) {
//        return;
//    }
//    if (textField.text.length>=2) {
//        NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_SOUSUOSHUKU];
//        //studentid 学生id
//        NSDictionary * dic = @{@"studentid":Me.ssid,@"bookName":textField.text};
//        [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
//            if (responseObject) {
//                SearchCitBookModel * model = [SearchCitBookModel mj_objectWithKeyValues:responseObject];
//                if ([model.code isEqual:@200]) {
//                    [self UpData:model];
//                }else if ([model.code isEqual:@Notloggedin]){
//                    [self UpDengLu];
//                }
//            }else{
//
//            }
//        }];
//    }else{
//        array = [NSMutableArray array];
//        [_tableView reloadData];
//    }
//
}


- (void)quxiao{
    [[self viewController].navigationController popViewControllerAnimated:NO];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if (![textField.text isEqualToString:@""]) {
        self.block(textField.text);
        NSMutableArray * arrays = [NSMutableArray array];
        [arrays addObject:textField.text];
        NSMutableArray * array = [[NSUserDefaults standardUserDefaults] objectForKey:SEARCHHISTORY];
        [arrays addObjectsFromArray:array];
        [[NSUserDefaults standardUserDefaults] setObject:arrays forKey:SEARCHHISTORY];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSNotification *notification =[NSNotification notificationWithName:SEARCHHISTORY object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }

    return YES;
}
- (void)setTitle:(NSString *)title{
    _title = title;
    textField.text = title;
}
- (void)setInter:(NSInteger)inter{
    _inter =inter;
    men.initer = inter;
}
@end
