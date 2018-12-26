//
//  UserLoginTextFileView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/19.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "UserLoginTextFileView.h"
#import "UserLoginUJMMViewController.h"
@implementation UserLoginTextFileView{
    BaseView * backview;
    BaseLabel * yzm;//验证码
    UserLoginTextFile _style;
    UIImageView * yanjing;
}
- (instancetype)initWithStyle:(UserLoginTextFile)style{
    self = [super init];
    if (self) {
        [self addview:style];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    backview.layer.cornerRadius = self.frame.size.height/2;
}
- (void)addview:(UserLoginTextFile)style{
    WS(ws);
    backview = [BaseView new];
    backview.backgroundColor = RGB(248,248,248);
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    _style = style;
    switch (style) {
        case UserLoginTextFilePhone:
            [self addUserLoginTextFilePhone];
            break;

        case UserLoginTextFilePhoneAndYZM:
            [self addUserLoginTextFilePhoneAndYZM];
            break;
        case UserLoginTextFileYZM:
            [self addUserLoginTextFileYZM];
            break;
        case UserLoginTextFileMM:
            [self addUserLoginTextFileMM];
            break;
        case UserLoginTextFileYHM:
            [self addUserLoginTextFileYHM];
            break;
        case UserLoginTextFileClick:
            [self addUserLoginTextFileClick];
            break;
        case UserLoginTextFileWjMM:
            [self addUserLoginTextFileWjMM];
            break;
        case UserLoginTextFileClickDQ:
            [self addUserLoginTextFileClickDQ];
            break;
        case UserLoginTextFileNR:
            [self addUserLoginTextFileNR];
            break;
        default:
            break;
    }
    
}
- (void)addTextField{
    self.textField = [UITextField new];
    _textField.delegate = self;
    _textField.borderStyle = UITextBorderStyleNone;
    [backview addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(16));
        make.top.and.bottom.and.right.mas_equalTo(self->backview);
    }];
}
- (void)addClickLabel{
    _djshj = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(155,177,176) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentLeft Text:@""];
    [backview addSubview:_djshj];
    [_djshj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->backview).with.offset(LENGTH(16));
        make.top.and.bottom.and.right.mas_equalTo(self->backview);
    }];
}
//验证码
- (void)addYzm{
    WS(ws);
    yzm = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(155,177,176) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"发送验证码"];
    [backview addSubview:yzm];
    yzm.backgroundColor = [UIColor whiteColor];
    yzm.layer.masksToBounds = YES;
    yzm.layer.cornerRadius = LENGTH(15);
    
    yzm.layer.shadowColor = RGB(0, 0, 0).CGColor;
    yzm.layer.shadowOffset = CGSizeMake(0,0.5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    yzm.layer.shadowRadius = LENGTH(3);
    yzm.layer.shadowOpacity = 0.06;
    [yzm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.right.mas_equalTo(-LENGTH(22));
        make.width.mas_equalTo(LENGTH(90));
        make.height.mas_equalTo(LENGTH(30));
    }];
    yzm.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickYZM)];
    //将手势添加到需要相应的view中去
    [yzm addGestureRecognizer:tapGesture1];
    
    [_textField addTarget:self action:@selector(phoneNum_tfChange:) forControlEvents:UIControlEventEditingChanged];

}
//忘记密码
- (void)addwjmm{
    WS(ws);
    
    yanjing = [UIImageView new];
    yanjing.image = UIIMAGE(@"组 339");
    yanjing.contentMode = UIViewContentModeScaleAspectFit;
    [backview addSubview:yanjing];
    [yanjing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.right.mas_equalTo(-LENGTH(32));
        make.width.mas_equalTo(LENGTH(20));
        make.height.mas_equalTo(LENGTH(13));

    }];
        yanjing.userInteractionEnabled = YES;
        //添加手势
        UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestures)];
        //将手势添加到需要相应的view中去
        [yanjing addGestureRecognizer:tapGesture1];
    _textField.secureTextEntry = YES;
