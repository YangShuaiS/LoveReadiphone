//
//  BuyMembersView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/24.
//  Copyright © 2019 YS. All rights reserved.
//

#import "BuyMembersView.h"
#import "BuySelectthememberView.h"
#import "BuyInvitationFriendView.h"
#import "BuyLocalContentView.h"
#import "BuyRecommendedView.h"
#import "BuyUserPraiseView.h"
#import "BuyGoodBookView.h"
#import "BuyXieYiView.h"
@implementation BuyMembersView{
    NSMutableArray *  viewarray;
    BuySelectthememberView * BuySelectView;
    BuyInvitationFriendView * InvitView;
    BuyRecommendedView * recomView;
    BuyUserPraiseView * userPraise;
    BuyGoodBookView * goodBook;
    BuyXieYiView * xy;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addview];
    }
    return self;
}

- (void)addview{
    WS(ws);
    self.backgroundColor = RGB(245,245,245);
    viewarray = [NSMutableArray array];

    BuySelectView = [BuySelectthememberView new];
    [viewarray addObject:BuySelectView];
    [BuySelectView setBuyStyle:^(BuyPackage * _Nonnull pack) {
        ws.buyStyle(pack);
    }];
    
    InvitView = [BuyInvitationFriendView new];
    [viewarray addObject:InvitView];
    
    BuyLocalContentView * LocaOne = [[BuyLocalContentView alloc] initWithTitle:@"优质内容" SubTitle:@"清晰完整的知识脉络，近百名优秀讲师及专家倾力制作" DownImage:@"优质内容"];
    [viewarray addObject:LocaOne];
    
    BuyLocalContentView * LocaTwo = [[BuyLocalContentView alloc] initWithTitle:@"兴趣为先" SubTitle:@"深入浅出的兴趣培养，在快乐中培养兴趣，\n在兴趣中建立知识体系" DownImage:@"兴趣为先"];
    [viewarray addObject:LocaTwo];
    
    recomView = [BuyRecommendedView new];
    [viewarray addObject:recomView];
    
    userPraise = [BuyUserPraiseView new];
    [viewarray addObject:userPraise];
    
    goodBook = [BuyGoodBookView new];
    [viewarray addObject:goodBook];
    
//    xy = [BuyXieYiView new];
//    [viewarray addObject:xy];
    
    BaseView * lastview;
    for (int i = 0; i < viewarray.count; i++) {
        BaseView * view = viewarray[i];
        [self addSubview:view];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(ws);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(10));
            }];
        }
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
        }];
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(ws.mas_bottom).with.offset(-TabBarHeight-LENGTH(36)-LENGTH(10));
            }];
        }
        lastview = view;
    }
    
}

- (void)setModel:(BuyAllModel *)model{
    _model = model;
    BuySelectView.model = model;
    goodBook.itemarray = model.bookList;
    recomView.model = model;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
