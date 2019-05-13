//
//  BuyPaymentButtonView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/25.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyPaymentButtonView.h"
#import "BaseNavigationViewController.h"
#import "UserLoginViewController.h"
#import "BuyXieYiView.h"
@implementation BuyPaymentButtonView{
    UIView * style;
    CAGradientLayer *gradientLayer0;
    BaseLabel * label;
    NSString * dingdan;
    MBProgressHUD * mb;
    BaseLabel * clickLabel;
    BuyXieYiView * xy;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
- (void)addView{
    WS(ws);
    self.backgroundColor = [UIColor whiteColor];
    
    xy = [BuyXieYiView new];
    [self addSubview:xy];
    [xy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws);
    }];
    
    style = [UIView new];
    style.layer.borderColor = [[UIColor colorWithRed:201.0f/255.0f green:170.0f/255.0f blue:113.0f/255.0f alpha:1.0f] CGColor];
    style.layer.borderWidth = 1;
    style.layer.backgroundColor = [[UIColor colorWithRed:225.0f/255.0f green:159.0f/255.0f blue:159.0f/255.0f alpha:1.0f] CGColor];
    style.alpha = 1;
    [self addSubview:style];
    [style mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->xy.mas_bottom);
        make.bottom.mas_equalTo(ws);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(TabBarHeight));
    }];
    
    //Gradient 0 fill for 圆角矩形 3
    gradientLayer0 = [[CAGradientLayer alloc] init];
    gradientLayer0.colors = @[
                              (id)[UIColor colorWithRed:201.0f/255.0f green:169.0f/255.0f blue:114.0f/255.0f alpha:1.0f].CGColor,
                              (id)[UIColor colorWithRed:226.0f/255.0f green:207.0f/255.0f blue:165.0f/255.0f alpha:1.0f].CGColor];
    gradientLayer0.locations = @[@0, @1];
    [gradientLayer0 setStartPoint:CGPointMake(1, 1)];
    [gradientLayer0 setEndPoint:CGPointMake(1, 0)];
    
    UIView * v = [UIView new];
    v.userInteractionEnabled = NO;
    [self addSubview:v];
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->xy.mas_bottom);
        make.centerX.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(48));
    }];
    
    clickLabel = [[BaseLabel alloc] initWithTxteColor:RGB(132,106,62) LabelFont:TextFontCu(20) TextAlignment:NSTextAlignmentCenter Text:@"立即支付"];
    [v addSubview:clickLabel];
    [clickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.bottom.mas_equalTo(v);
    }];
    
    label = [[BaseLabel alloc] initWithTxteColor:RGB(132,106,62) LabelFont:TextFontCu(12) TextAlignment:NSTextAlignmentCenter Text:@""];
    [v addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->clickLabel.mas_right);
        make.centerY.mas_equalTo(v);
        make.right.mas_equalTo(v);
    }];
    
    style.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [style addGestureRecognizer:tap];
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    
    mb = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
    mb.bezelView.color = [UIColor blackColor];
    mb.contentColor = [UIColor whiteColor];
    mb.removeFromSuperViewOnHide = NO;
    [mb hideAnimated:YES];
    // Set the label text.
    // You can also adjust other label properties if needed.
    // hud.label.font = [UIFont italicSystemFontOfSize:16.f];


}

- (void)layoutSubviews{
    [super layoutSubviews];
    gradientLayer0.frame = style.bounds;
    [style.layer addSublayer:gradientLayer0];
    
}
- (void)xiadan:(NSString *)is_renew{
    WS(ws);
    NSString * url = [NSString stringWithFormat:@"%@%@?pay_from=3",ZSFWQ,JK_BUYXIADAN];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"pay_type":@"1",@"is_renew":is_renew,@"discount_id":_model.ssid};
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
//            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

            NewHomeModel * model = [NewHomeModel mj_objectWithKeyValues:responseObject];
//            self->dingdan = model.order_no;
            
//            [self payWithAppleProductID:@"com.BoWanJuan.CS"];

//            [self payWithAppleProductID:ws.model.apple_id];
            if ([model.code isEqual:@200]) {
                self->dingdan = model.order_no;
                if (ws.model.discount ==0 && ws.model.is_renew == 2) {
                    self->mb.label.text = @"正在购买";
                    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self->mb showAnimated:YES];
                            [self UpMeDaty];
                        });
                    });
                }else{
                    [self payWithAppleProductID:ws.model.apple_id];
                }