//    yzm = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(51,75,74) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"忘记密码？"];
//    [backview addSubview:yzm];
//    [yzm mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(ws);
//        make.right.mas_equalTo(-LENGTH(22));
//        make.width.mas_equalTo(LENGTH(90));
//        make.height.mas_equalTo(LENGTH(30));
//    }];
//    yzm.userInteractionEnabled = YES;
//    //添加手势
//    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestures)];
//    //将手势添加到需要相应的view中去
//    [yzm addGestureRecognizer:tapGesture1];
}
- (void)UpData{
    __block NSInteger time = 59; //倒计时时间
    yzm.textColor = RGB(82,199,198);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮的样式
                self->yzm.textColor = RGB(155,177,176);
                self->yzm.text = @"重新获取";
                self->yzm.userInteractionEnabled = YES;
            });
        }else{
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮的样式
                self->yzm.text = [NSString stringWithFormat:@"%.2ds", seconds];
                self->yzm.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}
- (void)ClickYZM{
    if (_style == UserLoginTextFilePhoneAndYZM) {
        BOOL phone = [BaseObject valiMobile:_textField.text];
        if (phone == YES) {
            yzm.userInteractionEnabled = YES;
            WS(ws);
            MBProgressHUD * mb = [MBProgressHUD new];
            mb.mode = MBProgressHUDModeIndeterminate;
            mb.label.text = @"正在发送验证码...";
            [mb showAnimated:YES];
            mb.removeFromSuperViewOnHide = YES;
            [self.vc.view.window addSubview:mb];
            [mb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(ws.vc.view.window);
            }];
            
            NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FASONGYANZHENGMA];
            NSDictionary * dic = @{@"phone":_textField.text};
            [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
                if (responseObject) {
                    MyDeModel * model = [MyDeModel mj_objectWithKeyValues:responseObject];
                    if ([model.code isEqual:@200]) {
                        [self UpData];
                    }else if ([model.code isEqual:@Notloggedin]){
                        [self UpDengLu];
                    }
                    mb.label.text = model.message;
                    [mb hideAnimated:NO afterDelay:1];
                }else{
                    mb.label.text = @"发送失败";
                    [mb hideAnimated:NO afterDelay:1];
                }
            }];
        }else{
            yzm.userInteractionEnabled = NO;
        }
    }
}
- (void)phone:(NSString *)str{
    BOOL phone = [BaseObject valiMobile:str];
    if (phone == YES) {
        yzm.userInteractionEnabled = YES;
    }else{
        yzm.userInteractionEnabled = NO;
    }
}
- (void)setTitles:(NSString *)titles{
    _titles = titles;
    if (_textField) {
        UIColor * color = RGB(155,177,176);
        _textField.textColor = RGB(43,67,66);
        _textField.font = TextFont(16);
        _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:_titles attributes:@{NSForegroundColorAttributeName: color,NSFontAttributeName:TextFont(16)}];
    }

    if (_djshj) {
        _djshj.text = titles;
    }
}
- (void)addUserLoginTextFilePhoneAndYZM{
    [self addTextField];
    _textField.keyboardType = UIKeyboardTypeNumberPad;
    [self addYzm];
}
- (void)addUserLoginTextFilePhone{
    [self addTextField];
    _textField.keyboardType = UIKeyboardTypeAlphabet;
}
//验证马
- (void)addUserLoginTextFileYZM{
    [self addTextField];
    _textField.keyboardType = UIKeyboardTypeNumberPad;
}
//密码
- (void)addUserLoginTextFileMM{
    [self addTextField];
    _textField.keyboardType = UIKeyboardTypeAlphabet;
    _textField.secureTextEntry = YES;
}
//
- (void)addUserLoginTextFileYHM{
    [self addTextField];
    _textField.keyboardType = UIKeyboardTypeDefault;
    [_textField addTarget:self action:@selector(phoneNum_tfChange:) forControlEvents:UIControlEventEditingChanged];

}

- (void)addUserLoginTextFileNR{
    [self addTextField];
    _textField.keyboardType = UIKeyboardTypeDefault;
}
//点击事件
- (void)addUserLoginTextFileClick{
    [self addClickLabel];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [self addGestureRecognizer:tapGesture2];
}

- (void)addUserLoginTextFileClickDQ{
    [self addClickLabel];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(diqu)];
    //将手势添加到需要相应的view中去
    [self addGestureRecognizer:tapGesture2];
}

