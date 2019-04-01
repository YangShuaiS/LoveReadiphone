//
//  NewBookXQViewController.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/3/18.
//  Copyright © 2019年 YS. All rights reserved.
//

#import "NewBookXQViewController.h"
#import "NewBookXqNavView.h"
#import "NBookXQTopView.h"
#import "NBTBookSDView.h"
#import "NBTXGMLTView.h"
#import "NBXQXGZSTView.h"
#import "NBXQDownView.h"
#import "NewMyClassViewController.h"
#import "NewBookReadViewController.h"
#import "NewBookXQSPViewController.h"

#import "NBXQMyClassTableView.h"
#import "NewHpViewModel.h"

#import "GuideBookXqOneView.h"
#import "GuideBookXqTwoView.h"
#import "GuideBookXqThreeView.h"
@interface NewBookXQViewController ()<UIScrollViewDelegate>

@end

@implementation NewBookXQViewController{
    NewBookXqNavView * nav;
    NSMutableArray *  viewarray;
    UIScrollView * scrollView;
    NBookXQTopView * topview;
    NBTBookSDView * shudan;
    NBTXGMLTView * lbt;
    NBXQXGZSTView * zst;
    NBXQDownView * downview;
    CGFloat nowwz;
    CGFloat kgbnowwz;

    
    NewMyClassViewController * zdtx;
    NSMutableArray * tabarray;
    NSInteger zt;
    
    BOOL scroclick;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self LoadData:_loadId];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    viewarray = [NSMutableArray array];
    self.view.backgroundColor = RGB(241,245,248);
    nav = [NewBookXqNavView new];
    [self.view addSubview:nav];
    [nav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(ws.view);
    }];
    
    scrollView = [UIScrollView new];
    scrollView.delegate = self;
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.top.equalTo(self->nav.mas_bottom).with.offset(2);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    
    topview = [NBookXQTopView new];
    [scrollView addSubview:topview];
    [viewarray addObject:topview];
    
    shudan = [NBTBookSDView new];
    [scrollView addSubview:shudan];
    [viewarray addObject:shudan];
    
    lbt = [NBTXGMLTView new];
    [scrollView addSubview:lbt];
    [viewarray addObject:lbt];
    
    zst = [NBXQXGZSTView new];
    [scrollView addSubview:zst];
    [viewarray addObject:zst];

    UIView * downv = [UIView new];
    [scrollView  addSubview:downv];
    [viewarray addObject:downv];
    BaseView * lastview;
    for (int i = 0; i < viewarray.count; i++) {
        BaseView * view = viewarray[i];
        [scrollView addSubview:view];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->scrollView.mas_top).with.offset(0);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
                make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(10));
            }];
        }
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws.view).with.offset(0);
            make.right.equalTo(ws.view).with.offset(0);
        }];
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);
                make.height.mas_equalTo(HEIGHT-NavHeight-2-LENGTH(10));

            }];
        }
        lastview = view;
    }
    nowwz = HEIGHT-NavHeight-2-LENGTH(55) + scrollView.contentOffset.y;
    downview = [NBXQDownView new];
    [scrollView addSubview:downview];
    [downview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView).with.offset(HEIGHT-NavHeight-2-LENGTH(55));
        make.height.mas_equalTo(HEIGHT-NavHeight-2-LENGTH(10));
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
    }];

    [downview setBlock:^(NSInteger inter) {
        [ws updownview:inter];
    }];
    [downview setBlocky:^(CGFloat scroY, BOOL end) {
        [ws upNowdownview:scroY End:end];
    }];
    downview.clickinter = 1;
    scroclick = NO;
}

- (void)upNowdownview:(CGFloat)sizey End:(BOOL)end{
    if (sizey<0) {
        [downview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->scrollView).with.offset(self->nowwz+sizey);
        }];
    }else{
        [downview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->scrollView).with.offset(self->nowwz-(HEIGHT-NavHeight-2-LENGTH(55))+sizey);
        }];
    }

