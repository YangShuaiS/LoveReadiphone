//
//  ArticleTabView.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2019/5/14.
//  Copyright © 2019 YS. All rights reserved.
//

#import "ArticleTabView.h"
#import "ArticleTabViewTableViewCell.h"
@interface ArticleTabView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation ArticleTabView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.separatorStyle = UITableViewStylePlain;
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];
        //使tableview无数据时候无下划线
        self.tableFooterView = [[UIView alloc]init];
        self.estimatedRowHeight = 300;//估算高度
        self.rowHeight = UITableViewAutomaticDimension;
        //        self.scrollEnabled = NO;
        //        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

#pragma mark  - tableViewDelegate代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    KnowledgegraphlistModel * mo = _itemarray[indexPath.row];
    CGFloat bl = WIDTH/mo.with*1.0;
    return mo.height*bl;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _itemarray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    KnowledgegraphlistModel * mo = _itemarray[indexPath.row];
    ArticleTabViewTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[ArticleTabViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell.img sd_setImageWithURL:URLIMAGE(mo.img)];
//    [self confirmCell:cell atIndexPath:indexPath];
    return cell;
}
//- (void)confirmCell:(ArticleTabViewTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
//    NSString *imgUrl = _itemarray[indexPath.row];
//    UIImage *cachedImg = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:imgUrl];
//    if (!cachedImg) {
//        [self downloadImage:imgUrl forIndexPath:indexPath Cell:cell];
//    }else{
//        cell.img.image =cachedImg;
//    }
//}
//- (void)downloadImage:(NSString *)imageURL forIndexPath:(NSIndexPath *)indexPath Cell:(ArticleTabViewTableViewCell *)cell{
//    __weak typeof(self) weakSelf = self;
//    [cell.img sd_setImageWithURL:[NSURL URLWithString:imageURL] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        cell.img.image =image;
//        [weakSelf performSelectorOnMainThread:@selector(reloadCellAtIndexPath:) withObject:indexPath waitUntilDone:NO];
//                [weakSelf performSelectorOnMainThread:@selector(reloadCellAtIndexPath:) withObject:indexPath waitUntilDone:NO];
//
//    }];
////    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_itemarray[indexPath.row]]] options:2 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
////
////    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
////        [[SDImageCache sharedImageCache] storeImage:image forKey:imageURL toDisk:YES completion:^{
////
////        }];;
////        cell.img.image =image;
////
////                          [weakSelf performSelectorOnMainThread:@selector(reloadCellAtIndexPath:) withObject:indexPath waitUntilDone:NO];
////    }];
//
//}
-(void)reloadCellAtIndexPath:(NSIndexPath *)indexPath {
    [self reloadData];
}
//- (void)upmodel:(PingLunModel *)model{
//    [_itemarray removeObject:model];
//    [self reloadData];
//}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [UIView new];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self reloadData];
}


@end
