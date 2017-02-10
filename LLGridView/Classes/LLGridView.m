//
//  LLGridView.m
//  LLInstalmentSDK
//
//  Created by zdy on 2017/2/9.
//  Copyright © 2017年 lianlian. All rights reserved.
//

#import "LLGridView.h"

@implementation LLGridView

- (void)drawRect:(CGRect)rect {
    if (self.columns.count <= 0) {
        return;
    }
    
    CGFloat rowHeight = 25;
    CGFloat columnTitleHeight = 24;
    CGFloat firstColumnWidth = 32;
    CGFloat columnWidth = (rect.size.width-firstColumnWidth)/([self.columns count]-1);
    
    // 画线
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.borderColor.CGColor);
    
    CGContextSetLineWidth(context, 1.f);
    CGContextAddRect(context, rect);
    CGContextStrokePath(context);
    
    CGContextSetLineWidth(context, 0.5f);
    
    CGFloat offx = 0;
    for (int i=0; i<self.columns.count; i++) {
        CGContextMoveToPoint(context, offx, 0);
        CGContextAddLineToPoint(context, offx, rowHeight*(self.rows.count + 1));
        
        if (i==0) {
            offx = firstColumnWidth;
        } else {
            offx += columnWidth;
        }
    }
    
    CGFloat offy = 0;
    for (int j=0; j<=self.rows.count; j++) {
        CGContextMoveToPoint(context, 0, offy);
        CGContextAddLineToPoint(context, rect.size.width, offy);
        
        if (j==0) {
            offy = columnTitleHeight;
        } else {
            offy += rowHeight;
        }
    }
    
    CGContextStrokePath(context);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setMaximumLineHeight:10.0f];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];

    
    // 绘制文本
    CGFloat wffx = 0;
    CGFloat wffy = 0;
    CGFloat itemHeight =0;
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:(self.rows.count+1)];
    [array addObject:self.columns];
    [array addObjectsFromArray:self.rows];
    
    for (int j=0;j<array.count;j++) {
        
        if (j==0) {
            itemHeight = columnTitleHeight;
        } else {
            itemHeight = rowHeight;
        }
        
        NSArray *items = array[j];
        for (int i=0; i<items.count; i++) {
            CGRect wr;
            if (i == 0) {
                wr = CGRectMake(wffx, wffy+(itemHeight-10)/2+2, firstColumnWidth, 12);
            } else {
                wr = CGRectMake(wffx, wffy+(itemHeight-10)/2+2, columnWidth, 12);
            }
            
            NSString *title = items[i];
            [title drawInRect:wr withAttributes:@{NSParagraphStyleAttributeName: paragraphStyle,
                                                  NSForegroundColorAttributeName: self.textColor}];
            
            wffx += wr.size.width;
        }
        
        wffy += itemHeight;
        wffx = 0;
    }
    
}
@end
