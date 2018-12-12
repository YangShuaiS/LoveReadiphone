//
//  TKAwardVIew.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/11/29.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TKAwardVIew.h"

#import "TKATextFileVIew.h"
#import "TKATextFileModel.h"
#import "MBProgressHUD+YS.h"
@implementation TKAwardVIew{
    UIImageView * imageView;
    
    FLAnimatedImageView * jpimageview;
    BaseLabel * renwu;
    BaseLabel * jpxinxi;
    
    TKATextFileVIew * name;
    TKATextFileVIew * address;
    TKATextFileVIew * phone;
    
    BaseLabel * shuoming;
    
    TKATextFileModel * textmodel;

//    BaseLabel * name;

}
- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_RWLJ];
//    NSDictionary * dic = @{@"studentid":Me.ssid};
    NSDictionary * dic = @{@"studentid":@"12"};

    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            TKATextFileModel * model = [TKATextFileModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }
        }else{
        }
    }];
}
- (void)UpData:(TKATextFileModel *)model{
    textmodel = model;
    [jpimageview sd_setImageWithURL:URLIMAGE(model.prize.prize_img)];
    renwu.text = [NSString stringWithFormat:@"第%@期新手任务",model.periods_num];
    jpxinxi.text = [NSString stringWithFormat:@"恭喜你获得%@等奖  %@ 一辆！",model.prize_level,model.prize.prize_name];
    
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = jpxinxi.text;
    model1.bianString = model.prize.prize_name;
    model1.fount = 19;
    NSArray * modelarray = @[model1];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    jpxinxi.attributedText = AttributedStr;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
        [self LoadData];
    }
    return self;
}
- (void)addview{
    WS(ws);
    imageView = [UIImageView new];
    imageView.userInteractionEnabled = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = UIIMAGE(@"领奖信息背景");
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    UIImageView * caidai = [UIImageView new];
    caidai.contentMode = UIViewContentModeScaleAspectFit;
    caidai.image = UIIMAGE(@"领奖信息-彩带");
    [imageView addSubview:caidai];
    [caidai mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView).with.offset(LENGTH(28));
        make.centerX.mas_equalTo(self->imageView);
    }];
    
    jpimageview = [FLAnimatedImageView new];
