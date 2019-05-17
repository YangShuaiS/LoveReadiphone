//
//  ArticleTabViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/14.
//  Copyright © 2019 YS. All rights reserved.
//

#import "ArticleTabViewController.h"
#import "ArticleTabView.h"
@interface ArticleTabViewController ()<NavDelegate>{
    ArticleTabView * table;
}

@end

@implementation ArticleTabViewController
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"" RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.titcolor = RGB(0, 0, 0);
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    self.navtive.backgroundColor = [UIColor whiteColor];
}
- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];

    WS(ws);
    table = [ArticleTabView new];
    [self.view addSubview:table];
    [table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.navtive.mas_bottom);
        make.left.and.right.and.bottom.mas_equalTo(ws.view);
    }];
    [self LoadData];
    // Do any additional setup after loading the view.
}


- (void)LoadData{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_LBTXQ];
    NSDictionary * dic = @{@"bannerid":@"259",@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            LunBoTuXQModel * model = [LunBoTuXQModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
        }
    }];
}

-(void)UpData:(LunBoTuXQModel *)model{
    self.navtive.title = model.banner.title;
    NSMutableArray * allimagearray = [NSMutableArray array];
    NSString * allimage = model.banner.content_img;
    NSArray * imageandwh = [BaseObject TiemArray:allimage String:@","];
    for (NSString * imagewh in imageandwh) {
        NSArray * allimage = [BaseObject TiemArray:imagewh String:@"."];
        if (allimage.count >= 3) {
            NSString * imagestr = @"";
            NSString * imagw = @"";
            NSString * imagh = @"";

            for (int i = 0; i < allimage.count-1; i++) {
                NSString * str = allimage[i];
                if (i == 0) {
                    imagestr=[imagestr stringByAppendingString:str];
                }else{
                    imagestr=[imagestr stringByAppendingString:[NSString stringWithFormat:@".%@",str]];
                }
            }
            NSArray * size = [BaseObject TiemArray:allimage[allimage.count-1] String:@"*"];
            if (size.count == 2) {
                imagw = size[0];
                imagh = size[1];
            }
            if (![imagestr isEqualToString:@""]&&![imagw isEqualToString:@""]&&![imagw isEqualToString:@""]) {
                KnowledgegraphlistModel * mo = [KnowledgegraphlistModel new];
                mo.img = imagestr;
                mo.with = [imagw floatValue];
                mo.height = [imagh floatValue];
                [allimagearray addObject:mo];
            }
            
        }
    }
//    KnowledgegraphlistModel
    
        table.itemarray = allimagearray;
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
