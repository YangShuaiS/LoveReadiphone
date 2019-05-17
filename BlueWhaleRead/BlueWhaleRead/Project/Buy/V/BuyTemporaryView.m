//
//  BuyTemporaryView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/22.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyTemporaryView.h"
#import "BuyMembersViewController.h"
#import <StoreKit/StoreKit.h>
#import "BuyPopPurchaseView.h"
#import "ArticleTabViewController.h"
@implementation BuyTemporaryView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    self.backgroundColor = [UIColor redColor];
    WS(ws);
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(LENGTH(100));
    }];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [self addGestureRecognizer:tap];
//    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    
    

}
- (void)click{
    WS(ws);
    ArticleTabViewController * vc =[ArticleTabViewController new];
    [[self viewController].navigationController pushViewController:vc animated:YES];
//    BuyPopPurchaseView * vc = [BuyPopPurchaseView new];
//    vc.nav = [self viewController].navigationController;
//    [[UIApplication sharedApplication].delegate.window addSubview:vc];
//    [vc mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo([UIApplication sharedApplication].delegate.window);
//    }];
    //第二中方法  应用内跳转
    //1:导入StoreKit.framework,控制器里面添加框架#import <StoreKit/StoreKit.h>
    //2:实现代理SKStoreProductViewControllerDelegate
//    SKStoreProductViewController *storeProductViewContorller = [[SKStoreProductViewController alloc] init];
//    storeProductViewContorller.delegate = self;
//    //        ViewController *viewc = [[ViewController alloc]init];
//    //        __weak typeof(viewc) weakViewController = viewc;
//
//    //加载一个新的视图展示
//    [storeProductViewContorller loadProductWithParameters:
//     //appId
//     @{SKStoreProductParameterITunesItemIdentifier : @"1434054632"} completionBlock:^(BOOL result, NSError *error) {
//         //回调
//         if(error){
//             NSLog(@"错误%@",error);
//         }else{
//             //AS应用界面
//             [[self viewController] presentViewController:storeProductViewContorller animated:YES completion:nil];
//         }
//     }];
    
//    BuyMembersViewController * vc = [BuyMembersViewController new];
//    [[self viewController].navigationController pushViewController:vc animated:YES];
//    [self payWithAppleProductID:@"com.BoWanJuan.CS"];
}
#pragma mark - 评分取消按钮监听
//取消按钮监听
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController{
    [[self viewController]  dismissViewControllerAnimated:YES completion:nil];
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
    payment.applicationUsername = @"12312312312312";// 发起支付时候指定用户的userId
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}
// 请求失败
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error{
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
                    NSLog(@"自动续费的订单,originalTransaction = %@",tran.originalTransaction);
                } else {
                    // 普通购买，以及第一次购买自动订阅
                    NSLog(@"普通购买，以及第一次购买自动订阅");
                }
//                if ([Global sharedGlobal].loginInfo.logined) {
                    // 只有登录了才去处理票据 和 执行finish操作
                    NSString *orderUserId = [[tran payment] applicationUsername];// 得到该订单的用户Id
//                    if ((orderUserId && orderUserId.length > 0 && [[Global sharedGlobal].loginInfo.userId isEqualToString:orderUserId]) || (nil == orderUserId || orderUserId.length == 0)) {
                        // 当订单的userId和当前userId一致 或者 订单userId为空时才处理票据、执行finish操作
                        [self completeTransaction:tran];
                        [[SKPaymentQueue defaultQueue] finishTransaction:tran];// 销毁本次操作，由本地数据库进行记录和恢复
//                    }
//                }
            }
                break;
            case SKPaymentTransactionStatePurchasing:
                NSLog(@"商品添加进列表");
                break;
            case SKPaymentTransactionStateRestored:
                NSLog(@"已经购买过商品");
                [[SKPaymentQueue defaultQueue] finishTransaction:tran];
                break;
            case SKPaymentTransactionStateFailed:
                NSLog(@"交易失败");
                [[SKPaymentQueue defaultQueue] finishTransaction:tran];
                break;
            default:
                break;
        }
    }
}
// 交易结束,当交易结束后还要去appstore上验证支付信息是否都正确,只有所有都正确后,我们就可以给用户方法我们的虚拟物品了。
- (void)completeTransaction:(SKPaymentTransaction *)transaction {
    
    NSString * str = [[NSString alloc] initWithData:transaction.transactionReceipt encoding:NSUTF8StringEncoding];
//    NSString *environment = [self environmentForReceipt:str];
//    NSLog(@"----- 完成交易调用的方法completeTransaction 1--------%@",environment);
    // 验证凭据，获取到苹果返回的交易凭据
    NSURL *receiptURL = [[NSBundle mainBundle] appStoreReceiptURL];// appStoreReceiptURL iOS7.0增加的，购买交易完成后，会将凭据存放在该地址
    NSData *receiptData = [NSData dataWithContentsOfURL:receiptURL];// 从沙盒中获取到购买凭据
    NSString *encodeStr = [receiptData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];// BASE64 常用的编码方案，通常用于数据传输，以及加密算法的基础算法，传输过程中能够保证数据传输的稳定性，BASE64是可以编码和解码的
    NSLog(@"123");
    
//    if (![UserOrderInfo isHasReceiptDate:encodeStr]) {
        // 如果本地数据库没有此条票据记录
//        NSString *environmentStr;
//        if ([environment isEqualToString:@"environment=Sandbox"]) {
//            environmentStr = @"sandbox";
//        } else {
//            environmentStr = @"product";
//        }
        // 将票据POST给自己的服务器去校验...
//    }
}
@end
