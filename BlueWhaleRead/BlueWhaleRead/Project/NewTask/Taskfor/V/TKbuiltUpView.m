//
//  TKbuiltUpView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/12/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKbuiltUpView.h"
#import "TKChooseCollectionView.h"
#import "TAskForViewController.h"
@implementation TKbuiltUpView{
    TKChooseCollectionView *readbook;
    TKChooseCollectionView * week;
    UITextField * textField;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    UIView * backv = [UIView new];
    backv.userInteractionEnabled = YES;
    backv.backgroundColor =RGBA(0, 0, 0, 0.4);
    [self addSubview:backv];
    [backv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    UIView * v = [UIView new];
    v.backgroundColor = [UIColor whiteColor];
    v.layer.cornerRadius = LENGTH(10);
    v.layer.masksToBounds = YES;
    v.userInteractionEnabled = YES;
    [self addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(LENGTH(20));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(20));
    }];
    
    BaseLabel * taskname = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(12,21,21) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@"任务名称"];
    [v addSubview:taskname];
    [taskname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(v).with.offset(LENGTH(33));
        make.left.mas_equalTo(v).with.offset(LENGTH(28));
        
    }];
    
    UIView * taskviewname = [UIView new];
    v.userInteractionEnabled = YES;
    taskviewname.layer.masksToBounds = YES;
    taskviewname.layer.cornerRadius = LENGTH(5);
    taskviewname.layer.borderWidth = LENGTH(1);
    taskviewname.layer.borderColor = RGB(91,199,198).CGColor;
    [v addSubview:taskviewname];
    [taskviewname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(v).with.offset(LENGTH(28));
        make.right.mas_equalTo(v).with.offset(-LENGTH(28));
        make.top.mas_equalTo(taskname.mas_bottom).with.offset(LENGTH(15));
        make.height.mas_equalTo(LENGTH(32));
    }];
    
    textField = [UITextField new];
    textField.delegate = self;
    textField.font = TextFont(14);
    textField.textColor = RGB(49,87,86);
    textField.textAlignment = NSTextAlignmentCenter;
    textField.borderStyle = UITextBorderStyleNone;
    [taskviewname addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(taskviewname).with.insets(UIEdgeInsetsMake(LENGTH(2), LENGTH(2), LENGTH(2), LENGTH(2)));
    }];
    
    BaseLabel * weekread = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(12,21,21) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@"每周读书本数"];
    [v addSubview:weekread];
    [weekread mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(taskviewname.mas_bottom).with.offset(LENGTH(30));
        make.left.mas_equalTo(v).with.offset(LENGTH(28));
        make.right.mas_equalTo(v).with.offset(LENGTH(28));
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(LENGTH(68),LENGTH(32));
    //定义每个UICollectionView 横向的间距
    flowLayout.minimumLineSpacing = LENGTH(12);
    //定义每个UICollectionView 纵向的间距
    flowLayout.minimumInteritemSpacing = LENGTH(2);
    //定义每个UICollectionView 的边距距
    flowLayout.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(0), LENGTH(0), LENGTH(0));//上左下右
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    readbook = [[TKChooseCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
    readbook.decelerationRate = UIScrollViewDecelerationRateNormal;
    readbook.neirongcolor = RGB(91,199,198);
    [self addSubview:readbook];
    [readbook mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weekread.mas_bottom).with.offset(LENGTH(15));
        make.left.mas_equalTo(v).with.offset(LENGTH(28));
        make.right.mas_equalTo(v).with.offset(-LENGTH(28));
        make.height.mas_equalTo(LENGTH(32));
    }];
    NSMutableArray * itemarr = [NSMutableArray array];
    for (int i = 1; i < 5; i++) {
        TKbuiltModel * model = [TKbuiltModel new];
        model.name = [NSString stringWithFormat:@"%d本",i];
        if (i == 1) {
            model.style = @"1";
        }else{
            model.style = @"0";
        }
        [itemarr addObject:model];
    }
    readbook.itemArray = itemarr;
    
    
    BaseLabel * weeks = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(12,21,21) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@"持续读书周数"];
    [v addSubview:weeks];
    [weeks mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->readbook.mas_bottom).with.offset(LENGTH(32));
        make.left.mas_equalTo(v).with.offset(LENGTH(28));
        make.right.mas_equalTo(v).with.offset(LENGTH(28));
    }];
    
    UICollectionViewFlowLayout *flowLayous = [[UICollectionViewFlowLayout alloc] init];
    flowLayous.itemSize = CGSizeMake(LENGTH(50),LENGTH(32));
    //定义每个UICollectionView 横向的间距
    flowLayous.minimumLineSpacing = LENGTH(2);
    //定义每个UICollectionView 纵向的间距
    flowLayous.minimumInteritemSpacing = LENGTH(2);
    //定义每个UICollectionView 的边距距
    flowLayous.sectionInset = UIEdgeInsetsMake(LENGTH(0), LENGTH(0), LENGTH(0), LENGTH(0));//上左下右
    flowLayous.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    week = [[TKChooseCollectionView alloc] initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayous];
    week.decelerationRate = UIScrollViewDecelerationRateNormal;
    week.neirongcolor = RGB(91,199,198);
    [self addSubview:week];
    [week mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weeks.mas_bottom).with.offset(LENGTH(15));
        make.left.mas_equalTo(v).with.offset(LENGTH(28));
        make.right.mas_equalTo(v).with.offset(-LENGTH(28));
        make.height.mas_equalTo(LENGTH(32));
    }];

    NSMutableArray * weekarray = [NSMutableArray array];
    for (int i = 3; i <= 54; i++) {
        TKbuiltModel * model = [TKbuiltModel new];
        NSString * str = [NSString stringWithFormat:@"%d周",i];
        model.name =str;
        if (i == 3) {
            model.style = @"1";
        }else{
            model.style = @"0";
        }
        [weekarray addObject:model];
    }
    
    week.itemArray = weekarray;
    
    BaseLabel * qding = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"确定"];
    qding.backgroundColor = RGB(91,199,198);
    qding.layer.cornerRadius = LENGTH(5);
    qding.layer.masksToBounds = YES;
    [v addSubview:qding];
    [qding mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->week.mas_bottom).with.offset(LENGTH(25));
        make.centerX.mas_equalTo(v);
        make.width.mas_equalTo(LENGTH(130));
        make.height.mas_equalTo(LENGTH(32));
    }];
    
    BaseLabel * sutitlesss = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(129,129,129) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"自己建立的任务，要坚持完成哦"];
    [v addSubview:sutitlesss];
    [sutitlesss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(qding.mas_bottom).with.offset(LENGTH(24));
        make.left.mas_equalTo(v).mas_equalTo(LENGTH(30));
        make.bottom.mas_equalTo(v).with.offset(-LENGTH(20));
    }];
    
    backv.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remo)];
    //将手势添加到需要相应的view中去
    [backv addGestureRecognizer:tap];
    
    qding.userInteractionEnabled = YES;
    UITapGestureRecognizer * qdingtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(quding)];
    //将手势添加到需要相应的view中去
    [qding addGestureRecognizer:qdingtap];
    
    v.userInteractionEnabled = YES;
    UITapGestureRecognizer * hujptap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hujptap)];
    //将手势添加到需要相应的view中去
    [v addGestureRecognizer:hujptap];