//    NSLog(@"%f",sizey);
//
//    if (downview.clickinter == 1) {
//
//    }else{
////        [downview mas_updateConstraints:^(MASConstraintMaker *make) {
////            make.top.mas_equalTo(self->scrollView).with.offset(self->nowwz+sizey);
////        }];
//    }

    if (end == YES) {
        WS(ws);
        if (-sizey>=(HEIGHT-NavHeight-2)/2) {
            CGFloat weizhi = nowwz - (HEIGHT-NavHeight-2-LENGTH(55));
            [UIView animateWithDuration:0.5 animations:^{
                [self->downview mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self->scrollView).with.offset(weizhi);
                }];
                [ws.view.superview layoutIfNeeded];
            } completion:^(BOOL finished) {
                self->kgbnowwz = weizhi;
                self->downview.nfclick = 1;
            }];

        }else{
            [UIView animateWithDuration:0.5 animations:^{
                [self->downview mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self->scrollView).with.offset(self->nowwz);
                }];
                [ws.view.superview layoutIfNeeded];
            } completion:^(BOOL finished) {
                self->kgbnowwz = self->nowwz;
                self->downview.nfclick = 0;
            }];
        }
    }
}


- (void)updownview:(NSInteger)inter{
    if (inter == 0) {
        WS(ws);
        CGFloat weizhi = nowwz - (HEIGHT-NavHeight-2-LENGTH(55));
        [UIView animateWithDuration:0.5 animations:^{
            [self->downview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self->scrollView).with.offset(weizhi);
            }];
            [ws.view.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            self->kgbnowwz = weizhi;
            self->downview.nfclick = 1;
        }];
    }else{
        WS(ws);
        [UIView animateWithDuration:0.5 animations:^{
            [self->downview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self->scrollView).with.offset(self->nowwz);
            }];
            [ws.view.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            self->kgbnowwz = self->nowwz;
            self->downview.nfclick = 0;

        }];
    }

    zt = inter;
    
}
- (void)LoadData:(NSString*)loadId{
    
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_BOOKXQ];
    NSDictionary * dic = @{@"studentid":Me.ssid,@"bookid":loadId};
    
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            BookXQModel * model = [BookXQModel mj_objectWithKeyValues:responseObject];
            if ([model.code isEqual:@200]) {
                [self UpData:model];
            }else if ([model.code isEqual:@Notloggedin]){
                [self UpDengLu];
            }
        }else{
            
        }
    }];
}

- (void)UpData:(BookXQModel *)model{
    nav.model = model;
    topview.model = model;
    shudan.model = model;
    lbt.advArray = model.knowledgeTXList;
    zst.model = model;
    switch (model.book.imp_type) {
        case BookIntensiveReading:
            [self addIntensiveMenu:model];
            break;
        case BookExtensiveReading:
            [self addExtensiveMenu:model];
            break;
        default:
            break;
    }
    if ([[[BaseObject jsd_getCurrentViewController] class] isEqual:[self class]]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self addGuideBookXqOneView];
        });
    }
}
- (void)addIntensiveMenu:(BookXQModel*)model{
    if (downview.titarray.count == 3) {
        
    }else{
        __weak NewBookXQViewController * blockSelf = self;
        NSArray * titarray = @[@"同学",@"读后感",@"优秀书评"];
        downview.titarray = titarray;
        
        NSMutableArray * childVC =[NSMutableArray array];
        
        zdtx = [[NewMyClassViewController alloc] init];
        zdtx.itemarray = model.readFriend;
        [self addChildViewController:zdtx];
        [childVC addObject:zdtx ];
        
        NewBookReadViewController * msdt = [[NewBookReadViewController alloc] init];
        msdt.itemarray =model.readThought;
        [self addChildViewController:msdt];
        [childVC addObject:msdt];
        
        NewBookXQSPViewController * yxsp = [[NewBookXQSPViewController alloc] init];
        yxsp.itemarray = model.bookReview;
        [self addChildViewController:yxsp];
        [childVC addObject:yxsp];
        
        downview.controllerArray = childVC;
        [zdtx setBlocks:^(CGFloat flo, BOOL end) {
            [blockSelf updownviewframe:flo End:end];
        }];
        [msdt setBlocks:^(CGFloat flo, BOOL end) {
            [blockSelf updownviewframe:flo End:end];
        }];

        [yxsp setBlocks:^(CGFloat flo, BOOL end) {
            [blockSelf updownviewframe:flo End:end];
        }];

        tabarray = [NSMutableArray array];
        [tabarray addObject:zdtx.tableView];
        [tabarray addObject:msdt.tableView];
        [tabarray addObject:yxsp.tableView];
    }
}
- (void)addExtensiveMenu:(BookXQModel*)model{
    if (downview.titarray.count == 1) {
        
    }else{
        __weak NewBookXQViewController * blockSelf = self;
        NSArray * titarray = @[@"同学"];
        downview.titarray = titarray;
        
        NSMutableArray * childVC =[NSMutableArray array];
        
        NewMyClassViewController * zdtx = [[NewMyClassViewController alloc] init];
        zdtx.itemarray = model.readFriend;
        [self addChildViewController:zdtx];
        [childVC addObject:zdtx ];
        downview.controllerArray = childVC;
        [zdtx setBlocks:^(CGFloat flo, BOOL end) {
            [blockSelf updownviewframe:flo End:end];
        }];
        tabarray = [NSMutableArray array];
        [tabarray addObject:zdtx.tableView];

    }

}
#pragma mark --将要开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    scroclick = YES;
}

