//
//  HomeLiteracyView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeLiteracyView.h"
#import "HomeLiteracy.h"
#import "SZSCViewController.h"
@implementation HomeLiteracyView

{
    BaseView * backView;
    NSMutableArray * array;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    
    backView = [BaseView new];
    backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:backView];
    
    array = [NSMutableArray array];
    
    NSMutableArray * modelarray = [NSMutableArray array];
    for (int i = 0; i< 2; i++) {
        TestImgListModel* model = [TestImgListModel new];
        if (i == 0) {
            model.image = @"bg_识字量";
//            model.title = @"识字量";
//            model.style = 0;
        }else if (i == 1){
            model.image = @"bg_识词量";
//            model.title = @"识词量";
//            model.style = 0;
        }else{
            model.image = @"bg_诵读检测";
//            model.title、
        }
        [modelarray addObject:model];
    }
    for (int i = 0; i < 2; i++) {
        HomeLiteracy * szl = [HomeLiteracy new];
        szl.model = modelarray[i];
        [backView addSubview:szl];
        [array addObject:szl];
        
        BaseButton * Button = [BaseButton buttonWithType:UIButtonTypeCustom];
        [Button addTarget:self action:@selector(Button:) forControlEvents:UIControlEventTouchUpInside];
        Button.tag = 100+i;
        [szl addSubview:Button];
        
        [Button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(szl);
        }];
    }
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0 );
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    CGFloat padding = LENGTH(21);
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:padding leadSpacing:LENGTH(19) tailSpacing:LENGTH(19)];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backView.mas_top).offset(LENGTH(21));
        make.height.mas_equalTo(LENGTH(100));
        make.bottom.equalTo(self->backView.mas_bottom).offset(-LENGTH(21));
    }];
}
- (void)Button:(BaseButton *)button{
    if (button.tag == 100||button.tag == 101) {
        if ([self.nav respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.nav.interactivePopGestureRecognizer.enabled = NO;
        }
        SZSCViewController * vc = [SZSCViewController new];
        if (button.tag == 100) {
            vc.titles = @"识字量检测";
        }else{
            vc.titles = @"识词量检测";
        }
        [self.nav pushViewController:vc animated:YES];
    }else{
//        ReadViewController * vc = [ReadViewController new];
//        [self.nav pushViewController:vc animated:YES];
    }
    
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    
//    for (int i = 0; i < itemarray.count; i++) {
//        HomeLiteracy * view = array[i];
//        view.model = itemarray[i];
//    }
}
@end