//    jpimageview.backgroundColor = RANDOMCOLOR;
    [self addSubview:jpimageview];
    [jpimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->imageView).with.offset(LENGTH(28));
        make.centerX.mas_equalTo(self->imageView);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(100);
    }];
    
    renwu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFontCu(16) TextAlignment:NSTextAlignmentCenter Text:@"第16期新手任务"];
    [jpimageview addSubview:renwu];
    [renwu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->jpimageview.mas_bottom).with.offset(LENGTH(13));
        make.centerX.mas_equalTo(self->imageView);
    }];
    
    jpxinxi = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"恭喜你获得一等奖  小米平衡车 一辆！"];
    [jpimageview addSubview:jpxinxi];
    [jpxinxi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->renwu.mas_bottom).with.offset(LENGTH(15));
        make.centerX.mas_equalTo(self->imageView);
    }];
    
    AttributedStringModel * model1 = [AttributedStringModel new];
    model1.textString = jpxinxi.text;
    model1.bianString = @"小米平衡车";
    model1.fount = 19;
    NSArray * modelarray = @[model1];
    NSMutableAttributedString *AttributedStr = [BaseObject Attributed:modelarray];
    jpxinxi.attributedText = AttributedStr;
    
    BaseLabel * lqjp = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(16) TextAlignment:NSTextAlignmentCenter Text:@"快填写下面的领奖信息领取你的奖品吧！"];
    [imageView addSubview:lqjp];
    [lqjp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->jpxinxi.mas_bottom).with.offset(LENGTH(12));
        make.centerX.mas_equalTo(self->imageView);
    }];
    
    
    name = [TKATextFileVIew new];
    name.userInteractionEnabled = YES;
    name.titlabel.text = @"姓名:";
    name.textField.textColor = RGB(241,150,52);
    name.textField.font = TextFont(15);
    name.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入你的姓名" attributes:@{NSForegroundColorAttributeName: RGB(241,150,52),NSFontAttributeName:TextFont(15)}];
    [imageView addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lqjp.mas_bottom).with.offset(LENGTH(60));
        make.left.mas_equalTo(self->imageView).with.offset(LENGTH(33));
        make.right.mas_equalTo(self->imageView).with.offset(-LENGTH(33));
    }];
    
    address = [TKATextFileVIew new];
    address.userInteractionEnabled = YES;
    address.titlabel.text = @"地址:";
    address.textField.textColor = RGB(241,150,52);
    address.textField.font = TextFont(15);
    address.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入奖品的收货地址" attributes:@{NSForegroundColorAttributeName: RGB(241,150,52),NSFontAttributeName:TextFont(15)}];
    [imageView addSubview:address];
    [address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->name.mas_bottom).with.offset(LENGTH(8));
        make.left.mas_equalTo(self->imageView).with.offset(LENGTH(33));
        make.right.mas_equalTo(self->imageView).with.offset(-LENGTH(33));
    }];
    
    phone = [TKATextFileVIew new];
    phone.userInteractionEnabled = YES;
    phone.titlabel.text = @"电话:";
    phone.textField.textColor = RGB(241,150,52);
    phone.textField.font = TextFont(15);
    phone.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入你的联系电话" attributes:@{NSForegroundColorAttributeName: RGB(241,150,52),NSFontAttributeName:TextFont(15)}];
    [imageView addSubview:phone];
    [phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->address.mas_bottom).with.offset(LENGTH(8));
        make.left.mas_equalTo(self->imageView).with.offset(LENGTH(33));
        make.right.mas_equalTo(self->imageView).with.offset(-LENGTH(33));
    }];
    
    shuoming = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(241,150,52) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"《使用说明》和《安全规则》请在奖品包裹内查找"];
    [imageView addSubview:shuoming];
    [shuoming mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->phone.mas_bottom).with.offset(LENGTH(14));
        make.centerX.mas_equalTo(self->imageView);
    }];
    
    BaseLabel * qdLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:RGB(255,255,255) LabelFont:TextFont(14) TextAlignment:NSTextAlignmentCenter Text:@"确认"];
    qdLabel.backgroundColor = RGB(255,91,40);
    qdLabel.layer.cornerRadius = LENGTH(21);
    qdLabel.layer.masksToBounds = YES;
    [imageView addSubview:qdLabel];
    [qdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->shuoming.mas_bottom).with.offset(LENGTH(16));
        make.centerX.mas_equalTo(self->imageView);
        make.width.mas_equalTo(LENGTH(132));
        make.height.mas_equalTo(LENGTH(42));
        make.bottom.mas_equalTo(self->imageView.mas_bottom).with.offset(-LENGTH(33));
    }];
    
    qdLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(queren)];
    //将手势添加到需要相应的view中去
    [qdLabel addGestureRecognizer:tap];
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [self addGestureRecognizer:tapGesture2];
}
- (void)tapGesture2{
    [name.textField resignFirstResponder];
    [address.textField resignFirstResponder];
    [phone.textField resignFirstResponder];
}

- (void)queren{
    [[MBProgressHUD showMessage:@"正在加载数据中....."] hideAnimated:YES afterDelay:1];
    if (![name.textField.text isEqualToString:@""]&&![address.textField.text isEqualToString:@""]&&![phone.textField.text isEqualToString:@""]&&[BaseObject valiMobile:phone.textField.text]==YES) {
        
        NSString * url = [NSString stringWithFormat:@"%@%@?studentid=%@&lotteryid=%@",ZSFWQ,JK_LJTJ,Me.ssid,textmodel.lottert_id];
        NSDictionary * dic = @{@"name":name.textField.text,@"phone":phone.textField.text,@"address":address.textField.text};
        //    NSString *jsonString = [self dictionaryToJson:dic];
        NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
        //    NSData *data =[jsonString dataUsingEncoding:NSUTF8StringEncoding];
        
        
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
                    [[self viewController].navigationController popViewControllerAnimated:YES];
                }
                [[MBProgressHUD showMessage:model.message] hideAnimated:YES afterDelay:1];
            } else {
                [[MBProgressHUD showMessage:@"失败"] hideAnimated:YES afterDelay:1];
            }
        }] resume];
    }else{
        [[MBProgressHUD showMessage:@"请填写正确信息"] hideAnimated:YES afterDelay:1];
    }
    
    
}


@end
