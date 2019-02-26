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
#import "ZhiShiShuTDListView.h"
#import "ZhiShiShiRightScroView.h"
@implementation ZhiShiShuScroVuew{
    UIScrollView * scrollView;
    ZhiShiSHuLeftView * leftView;
    ZhiShiShuView * ZSSView;
    ZhiShiShuGuanXi * guanxi;
    BOOL Start;
    BOOL EndAni;
    ZhiShiShuTDListView * tableilistclick;
    ZhiShiShiRightScroView * rightscroview;
    NSInteger next;
    
    NativeView * nav;
    
    CGPoint lastpoint;
    CGRect frames;
    
    BOOL scroviewhd;//yes  zuo  no 右
}
- (void)setItemid:(NSString *)itemid{
    _itemid = itemid;
    [self loadUpData];

}
- (void)loadUpData{
    __block ZhiShiShuScroVuew * blockSelf = self;
//    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_FOUND];
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSTX,JK_ZHISHITIXIXIANGQING];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"knowledge_id":_itemid};
//    NSDictionary * dic = @{@"studentid":Me.ssid,@"knowledge_id":@"5bc86e068ffaed092e4305e4"};
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            ZhiShiShuModel * model = [ZhiShiShuModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                blockSelf->guanxi.datamodel = model.data;
                blockSelf->ZSSView.data = model.data;
                blockSelf->leftView.axidataarry = model.data.axis;
                CGFloat leftheight = 0;
                for (ZhiShiShuTimeLineModel * m in model.data.axis) {
                    if (leftheight<m.end_y*poinw) {
                        leftheight = m.end_y*poinw;
                    }
                }
                [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(leftheight);
                }];
                blockSelf->nav.title = model.data.name;
                blockSelf->nav.titcolor = [BaseObject colorWithHexString:model.data.txt_color];

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
                [blockSelf setBackgroundColor:backgroundColor];
                [blockSelf->scrollView setBackgroundColor:backgroundColor];
            }];
            [blockSelf->ZSSView layoutIfNeeded];
            [blockSelf.superview layoutIfNeeded];
            blockSelf->rightscroview.topheight = blockSelf->guanxi.frame.size.height;
            blockSelf->rightscroview.labelheight = blockSelf->guanxi.labelallheight;
            blockSelf->rightscroview.itemarray = model.data.arrow;
            blockSelf->rightscroview.allheight = blockSelf->ZSSView.frame.size.height+blockSelf->guanxi.frame.size.height;


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
    scroviewhd = YES;
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

//    self.backgroundColor = [UIColor whiteColor];
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
        make.top.mas_equalTo(self->nav.mas_bottom);
    }];
    [self addSubview:nav];

    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nav.mas_bottom);
        make.left.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
    }];
    [self.superview layoutIfNeeded];
    
    ZSSView = [ZhiShiShuView new];
    ZSSView.lastview = self;
    [scrollView addSubview:ZSSView];
    [ZSSView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->guanxi.mas_bottom);
        make.top.mas_equalTo(self->scrollView).with.offset(0);
        make.left.and.right.and.bottom.mas_equalTo(self->scrollView);
    }];
    [ZSSView setBlock:^(CGRect frame) {
        [ws block:frame];
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

    rightscroview = [ZhiShiShiRightScroView new];
    [self addSubview:rightscroview];
    [rightscroview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(WIDTH/2);
        make.top.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
        make.width.mas_equalTo(WIDTH/2);
    }];
    rightscroview.tag = 100;
//    rightscroview.userInteractionEnabled = NO;
    __block ZhiShiShuScroVuew * blockSelf = self;
    [rightscroview setBlocks:^(CGFloat scroy) {
        blockSelf->scroviewhd = NO;
        blockSelf->guanxi.labelheight = scroy;
        NSLog(@"%f",scroy);
        [blockSelf->scrollView setContentOffset:CGPointMake(blockSelf->scrollView.contentOffset.x, scroy) animated:NO];
    }];

    
    tableilistclick = [ZhiShiShuTDListView new];
    [self addSubview:tableilistclick];
    [tableilistclick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws).with.offset(-TabBarHeight-LENGTH(14));
    }];
    __block ZhiShiShuScroVuew * blockself = self;
    [tableilistclick setBlock:^{
        [blockself uptableliest];
    }];
    
