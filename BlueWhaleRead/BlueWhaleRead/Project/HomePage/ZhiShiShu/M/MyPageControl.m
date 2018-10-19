//
//  MyPageControl.m
//  BlueWhaleRead
//
//  Created by 杨帅 on 2018/10/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MyPageControl.h"

@implementation MyPageControl

- (void) setCurrentPage:(NSInteger)page {
    
    [super setCurrentPage:page];
    
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++) {
        
        if (subviewIndex == page)
            
        {
            
            UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
            
            CGSize size;
            
            size.height = 8;
            
            size.width = 8;
            
            [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
                                         
                                         size.width,size.height)];
            
        }else{
            UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
            
            CGSize size;
            
            size.height = 6;
            
            size.width = 6;
            
            [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
                                         
                                         size.width,size.height)];
        }
        
        
        
    }
    
}

@end
