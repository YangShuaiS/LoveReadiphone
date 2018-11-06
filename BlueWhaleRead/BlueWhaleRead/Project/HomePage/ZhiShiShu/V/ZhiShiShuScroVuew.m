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
#import "ZhiShiShuGuanXi.h"

@implementation ZhiShiShuScroVuew{
    UIScrollView * scrollView;
    ZhiShiSHuLeftView * leftView;
    ZhiShiShuView * ZSSView;
    ZhiShiShuGuanXi * guanxi;
    BOOL Start;
    BOOL EndAni;

    
    NSInteger next;
    
    NativeView * nav;
    
    CGPoint lastpoint;
}
- (void)setItemid:(NSString *)itemid{
    _itemid = itemid;
    [self loadUpData];

}
- (void)loadUpData{
//    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FOUND];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSTX,JK_ZHISHITIXIXIANGQING];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"knowledge_id":_itemid};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ZhiShiShuModel * model = [ZhiShiShuModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                self->ZSSView.data = model.data;
                self->leftView.axidataarry = model.data.axis;
                self->guanxi.datamodel = model.data;
                CGFloat leftheight = 0;
                for (ZhiShiShuTimeLineModel * m in model.data.axis) {
                    if (leftheight<m.end_y*poinw) {
                        leftheight = m.end_y*poinw;
                    }
                }
                [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(leftheight);
                }];
                self->nav.title = model.data.name;
                self->nav.titcolor = [BaseObject colorWithHexString:model.data.txt_color];
//                [self->nav jianbian:model.data.name Color:@[(id)RGB(242,227,185).CGColor,(id)RGB(207,186,135).CGColor,(id)RGBA(172,145,84,1).CGColor]];
            }
            FLAnimatedImageView * imageview = [FLAnimatedImageView new];
            NSInteger scale_screen = [UIScreen mainScreen].scale;
            NSMutableString *topimage = [[NSMutableString alloc] initWithString:model.data.bg_img];
            if (topimage.length >4) {
                if (scale_screen == 2) {
                }else if (scale_screen >= 3){
                    [topimage insertString:@"_3x" atIndex:topimage.length-4];
                }
            }
            [imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTX,topimage]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                UIColor *backgroundColor = [UIColor colorWithPatternImage:image];
                [self setBackgroundColor:backgroundColor];
                self->nav.backgroundColor = backgroundColor;
            }];
        }else{
            
        }
    }];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        EndAni = NO;
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
- (void)NavLeftClick{
    [self.nav popViewControllerAnimated:YES];
}
- (void)addview{
    WS(ws);
    next = 1;
    scrollView = [UIScrollView new];
//    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.bounces = NO;
    scrollView.minimumZoomScale = 0.5;
    scrollView.maximumZoomScale = 10;
    scrollView.directionalLockEnabled=YES;//定向锁定
//    scrollView.alwaysBounceHorizontal = YES;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nav.mas_bottom);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
    }];
    self.backgroundColor = [UIColor whiteColor];
//    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchScrollView)];
//    
//    [recognizer setNumberOfTapsRequired:1];
//    
//    [recognizer setNumberOfTouchesRequired:1];
//    
//    [scrollView addGestureRecognizer:recognizer];
    
    guanxi = [ZhiShiShuGuanXi new];
    [self addSubview:guanxi];
    [guanxi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(ws);
        make.top.mas_equalTo(self->scrollView.mas_top);
    }];
    
    ZSSView = [ZhiShiShuView new];
    ZSSView.lastview = self;
    [scrollView addSubview:ZSSView];
    [ZSSView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->guanxi.mas_bottom);
        make.top.mas_equalTo(self->scrollView).with.offset(100);
        make.left.and.right.and.bottom.mas_equalTo(self->scrollView);
    }];
    
    leftView = [ZhiShiSHuLeftView new];
    leftView.layer.cornerRadius = LENGTH(10);
    [scrollView addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->ZSSView.mas_top);
//        make.bottom.mas_equalTo(self->scrollView);
        make.left.mas_equalTo(self->scrollView);
        make.width.mas_equalTo(LENGTH(1));
        make.height.mas_equalTo(LENGTH(1));

    }];
    
    [self addSubview:nav];

    
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
    leftView.sizefloat = scrollView.contentOffset.y;
    if (lastpoint.x+10 <scrollView.contentOffset.x||lastpoint.x-10>scrollView.contentOffset.x) {
        lastpoint = scrollView.contentOffset;
    }
//    [ scrollView setContentOffset:scrollView.contentOffset animated:YES];//关闭动画效果

    [guanxi mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView.mas_top).with.offset(-scrollView.contentOffset.y);
    }];
    
    if (scrollView.contentOffset.y>=scrollView.contentSize.height-HEIGHT-HEIGHT/2) {
        [ZSSView huadong];
    }
    
    [leftView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->scrollView).with.offset(scrollView.contentOffset.x);
    }];
    [leftView layoutIfNeeded];
    if (Start == NO && EndAni == NO) {
        EndAni = YES;
        [UIView animateWithDuration:0.5 animations:^{
            [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(LENGTH(20));
            }];
            [self.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            self->EndAni = NO;
        }];
        Start = YES;
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (Start == YES && EndAni == NO) {
        EndAni = YES;
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [UIView animateWithDuration:0.5 animations:^{
                [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo(LENGTH(1));
                }];
                [self.superview layoutIfNeeded];
            } completion:^(BOOL finished) {
                self->EndAni = NO;
            }];
        });
        Start = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (Start == YES&& EndAni == NO) {
        EndAni = YES;
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [UIView animateWithDuration:0.5 animations:^{
                [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo(LENGTH(1));
                }];
                [self.superview layoutIfNeeded];
            } completion:^(BOOL finished) {
                self->EndAni = NO;
            }];
        });
        Start = NO;
    }
}
#define mark ---------------- 放大
//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
//    return ZSSView;
//}
//- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
//
//    CGRect frame = ZSSView.frame;
//
//    frame.origin.y = (scrollView.frame.size.height - ZSSView.frame.size.height) > 0 ? (scrollView.frame.size.height - ZSSView.frame.size.height) * 0.5 : 0;
//    frame.origin.x = (scrollView.frame.size.width - ZSSView.frame.size.width) > 0 ? (scrollView.frame.size.width - ZSSView.frame.size.width) * 0.5 : 0;
//    ZSSView.frame = frame;
//
//    scrollView.contentSize = CGSizeMake(ZSSView.frame.size.width + 30, ZSSView.frame.size.height + 30);
//}
- (void)layoutSubviews{
    [super layoutSubviews];
    ZSSView.nav = self.nav;
    [ZSSView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView).with.offset(self->guanxi.frame.size.height);
    }];

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