//    tableilistclick.userInteractionEnabled = YES;
//    UITapGestureRecognizer *backtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(uptableliest)];
//    //将手势添加到需要相应的view中去
//    [tableilistclick addGestureRecognizer:backtap];
    
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
- (void)block:(CGRect )frame{
    [self.superview layoutIfNeeded];
    frames = frame;
    frames.origin.y = frames.origin.y + NavHeight + guanxi.frame.size.height;
    self.block(self->frames);
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
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    WS(ws);
    scroviewhd = YES;
//    guanxi.labelheight = scrollView.contentOffset.y;
    __block ZhiShiShuScroVuew * blockSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        [blockSelf->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LENGTH(20));
        }];
        [blockSelf->tableilistclick mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws).with.offset(-LENGTH(110));
        }];
        [blockSelf.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (tableilistclick.frame.origin.x!=-LENGTH(110)) {
        WS(ws);
        [UIView animateWithDuration:0.5 animations:^{
            [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(LENGTH(20));
            }];
            [self->tableilistclick mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(ws).with.offset(-LENGTH(110));
            }];
            [self.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }
    leftView.sizefloat = scrollView.contentOffset.y;
//    NSLog(@"%f",scrollView.contentOffset.y);
    ZSSView.sizey = scrollView.contentOffset.y;
    if (scroviewhd == YES) {
        guanxi.labelheight = scrollView.contentOffset.y;
        rightscroview.scroy = scrollView.contentOffset.y;
    }
    if (lastpoint.x+10 <scrollView.contentOffset.x||lastpoint.x-10>scrollView.contentOffset.x) {
        lastpoint = scrollView.contentOffset;
    }
//    [ scrollView setContentOffset:scrollView.contentOffset animated:YES];//关闭动画效果

//    [guanxi mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self->scrollView.mas_top).with.offset(-scrollView.contentOffset.y);
//    }];
    
    if (scrollView.contentOffset.y>=scrollView.contentSize.height-HEIGHT-HEIGHT/2) {
        [ZSSView huadong];
    }
    
    [leftView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->scrollView).with.offset(scrollView.contentOffset.x);
    }];
    [leftView layoutIfNeeded];
//    if (Start == NO && EndAni == NO) {
//        EndAni = YES;
//        [UIView animateWithDuration:0.5 animations:^{
//            [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.width.mas_equalTo(LENGTH(20));
//            }];
//            [self.superview layoutIfNeeded];
//        } completion:^(BOOL finished) {
//            self->EndAni = NO;
//        }];
//        Start = YES;
//    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    WS(ws);
//    guanxi.labelheight = scrollView.contentOffset.y;

    [UIView animateWithDuration:0.5 animations:^{
        [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LENGTH(1));
        }];
        [self->tableilistclick mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws);
        }];
        [self.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
//    if (Start == YES && EndAni == NO) {
//        EndAni = YES;
//        double delayInSeconds = 2.0;
//        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//            [UIView animateWithDuration:0.5 animations:^{
//                [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
//                    make.width.mas_equalTo(LENGTH(1));
//                }];
//                [self.superview layoutIfNeeded];
//            } completion:^(BOOL finished) {
//                self->EndAni = NO;
//            }];
//        });
//        Start = NO;
//    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    WS(ws);
    guanxi.labelheight = scrollView.contentOffset.y;

    [UIView animateWithDuration:0.5 animations:^{
        [self->tableilistclick mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws);
        }];
        [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LENGTH(1));
        }];
        [self.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
//    if (Start == YES&& EndAni == NO) {
//        EndAni = YES;
//        double delayInSeconds = 2.0;
//        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//            [UIView animateWithDuration:0.5 animations:^{
//                [self->leftView mas_updateConstraints:^(MASConstraintMaker *make) {
//                    make.width.mas_equalTo(LENGTH(1));
//                }];
//                [self.superview layoutIfNeeded];
//            } completion:^(BOOL finished) {
//                self->EndAni = NO;
//            }];
//        });
//        Start = NO;
//    }
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
    [scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->nav.mas_bottom).with.offset(self->guanxi.frame.size.height);
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

#pragma mark ----- 显示tableview
- (void)uptableliest{
    WS(ws);
    if (rightscroview.tag == 100) {
        rightscroview.tag = 101;
        [UIView animateWithDuration:0.5 animations:^{
            [self->rightscroview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws);
            }];
            [ws.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }else{
        rightscroview.tag = 100;
        [UIView animateWithDuration:0.5 animations:^{
            [self->rightscroview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(ws).with.offset(WIDTH/2);
            }];
            [ws.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
    }


}
@end