#pragma mark --结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    scroclick = NO;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [nav scrodidsize:scrollView.contentOffset.y];
//    CGFloat flo = HEIGHT-NavHeight-2;
    if (scrollView.contentOffset.y <= zst.frame.size.height+zst.frame.origin.y-(HEIGHT-NavHeight-2-LENGTH(55))) {
        nowwz = HEIGHT-NavHeight-2-LENGTH(55) + scrollView.contentOffset.y;
        downview.clickinter = 1;
        downview.nfclick = 0;

        if (scroclick == YES) {
            kgbnowwz = nowwz;
        }
    }else{
        nowwz = zst.frame.size.height+zst.frame.origin.y+LENGTH(10);
        downview.clickinter = 0;
        self->downview.nfclick = 1;
        if (scroclick == YES) {
            kgbnowwz = nowwz - (nowwz -scrollView.contentOffset.y);
        }
    }
    if (nowwz >zst.frame.size.height+zst.frame.origin.y+LENGTH(10)) {
        nowwz = zst.frame.size.height+zst.frame.origin.y+LENGTH(10);
    }
    [downview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->scrollView).with.offset(self->nowwz);
    }];
//    if (scrollView.contentOffset.y + flo >) {
//        <#statements#>
//    }
    
//    if (scrollView.contentOffset.y + flo == scrollView.contentSize.height) {
//        downview.clickinter = 0;
////        zdtx.inter = 1;
//    }else{
//        downview.clickinter = 1;
//
////        zdtx.inter = 0;
//    }
}


