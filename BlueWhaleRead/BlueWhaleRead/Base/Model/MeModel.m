//
//  MeModel.m
//  BoWanJuanForPad
//
//  Created by 杨帅 on 2018/5/22.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MeModel.h"
static MeModel * model = nil;

@implementation MeModel
+ (MeModel *)SharedModel{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        model = [[MeModel alloc] init];
    });
    return model;
}
- (MeModel *)ADDvalue{
    NSString *filePatch = [BaseObject AddPathName:UserMe];
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
    NSDictionary *dictionary = dataDictionary[UserMe];
    model = [MeModel mj_objectWithKeyValues:dictionary];
    return model;
}
@end