- (void)diqu{
    self.pickerView = [[GFAddressPicker alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    //    [self.pickerView updateAddressAtProvince:@"河南省" city:@"郑州市" town:@"金水区"];
    self.pickerView.delegate = self;
    self.pickerView.font = [UIFont boldSystemFontOfSize:18];
    [_vc.view addSubview:self.pickerView];
    
}

- (void)GFAddressPickerCancleAction
{
    [self.pickerView removeFromSuperview];
}
- (void)GFAddressPickerWithProvince:(UserCitySmolModel *)province city:(UserCitySmolModel *)city area:(UserCitySmolModel *)area{
    _djshj.text = [NSString stringWithFormat:@"%@%@%@",province.name,city.name,area.name];
    _dqid = [NSString stringWithFormat:@"%@,%@,%@",province.ssid,city.ssid,area.ssid];
    _djshj.textColor = RGB(43,67,66);
    [self.pickerView removeFromSuperview];
    //    NSLog(@"%@  %@  %@",province,city,area);

}

- (void)addUserLoginTextFileWjMM{
    [self addTextField];
    _textField.keyboardType = UIKeyboardTypeAlphabet;
    [self addwjmm];

}
//-(void)tapGesture2{
//    self.block();
//}

- (void)tapGesture2{
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.datePickerMode = PGDatePickerModeDate;
    datePicker.delegate = self;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:_djshj.text];//上次设置的日期
    if (!_djshj.text) {
        date = [NSDate date];
    }
    [datePicker setDate:date];

    [_vc presentViewController:datePickManager animated:false completion:nil];
    
    datePickManager.titleLabel.text = @"选择生日";
    //设置半透明的背景颜色
    datePickManager.isShadeBackgroud = true;
//    //设置头部的背景颜色
//    datePickManager.headerViewBackgroundColor = [UIColor blueColor];
//    //设置线条的颜色
//    datePicker.lineBackgroundColor = [UIColor cyanColor];
//    //设置选中行的字体颜色
//    datePicker.textColorOfSelectedRow = [UIColor redColor];
//    //设置未选中行的字体颜色
//    datePicker.textColorOfOtherRow = [UIColor blackColor];
    //设置取消按钮的字体颜色
//    datePickManager.cancelButtonTextColor = [UIColor blackColor];
    //设置取消按钮的字
    datePickManager.cancelButtonText = @"取消";
    //设置取消按钮的字体大小
    datePickManager.cancelButtonFont = [UIFont boldSystemFontOfSize:17];
    
    //设置确定按钮的字体颜色
//    datePickManager.confirmButtonTextColor = [UIColor redColor];
    //设置确定按钮的字
    datePickManager.confirmButtonText = @"确定";
    //设置确定按钮的字体大小
    datePickManager.confirmButtonFont = [UIFont boldSystemFontOfSize:17];
}
- (void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents {
    NSLog(@"dateComponents = %@", dateComponents);
    NSString * day = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)dateComponents.year,(long)dateComponents.month,(long)dateComponents.day];
    _djshj.text = day;
    _djshj.textColor = RGB(43,67,66);
    
}


- (void)tapGestures{
//    UserLoginUJMMViewController * vc = [UserLoginUJMMViewController new];
//    [self.nav pushViewController:vc animated:YES];
    if (_textField.secureTextEntry == NO) {
        _textField.secureTextEntry = YES;
        yanjing.image = UIIMAGE(@"组 339");
    }else{
        _textField.secureTextEntry = NO;
        yanjing.image = UIIMAGE(@"组 335");
    }
}
- (void)returnKeyboard{
    [_textField resignFirstResponder];
}

- (void)phoneNum_tfChange:(UITextField *)textField
{
    if (_style == UserLoginTextFilePhoneAndYZM) {
        BOOL phone = [BaseObject valiMobile:textField.text];
        if (phone == YES) {
            yzm.userInteractionEnabled = YES;
        }else{
            yzm.userInteractionEnabled = NO;
        }
    }else if (_style == UserLoginTextFileYHM){
        // 判断是否存在高亮字符，如果有，则不进行字数统计和字符串截断
        UITextRange *selectedRange = textField.markedTextRange;
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        if (position) {
            return;
        }
        
        // 判断是否超过最大字数限制，如果超过就截断
        if (textField.text.length > 20) {
            textField.text = [textField.text substringToIndex:20];
        }
        // 剩余字数显示 UI 更新
//        if (textField.text.length >=10) {
//            [self returnKeyboard];
//        }
    }
}
@end
