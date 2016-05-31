//
//  UIColor+Justu.h
//  CategoryDemo
//
//  Created by zhubo on 15/12/24.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Justu)


/**
 *  十六进制颜色（有无#都可以嗷）
 *
 *  @param hexColor 十六进制字符串
 *
 *  @return color
 */
+ (UIColor *)colorWithHex:(NSString *)hexColor;


/**
 *  RGB色值 alpha
 *
 *  @param red   red
 *  @param green green description
 *  @param blue  blue description
 *  @param alpha alpha description
 *
 *  @return return value description
 */
+ (UIColor *)colorWithWholeRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;


/**
 *  RGB色值
 *
 *  @param red   red
 *  @param green green description
 *  @param blue  blue description
 *  @param alpha alpha description
 *
 *  @return return value description
 */
+ (UIColor *)colorWithWholeRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

@end

#pragma mark - 随机颜色
@interface UIColor (Random)
/**
 *  @brief  随机颜色
 *
 *  @return UIColor
 */
+ (UIColor *)RandomColor;
@end

#pragma mark - 渐变颜色
@interface UIColor (Gradient)
/**
 *  @brief  渐变颜色
 *
 *  @param c1     开始颜色
 *  @param c2     结束颜色
 *  @param height 渐变高度
 *
 *  @return 渐变颜色
 */
+ (UIColor*)gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height;
@end

#pragma mark - web相关
@interface UIColor (Web)
/**
 *  @brief  获取canvas用的颜色字符串
 *
 *  @return canvas颜色
 */
- (NSString *)canvasColorString;
/**
 *  @brief  获取网页颜色字串
 *
 *  @return 网页颜色
 */
- (NSString *)webColorString;
@end
