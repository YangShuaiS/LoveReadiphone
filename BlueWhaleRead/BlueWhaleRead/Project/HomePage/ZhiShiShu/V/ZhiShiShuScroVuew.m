//
//  ZhiShiShuScroVuew.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/9/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiShiShuScroVuew.h"
#import "ZhiShiShuView.h"
#import "ZhiShiSHuLeftView.h"

@implementation ZhiShiShuScroVuew{
    UIScrollView * scrollView;
    ZhiShiSHuLeftView * leftView;
    ZhiShiShuView * ZSSView;
    BOOL Start;
    
    NSInteger next;
    BaseView * leftview;
    
    NativeView * nav;
    
}
- (void)loadUpData{
//    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FOUND];
    NSString * url = @"http://192.168.1.102/knowledge/public/knowledge/get-all?knowledge_id=5baeeba8f52cad3684006ad2";
    NSDictionary * dic = @{@"studentid":Me.ssid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ZhiShiShuModel * model = [ZhiShiShuModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                self->ZSSView.data = model.data;
                [self->nav jianbian:model.data.name Color:@[(id)RGB(242,227,185).CGColor,(id)RGB(207,186,135).CGColor,(id)RGBA(172,145,84,1).CGColor]];

            }
        }else{
            
        }
    }];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self AddNavtion];
        [self addview];
    }
    return self;
}

#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    WS(ws);
    nav = [[NativeView alloc] initWithLeftImage:@"backhei" Title:@"" RightTitle:@"" NativeStyle:NavStyleGeneral];
    nav.backgroundColor = [UIColor clearColor];
    nav.delegate = self;
    [self addSubview:nav];
    [nav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
}
- (void)addview{
    WS(ws);
    next = 1;
    scrollView = [UIScrollView new];
//    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.bounces = YES;
    scrollView.minimumZoomScale = 0.5;
    scrollView.maximumZoomScale = 10;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nav.mas_bottom);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
    }];
    UIImage *backgroundImage = [UIImage imageNamed:@"581537874042_.pic_hd"];
    UIColor *backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    [self setBackgroundColor:backgroundColor];


    
//    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headRefresh)];

    
//    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchScrollView)];
//    
//    [recognizer setNumberOfTapsRequired:1];
//    
//    [recognizer setNumberOfTouchesRequired:1];
//    
//    [scrollView addGestureRecognizer:recognizer];
    
    ZSSView = [ZhiShiShuView new];
    [scrollView addSubview:ZSSView];
    [ZSSView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->scrollView);

    }];
    
    leftView = [ZhiShiSHuLeftView new];
    [scrollView addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView);
        make.bottom.mas_equalTo(self->scrollView);
        make.left.mas_equalTo(self->scrollView);
        make.width.mas_equalTo(LENGTH(1));
    }];
    
    [self loadUpData];

    
//    BaseView * rightview = [BaseView new];
//    rightview.backgroundColor = [UIColor redColor];
//    [scrollView addSubview:rightview];
//    [rightview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(ws);
//        make.right.mas_equalTo(self->scrollView);
 //        make.height.mas_equalTo(50);
//    }];
//
//    rightview.userInteractionEnabled = YES;
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneButton)];
//    [rightview addGestureRecognizer:tap];
    
//    leftview = [BaseView new];
//    leftview.backgroundColor = [UIColor blackColor];
//    [self addSubview:leftview];
//    [leftview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(ws);
//        make.left.mas_equalTo(ws);
//        make.width.mas_equalTo(50);
//        make.height.mas_equalTo(50);
//    }];
//
//    leftview.userInteractionEnabled = YES;
//    UITapGestureRecognizer * tapp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoButton)];
//    [leftview addGestureRecognizer:tapp];
//    leftview.hidden = YES;

}

//- (void)oneButton{
//    next++;
//    [ZSSView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(WIDTH*self->next);
//    }];
//    if (next>1) {
//        leftview.hidden = NO;
//    }else{
//        leftview.hidden = YES;
//    }
//}
//- (void)twoButton{
//    next--;
//    [ZSSView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(WIDTH*self->next);
//    }];
//    if (next>1) {
//        leftview.hidden = NO;
//    }else{
//        leftview.hidden = YES;
//    }
//}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y>=scrollView.contentSize.height-HEIGHT-HEIGHT/2) {
        [ZSSView huadong];
    }
    [leftView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->scrollView).with.offset(scrollView.contentOffset.x);
    }];
    if (Start == NO) {
        [UIView animateWithDuration:0 animations:^{
            [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(LENGTH(20));
            }];
//            [self.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
        Start = YES;
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (Start == YES) {
        [UIView animateWithDuration:0.5 animations:^{
            [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(LENGTH(1));
            }];
            [self.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
        Start = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (Start == YES) {
        [UIView animateWithDuration:0.5 animations:^{
            [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(LENGTH(1));
            }];
            [self.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
        Start = NO;
    }
}
#define mark ---------------- 放大
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return ZSSView;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {

    CGRect frame = ZSSView.frame;

    frame.origin.y = (scrollView.frame.size.height - ZSSView.frame.size.height) > 0 ? (scrollView.frame.size.height - ZSSView.frame.size.height) * 0.5 : 0;
    frame.origin.x = (scrollView.frame.size.width - ZSSView.frame.size.width) > 0 ? (scrollView.frame.size.width - ZSSView.frame.size.width) * 0.5 : 0;
    ZSSView.frame = frame;

    scrollView.contentSize = CGSizeMake(ZSSView.frame.size.width + 30, ZSSView.frame.size.height + 30);
}
- (void)layoutSubviews{
    [super layoutSubviews];
}


//
//- (void)touchScrollView{
//    NSLog(@"被点击了");
//}
#pragma mark - 下拉刷新
- (void)headRefresh{
//    [self LoadData];
}

@end
