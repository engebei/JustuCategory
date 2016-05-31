//
//  UINavigationBar+Justu.h
//  CategoryDemo
//
//  Created by zhubo on 15/12/25.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Justu)
//  https://github.com/ltebean/LTNavigationBar

/**
*  背景颜色
*
*  @param backgroundColor 
*/
- (void)lt_setBackgroundColor:(UIColor *)backgroundColor;

/**
 *  设置导航条上面元素的alpha值
 *
 *  @param alpha 
 */
- (void)lt_setElementsAlpha:(CGFloat)alpha;

/**
 *  旋转
 *
 *  @param translationY 
 */
- (void)lt_setTranslationY:(CGFloat)translationY;

/**
 *  恢复默认设置
 */
- (void)lt_reset;

@end
