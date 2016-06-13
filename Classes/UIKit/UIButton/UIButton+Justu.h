//
//  UIButton+Justu.h
//  CategoryDemo
//
//  Created by zhubo on 15/12/24.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Justu)

#pragma mark - 设置按钮额外热区

/**
 *    设置按钮额外热区
 */
@property (nonatomic, assign) UIEdgeInsets touchAreaInsets;


#pragma mark - 倒计时
/**
 *  倒计时
 *
 *  @param timeout    总时间
 *  @param tittle     标题
 *  @param waitTittle 等待中标题
 */
- (void)startTime:(NSInteger)timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;

#pragma mark - 背景颜色添加点击状态
/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;


#pragma mark - 修改UIButton的图片和文字位置
/**
 *  上下居中，图片在上，文字在下
 *
 *  @param spacing 间距
 */
- (void)verticalCenterImageAndTitle:(CGFloat)spacing;
- (void)verticalCenterImageAndTitle; //默认6.0

/**
 *  左右居中，文字在左，图片在右
 *
 *  @param spacing 间距
 */
- (void)horizontalCenterTitleAndImage:(CGFloat)spacing;
- (void)horizontalCenterTitleAndImage; //默认6.0

/**
 *  左右居中，图片在左，文字在右
 *
 *  @param spacing 间距
 */
- (void)horizontalCenterImageAndTitle:(CGFloat)spacing;
- (void)horizontalCenterImageAndTitle; //默认6.0

/**
 *  文字居中，图片在左边
 *
 *  @param spacing 间距
 */
- (void)horizontalCenterTitleAndImageLeft:(CGFloat)spacing;
- (void)horizontalCenterTitleAndImageLeft; //默认6.0

/**
 *  文字居中，图片在右边
 *
 *  @param spacing 间距
 */
- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing;
- (void)horizontalCenterTitleAndImageRight; //默认6.0

@end
