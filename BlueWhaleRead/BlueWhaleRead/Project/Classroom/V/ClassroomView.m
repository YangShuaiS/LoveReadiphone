//
//  ClassroomView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/8.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "ClassroomView.h"
#import "ClassroomTextFileView.h"
#import "ClassroomWJMMView.h"
#import "ClassRoomCWMessageView.h"
@implementation ClassroomView{
    UIScrollView * scrollView;
    ClassroomTextFileView * one;
    ClassroomTextFileView * two;
    ClassroomTextFileView * three;
    
    BaseLabel * wjmm;

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
    self.backgroundColor = [UIColor whiteColor];
    scrollView = [UIScrollView new];
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    UIImageView * logo = [UIImageView new];
    logo.contentMode = UIViewContentModeScaleAspectFit;
    logo.image = UIIMAGE(@"天天爱读");
    logo.layer.shadowColor = RGB(0, 0, 0).CGColor;
    logo.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    logo.layer.shadowRadius = LENGTH(10);
    logo.layer.shadowOpacity = 0.1;
    [scrollView addSubview:logo];
    [logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(LENGTH(105), LENGTH(105)));
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(self->scrollView).with.offset(StatusBar+LENGTH(50));
    }];
    
    one = [[ClassroomTextFileView alloc] initWithTitle:@"学校" Subtitle:@"请选择合作的学校" RightImage:UIIMAGE(@"三角形-展开") ClassStyle:ClassroomTextFileViewClick];
    [scrollView addSubview:one];
    [one mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(logo.mas_bottom).with.offset(LENGTH(46));
        make.left.mas_equalTo(ws).with.offset(36);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(36));
    }];
    
    two = [[ClassroomTextFileView alloc] initWithTitle:@"学号" Subtitle:@"请输入学号" RightImage:UIIMAGE(@"") ClassStyle:ClassroomTextFileViewClickGeneral];
    [scrollView addSubview:two];
    [two mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->one.mas_bottom).with.offset(LENGTH(30));
        make.left.mas_equalTo(ws).with.offset(36);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(36));
    }];
    [one setBlocks:^{
        [ws huishou];
    }];
    
    three = [[ClassroomTextFileView alloc] initWithTitle:@"密码" Subtitle:@"请输入密码" RightImage:UIIMAGE(@"眼睛-关闭") ClassStyle:ClassroomTextFileViewPassWord];
    [scrollView addSubview:three];
    [three mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->two.mas_bottom).with.offset(LENGTH(30));
        make.left.mas_equalTo(ws).with.offset(36);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(36));
    }];
    
    wjmm = [[BaseLabel alloc] initWithTxteColor:RGB(91,199,198) LabelFont:TextFont(12) TextAlignment:NSTextAlignmentRight Text:@"忘记密码"];
    [scrollView addSubview:wjmm];
    [wjmm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->three.mas_bottom).with.offset(LENGTH(14));
        make.right.mas_equalTo(ws).with.offset(-LENGTH(36));
        make.height.mas_equalTo(LENGTH(22));
    }];
    
    BaseLabel * jrkt = [[BaseLabel alloc] initWithTxteColor:RGB(255, 255, 255) LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:@"进入课堂"];
    jrkt.backgroundColor = RGB(82,199,198);
    jrkt.layer.masksToBounds = YES;
    jrkt.layer.cornerRadius = LENGTH(20);
    [scrollView addSubview:jrkt];
    [jrkt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->wjmm.mas_bottom).with.offset(LENGTH(30));
        make.left.mas_equalTo(ws).with.offset(36);
        make.right.mas_equalTo(ws).with.offset(-LENGTH(36));
        make.bottom.mas_equalTo(self->scrollView);
        make.height.mas_equalTo(LENGTH(40));
    }];
    
    wjmm.userInteractionEnabled = YES;
    UITapGestureRecognizer *wjmmtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wjmm)];
    //将手势添加到需要相应的view中去
    [wjmm addGestureRecognizer:wjmmtap];
    
    jrkt.userInteractionEnabled = YES;
    UITapGestureRecognizer *backtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remoview)];
    //将手势添加到需要相应的view中去
    [jrkt addGestureRecognizer:backtap];
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *huishoutap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(huishou)];
    //将手势添加到需要相应的view中去
    [self addGestureRecognizer:huishoutap];

}
- (void)huishou{
    [one.textField resignFirstResponder];
    [two.textField resignFirstResponder];
    [three.textField resignFirstResponder];

}
- (void)remoview{
    WS(ws);
    if (![one.textField.text isEqualToString:@"15718862830"]&&![three.textField.text isEqualToString:@"159963"]) {
        ClassRoomCWMessageView * view = [ClassRoomCWMessageView new];
        [self.window addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.window);
        }];
    }else{
        [UIView animateWithDuration:1 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }

}

- (void)wjmm{
    WS(ws);
    ClassroomWJMMView * view = [ClassroomWJMMView new];
    [self.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.window);
    }];
}
@end