//                        [self payWithAppleProductID:@"com.BoWanJuan.Nonautomaticrenewal30"];
//];
//
            }else if ([model.code isEqual:@Notloggedin]){
//                [self UpDengLu];
            }
        } else {
            
        }
    }] resume];

}
- (void)qingqiuxiadan{
    mb.label.text = @"正在连接苹果服务器";
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->mb showAnimated:YES];
        });
    });
    if (_model.sfzdxf == 1) {
        [self xiadan:@"1"];
    }else{
        [self xiadan:@"2"];
    }
}
- (void)click{
    if (_model != nil) {
        if ([Me.is_rebot isEqualToString:@"2"]) {
            [self qingqiuxiadan];
        }else{
            //显示弹出框列表选择
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"开通vip"
                                                                           message:@"登录博万卷购买，可跨平台享受会员权益，直接购买，会为当前设备开通会员"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"登录账号购买（推荐）" style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * action) {
                                                                   BaseNavigationViewController * homenav = [[BaseNavigationViewController alloc] initWithRootViewController:[UserLoginViewController new]];
                                                                   [[self viewController] presentViewController:homenav animated:YES completion:^{
                                                                       
                                                                   }];                                                               }];
            UIAlertAction* saveAction1 = [UIAlertAction actionWithTitle:@"游客身份购买" style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * action) {
                                                                   //响应事件
                                                                   [self qingqiuxiadan];
                                                               }];
            UIAlertAction* saveAction2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * action) {
                    
                                                               }];
            [alert addAction:saveAction];
            [alert addAction:saveAction1];
            [alert addAction:saveAction2];
            [[self viewController] presentViewController:alert animated:YES completion:nil];

        }
    }
}

- (void)setModel:(BuyPackage *)model{
    _model = model;
    NSString * str = @"";
    if (model.yj == model.discount_price || model.discount_price == 0) {
        str = @"";
    }else{
        str  = [NSString stringWithFormat:@"（已节省%ld元）",model.yj-model.discount_price];
    }
    label.text = str;
    if (model.discount_price == 0) {
        clickLabel.text = @"免费领取";
    }else{
        clickLabel.text = @"立即支付";

    }

}


- (void)payWithAppleProductID:(NSString *)productId {
    
    if ([SKPaymentQueue canMakePayments]) {
        // 如果允许应用内付费购买
        // 把商品ID信息放入一个集合中
        NSArray *productIdentifiers = [[NSArray alloc] initWithObjects: productId, nil];
        NSSet * set = [NSSet setWithArray:productIdentifiers];
        // 请求内购商品信息，只返回你请求的产品（主要用于验证商品的有效性）
        SKProductsRequest * request = [[SKProductsRequest alloc] initWithProductIdentifiers:set];
        request.delegate = self;
        [request start];
        
    } else {
        // 如果用户手机禁止应用内付费购买.
        // 则弹出开启购买权限开关的提示等...
    }
}
#pragma mark - SKProductRequestDelegate
/**
 收到产品返回信息
 SKProductsRequest是苹果封装好的一个对象，该对象有两个属性。
 products是一个数组，代表的是你获取到的所有商品信息，每个商品  都是一个数组元素。
 invalidProductIdentifiers是无效的商品id的数组，此id对应的是你在苹果后台构建的商品id。
 */
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    
    NSLog(@"--------------收到产品反馈消息---------------------");
    NSArray *product = response.products;
    if([product count] == 0){
        //        [SVProgressHUD dismiss];
        NSLog(@"--------------没有商品------------------");
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->mb hideAnimated:YES];
            });
        });
        return;
    }
    
    NSLog(@"productID:%@", response.invalidProductIdentifiers);
    NSLog(@"产品付费数量:%lu",(unsigned long)[product count]);
    
    SKProduct *requestProduct = nil;
    for (SKProduct *pro in product) {
        NSLog(@"%@", [pro description]);
        NSLog(@"%@", [pro localizedTitle]);
        NSLog(@"%@", [pro localizedDescription]);
        NSLog(@"%@", [pro price]);
        NSLog(@"%@", [pro productIdentifier]);
        // 如果后台消费条目的ID与我这里需要请求的一样（用于确保订单的正确性）
        //        if([pro.productIdentifier isEqualToString:_currentProId]){
        requestProduct = pro;
        //        }
    }
    // 发送购买请求
    //SKPayment *payment = [SKPayment paymentWithProduct:requestProduct];// 不可变的
    SKMutablePayment *payment = [SKMutablePayment paymentWithProduct:requestProduct];// 可变的
    payment.applicationUsername = Me.ssid;// 发起支付时候指定用户的userId
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}
// 请求失败
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error{
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->mb hideAnimated:YES];
        });
    });
    NSLog(@"------------------错误-----------------:%@", error);
}