- (void)updownviewframe:(CGFloat)flo End:(BOOL)end{
    if (downview.clickinter == 1 && flo<0) {
        kgbnowwz = kgbnowwz - flo;
        [downview mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->scrollView).with.offset(self->kgbnowwz);
        }];
        for (UITableView *tableView in tabarray) {
            tableView.contentOffset = CGPointMake(0, 0);
        }
    }else if (downview.clickinter == 0 && flo<0){
        kgbnowwz = kgbnowwz + flo;
        [scrollView setContentOffset:CGPointMake(0, kgbnowwz) animated:NO];
        for (UITableView *tableView in tabarray) {
            tableView.contentOffset = CGPointMake(0, 0);
        }
    }else if (downview.clickinter == 0 &&flo>0){
        if (kgbnowwz < nowwz) {
            kgbnowwz = kgbnowwz + flo;
            [scrollView setContentOffset:CGPointMake(0, kgbnowwz) animated:NO];
            for (UITableView *tableView in tabarray) {
                tableView.contentOffset = CGPointMake(0, 0);
            }
        }else{
            kgbnowwz = nowwz;
            [scrollView setContentOffset:CGPointMake(0, kgbnowwz) animated:NO];

//            [self->downview mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(self->scrollView).with.offset(self->kgbnowwz);
//            }];
//            [scrollView setContentOffset:CGPointMake(0, kgbnowwz) animated:NO];
        }
    }
    
    if (end == YES && downview.clickinter == 1) {
        CGFloat jl = 0;
        if (kgbnowwz > nowwz) {
            jl = kgbnowwz - nowwz;
        }else{
            jl = nowwz-kgbnowwz;
        }
        
        WS(ws);
        if (jl>=(HEIGHT-NavHeight-2)/2) {
            CGFloat weizhi = nowwz - (HEIGHT-NavHeight-2-LENGTH(55));
            [UIView animateWithDuration:0.5 animations:^{
                [self->downview mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self->scrollView).with.offset(weizhi);
                }];
                [ws.view.superview layoutIfNeeded];
            } completion:^(BOOL finished) {
                self->kgbnowwz = weizhi;
                self->downview.nfclick = 1;
            }];
            
        }else{
            [UIView animateWithDuration:0.5 animations:^{
                [self->downview mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self->scrollView).with.offset(self->nowwz);
                }];
                [ws.view.superview layoutIfNeeded];
            } completion:^(BOOL finished) {
                self->kgbnowwz = self->nowwz;
                self->downview.nfclick = 0;
            }];
        }
    }
    


//    if (flo<0) {
//        zdtx.inter = 0;
//    }
//    if (scrollView.conten tOffset.y <= zst.frame.size.height+zst.frame.origin.y-(HEIGHT-NavHeight-2-LENGTH(55))) {
//    }else{
//    }
    
//    NSLog(@"%f  %f   %f",flo,self->nowwz,nowwz-flo);
//    if (flo <=0) {
//        [scrollView setContentOffset:CGPointMake(0, nowwz+flo) animated:YES];
//
//        for (UITableView *tableView in tabarray) {
//            tableView.contentOffset = CGPointMake(0, 0);
//        }
//    }else{
//        [downview mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self->scrollView).with.offset(self->nowwz+flo);
//        }];
//    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark ------------------ 引导页
- (void)addGuideBookXqOneView{
    NSString *filePatch = [BaseObject AddPathName:[NSString stringWithFormat:@"%@.plist",BENDIXINXI]];
    NSMutableDictionary *dataDictionary = [BaseObject BenDiXinXi];
    NewHpViewModel * model = [NewHpViewModel mj_objectWithKeyValues:dataDictionary];
    if ([model.ydybookxq integerValue]<3) {
        WS(ws);
        GuideBookXqOneView * view = [GuideBookXqOneView new];
        view.frames = topview.frame;
        [self.view.window addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(ws.view.window);
        }];
        [view setBlock:^{
            [ws addGuideBookXqTwoView];
        }];
        
        NSString * str = [NSString stringWithFormat:@"%ld",[model.ydybookxq integerValue]+1];
        [dataDictionary setValue:str forKey:@"ydybookxq"];
        [dataDictionary writeToFile:filePatch atomically:YES];
    }
}

- (void)addGuideBookXqTwoView{
    WS(ws);
    GuideBookXqTwoView * view = [GuideBookXqTwoView new];
    view.frames = topview.frame;
    [self.view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view.window);
    }];
    [view setBlock:^{
        [ws addGuideBookXqThreeView];
    }];
}
- (void)addGuideBookXqThreeView{
    WS(ws);
    GuideBookXqThreeView * view = [GuideBookXqThreeView new];
    view.frames = self.view.frame;
    [self.view.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view.window);
    }];
//    if (bookDown.model.imp_type == BookIntensiveReading) {
//        CGRect fram = homeMenu.frame;
//        fram.origin.x = fram.origin.x + LENGTH(15);
//        fram.origin.x = fram.origin.y +LENGTH(5)+LENGTH(15)+LENGTH(5)+NavHeight+bookTop.frame.size.height;
//
//    }else{
//    }
}
@end
