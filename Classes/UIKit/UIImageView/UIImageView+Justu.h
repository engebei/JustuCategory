//
//  UIImageView+Justu.h
//  CategoryDemo
//
//  Created by zhubo on 15/12/2.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Justu)

#pragma mark - 画水印

/**
 *  图片水印
 *
 *  @param image 需要添加水印的图片
 *  @param mark  水印
 *  @param rect  水印大小
 */
- (void)setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect;

/**
 *  文字水印
 *
 *  @param image      需要添加水印的图片
 *  @param markString 文字
 *  @param point      水印的位置
 *  @param color      颜色
 *  @param font       字体大小
 */
- (void)setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font;

@end