- (void)requestDidFinish:(SKRequest *)request{

    NSLog(@"------------反馈信息结束-----------------");
}
// 13.监听购买结果
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transaction {
    
    for (SKPaymentTransaction *tran in transaction){
        
        switch (tran.transactionState) {
            case SKPaymentTransactionStatePurchased:{
                NSLog(@"交易完成");
                // 订阅特殊处理
                if (tran.originalTransaction) {
                    // 如果是自动续费的订单,originalTransaction会有内容
                    NSString *orderUserId = [[tran payment] applicationUsername];// 得到该订单的用户Id
                    //                    if ((orderUserId && orderUserId.length > 0 && [[Global sharedGlobal].loginInfo.userId isEqualToString:orderUserId]) || (nil == orderUserId || orderUserId.length == 0)) {
                    // 当订单的userId和当前userId一致 或者 订单userId为空时才处理票据、执行finish操作
//                    [self completeTransaction:tran];
                    NSLog(@"自动续费的订单,originalTransaction = %@",tran.originalTransaction);
                    [self completeTransaction:tran];
                } else {
                    // 普通购买，以及第一次购买自动订阅
                    NSLog(@"普通购买，以及第一次购买自动订阅");
                    //                if ([Global sharedGlobal].loginInfo.logined) {
                    // 只有登录了才去处理票据 和 执行finish操作
                    NSString *orderUserId = [[tran payment] applicationUsername];// 得到该订单的用户Id
                    //                    if ((orderUserId && orderUserId.length > 0 && [[Global sharedGlobal].loginInfo.userId isEqualToString:orderUserId]) || (nil == orderUserId || orderUserId.length == 0)) {
                    // 当订单的userId和当前userId一致 或者 订单userId为空时才处理票据、执行finish操作
                    [self completeTransaction:tran];
                }
                [[SKPaymentQueue defaultQueue] finishTransaction:tran];

                // 销毁本次操作，由本地数据库进行记录和恢复

                //                    }
                //                }
            }
                break;
            case SKPaymentTransactionStatePurchasing:{

            }
                break;
            case SKPaymentTransactionStateRestored:{
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self->mb hideAnimated:YES];
                    });
                });
            }
                [[SKPaymentQueue defaultQueue] finishTransaction:tran];
                break;
            case SKPaymentTransactionStateFailed:{
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self->mb hideAnimated:YES];
                    });
                });
            }
                [[SKPaymentQueue defaultQueue] finishTransaction:tran];
                break;
            default:
                break;
        }
    }
}
// 交易结束,当交易结束后还要去appstore上验证支付信息是否都正确,只有所有都正确后,我们就可以给用户方法我们的虚拟物品了。
- (void)completeTransaction:(SKPaymentTransaction *)transaction {

    //获取交易凭证
    NSURL * receiptUrl = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData * receiptData = [NSData dataWithContentsOfURL:receiptUrl];
    NSString * base64String = [receiptData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    //初始化字典
    
    NSString * order = transaction.payment.applicationUsername;
    if (order == nil) {
        order = Me.ssid;
    }
    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_IospayNotifyUrl];
    if (dingdan == nil) {
        dingdan = @"";
    }
    if (![dingdan isEqualToString:@""]) {
        mb.label.text = @"正在购买";
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->mb showAnimated:YES];
            });
        });
        NSDictionary * dict = @{@"payload":base64String,@"studentid":order,@"order_no":dingdan};
        
        NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
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
                    [self UpMeDaty];
                }else if ([model.code isEqual:@Notloggedin]){
                    [self UpDengLu];
                }
            } else {
                
            }
        }] resume];
    }
    
    
    //如果这个返回为nil
//    [dic setValue: base64String forKey:receiptKey];
//    [dic setValue: order forKey:@"order"];
//    [dic setValue:[self getCurrentZoneTime] forKey:@"time"];
}

- (void)UpMeDaty{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_getUserInfo];
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            UserLoginModel * m = [UserLoginModel mj_objectWithKeyValues:responseObject];
            if ([m.code isEqual:@200]) {
                NSString *filePatch = [BaseObject AddPathName:UserMe];
                Me = [MeModel mj_objectWithKeyValues:m.studentInfo];
                NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
                NSDictionary * dics = m.studentInfo;
                [usersDic setObject:dics forKey:UserMe];
                [usersDic writeToFile:filePatch atomically:YES];
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self->mb.label.text = @"购买成功";
                        [self->mb hideAnimated:YES afterDelay:1];
                    });
                });
                self.reloade();
            }
        }else{
            //            [ws hqid:nianji];
        }
    }];
}
@end
