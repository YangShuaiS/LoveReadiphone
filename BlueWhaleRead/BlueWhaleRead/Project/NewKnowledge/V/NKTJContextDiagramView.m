//
//  NKTJContextDiagramView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/4/8.
//  Copyright © 2019 YS. All rights reserved.
//

#import "NKTJContextDiagramView.h"
#import "ZhiShiShuShuViewController.h"
@implementation NKTJContextDiagramView{
    UIImageView * imageview;
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
    imageview = [UIImageView new];
    imageview.contentMode = UIViewContentModeScaleToFill;
    imageview.backgroundColor = [UIColor grayColor];
    imageview.layer.masksToBounds = YES;
    imageview.layer.cornerRadius = LENGTH(10);
    [self addSubview:imageview];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws).with.insets(UIEdgeInsetsMake(0, LENGTH(17), LENGTH(14), LENGTH(17)));
        make.height.mas_equalTo(LENGTH(110));
    }];
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(push)];
    [self addGestureRecognizer:tap];
}
- (void)setItemArray:(NSMutableArray *)itemArray{
    _itemArray = itemArray;
    if (itemArray.count>0) {
        NKRKnowledgeModel * model = itemArray[0];
        [imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ZSTX,model.knowledge_width_img]]];

    }
}
- (void)push{
    if (_itemArray.count>0) {
        NKRKnowledgeModel * model = _itemArray[0];
        ZhiShiShuShuViewController * vc = [ZhiShiShuShuViewController new];
        vc.itemid = model.knowledge_id;
        [[self viewController].navigationController pushViewController:vc animated:YES];
    }

}
@end