//    taskviewname.userInteractionEnabled = YES;
//    UITapGestureRecognizer * taskviewnametap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textfile)];
//    //将手势添加到需要相应的view中去
//    [taskviewname addGestureRecognizer:taskviewnametap];
}
- (void)remo{
    [self removeFromSuperview];
}
- (void)hujptap{
    [textField resignFirstResponder];
}



- (void)quding{
    if ([textField.text isEqualToString:@""]) {
        [[MBProgressHUDYS SharedMBProgressHUDYS] addview:self];
        [[MBProgressHUDYS SharedMBProgressHUDYS] shoumessage:@"任务名称不能为空"];
        [[MBProgressHUDYS SharedMBProgressHUDYS] hideAnimated:YES afterDelay:1];
    }else{
        
    NSString * url = [NSString stringWithFormat:@"%@%@?studentid=%@",ZSFWQ,JK_AJTASK,Me.ssid];
    NSDictionary * dic = @{@"mission_name":textField.text,@"week_book_num":[NSString stringWithFormat:@"%ld",(long)readbook.booknum],@"mission_duration":[NSString stringWithFormat:@"%ld",readbook.booknum+2]};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:nil error:nil];
    request.timeoutInterval= 30;
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)data.length] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:data];
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                 @"text/html",
                                                 @"text/json",
                                                 @"text/javascript",
                                                 @"text/plain",
                                                 nil];
    manager.responseSerializer = responseSerializer;
    [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            NewHomeModel * model = [NewHomeModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self.nav popViewControllerAnimated:YES];
                [self removeFromSuperview];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        } else {
            
        }
    }] resume];
    }


}
- (void)textfile{
//    [textField setValue:[NSNumber numberWithInt:10] forKey:@"paddingLeft"];
//
//    [textField becomeFirstResponder];//默认编辑状态

}
@end
