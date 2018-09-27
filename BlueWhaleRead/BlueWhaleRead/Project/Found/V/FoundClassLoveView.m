//
//  FoundClassLoveView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/6/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundClassLoveView.h"
#import "DCCycleScrollView.h"
#import "NavigationMenuView.h"
@interface FoundClassLoveView ()<DCCycleScrollViewDelegate>

@end
@implementation FoundClassLoveView
{
    DCCycleScrollView *banner;
    NavigationMenuView * navMenu;
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [banner removeFromSuperview];
    banner = nil;
    if (banner == nil) {
        banner = [DCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0,0, 0) shouldInfiniteLoop:YES imageGroups:itemarray];
        banner.nav = self.nav;
        //    banner.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
        //    banner.cellPlaceholderImage = [UIImage imageNamed:@"placeholderImage"];
        banner.autoScroll = YES;
        banner.isZoom = YES;
        banner.itemSpace = 0;
        banner.imgCornerRadius = 10;
        banner.itemWidth = LENGTH(300);
        banner.delegate = self;
        banner.pageControl.hidden = YES;
        [self addSubview:banner];
        
        WS(ws);
        [banner mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws).with.offset(0);
            make.top.equalTo(self->navMenu.mas_bottom).with.offset(LENGTH(16));
            make.right.equalTo(ws).with.offset(0);
            make.bottom.equalTo(ws).with.offset(-LENGTH(22));
            make.height.mas_equalTo(LENGTH(120));
        }];
    }
    
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.backgroundColor = backColor;
    WS(ws);
    navMenu = [NavigationMenuView new];
    navMenu.style = NavStyleGeneral;
    navMenu.leftTitle = @"同学最爱";
    [navMenu setBlock:^{
    }];
    [self addSubview:navMenu];
    
    [navMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(0);
    }];
}

@end
