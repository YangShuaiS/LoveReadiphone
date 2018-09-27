//
//  BookListViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/11.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookListViewController.h"
#import "BookListMenu.h"
#import "UnreadViewController.h"
#import "ReadBookListViewController.h"

#import "DTJieGuoViewController.h"
#import "ChaKanCuoTiViewController.h"
#import "DTALLiewController.h"

#import "SearchView.h"
@interface BookListViewController ()<NavDelegate>

@end

@implementation BookListViewController{
    UITextField * textField;
    BaseView * sousuo;
    UnreadViewController* hotview;
    ReadBookListViewController * Familiar;
    BookListMenu * homeMenu;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //确保书架前面控制器不会出现查看错题，答题结果,答题也
    NSMutableArray *marr = [[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
    //删除完再从新赋值，防止崩溃
    NSMutableArray * navarr = [NSMutableArray array];
    [navarr addObjectsFromArray:marr];
    for (UIViewController *vc in marr) {
        if ([vc isKindOfClass:[DTJieGuoViewController class]]) {
            [navarr removeObject:vc];
        }
        if ([vc isKindOfClass:[ChaKanCuoTiViewController class]]) {
            [navarr removeObject:vc];
        }
        if ([vc isKindOfClass:[DTALLiewController class]]) {
            [navarr removeObject:vc];
        }
    }
    self.navigationController.viewControllers = navarr;
    
    
    [self AddNavtion];
    [self AddMenu];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"icon_返回_粗" Title:@"请输入书籍名称" RightTitle:@"" NativeStyle:NacStyleLeftCenterSearch];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    
}
- (void)NavLeftClick{
        if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        }

    
    self.navigationController.tabBarController.selectedIndex = 0;
    [self.navigationController popToRootViewControllerAnimated:YES];
//    [self.navigationController popViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    //    SearchViewController * vc = [SearchViewController new];
    //    UINavigationController *navigationController =
    //    [[UINavigationController alloc] initWithRootViewController:vc];
    ////    [self.navigationController pushViewController:vc animated:NO];
    //    [self presentViewController:navigationController animated:YES completion:^{
    //
    //    }];
    
    
    sousuo = [BaseView new];
    sousuo.backgroundColor = MAINCOLOR;
    [self.view addSubview:sousuo];
    
    BaseView * text = [BaseView new];
    text.backgroundColor = RGB(255, 255, 255);
    text.alpha = 0.3;
    text.layer.masksToBounds = YES;
    text.layer.cornerRadius = LENGTH(17);
    [sousuo addSubview:text];
    
    textField = [UITextField new];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.backgroundColor = [UIColor clearColor];
    textField.placeholder = @"请输入书名";
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
    [sousuo addSubview:quxiao];
    
    WS(ws);
    [sousuo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.view);
        make.right.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.view);
        make.height.mas_equalTo(NavHeight);
    }];
    
    [text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->sousuo.mas_left).with.offset(LENGTH(56));
        make.right.mas_equalTo(self->sousuo.mas_right).with.offset(-LENGTH(108));
        make.bottom.mas_equalTo(self->sousuo.mas_bottom).with.offset(-LENGTH(6));
        make.height.mas_equalTo(33);
    }];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->sousuo.mas_left).with.offset(LENGTH(56));
        make.right.mas_equalTo(self->sousuo.mas_right).with.offset(-LENGTH(108));
        make.bottom.mas_equalTo(self->sousuo.mas_bottom).with.offset(-LENGTH(6));
        make.height.mas_equalTo(33);
    }];

    [quxiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->textField.mas_right).with.offset(LENGTH(20));
        make.centerY.mas_equalTo(self->textField.mas_centerY);
//        make.right.equalTo(self->sousuo.mas_right).with.offset(0);
        make.height.mas_equalTo(self->textField.mas_height);
    }];
    //监听当键盘将要出现时
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //监听当键将要退出时
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
//    }
    
    [sousuo removeFromSuperview];
    hotview.bookName = @"";
    Familiar.bookName = @"";

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

}

//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
//    }
//}


- (void)quxiao{
    [sousuo removeFromSuperview];
    hotview.bookName = @"";
    Familiar.bookName = @"";
}
- (void)phoneNum_tfChange:(UITextField *)textField
{
    NSString * str = textField.text;
    hotview.bookName = str;
    Familiar.bookName = str;
}
//当键盘出现
- (void)keyboardWillShow:(NSNotification *)notification
{
    //获取键盘的高度
    NSDictionary *userInfo = [notification userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [value CGRectValue];
    int height = keyboardRect.size.height;
    
    WS(ws);
    [homeMenu mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.view).with.offset(-height);
    }];
    
}

//当键退出
- (void)keyboardWillHide:(NSNotification *)notification
{
    //获取键盘的高度
    NSDictionary *userInfo = [notification userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [value CGRectValue];
    int height = keyboardRect.size.height;
    WS(ws);
    [homeMenu mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
}

- (void)NavRightClick {
    
}


#pragma mark --------------------  Menu
- (void)AddMenu{
    WS(ws);
    homeMenu = [BookListMenu new];
    homeMenu.titarray = @[@"未读书籍",@"已读书籍"];
    [self.view addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    NSMutableArray *childVC = [[NSMutableArray alloc] init];
    hotview = [[UnreadViewController alloc] init];
//    hotview.bookCase = BookCaseStyleSJWD;
    [self addChildViewController:hotview];
    [childVC addObject:hotview];
    
    Familiar = [[ReadBookListViewController alloc] init];
//    Familiar.bookCase = BookCaseStyleYD;
    [self addChildViewController:Familiar];
    [childVC addObject:Familiar];
    //
    homeMenu.controllerArray = childVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
