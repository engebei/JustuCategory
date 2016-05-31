//
//  UILabel+Justu.h
//  CategoryDemo
//
//  Created by zhubo on 15/12/14.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 文字垂直方向位置
 */
typedef enum UITextVerticalAlignment {
    UITextVerticalAlignmentTop, /** 居上**/
    UITextVerticalAlignmentMiddle, /** 居中**/
    UITextVerticalAlignmentBottom /** 居下**/
} UITextVerticalAlignment;

@interface UILabel (Justu)


#pragma mark - 设置文字垂直方向位置
// getter
- (UITextVerticalAlignment)textVerticalAlignment;

// setter
- (void)setTextVerticalAlignment:(UITextVerticalAlignment)textVerticalAlignment;

#pragma mark - 长按复制
/**
   将此属性设置为“是”，以便“复制”功能。默认为否
 */
@property (nonatomic) IBInspectable BOOL copyingEnabled;

/**
    用于启用/禁用内部长按手势识别。默认为是。
 */
@property (nonatomic) IBInspectable BOOL shouldUseLongPressGestureRecognizer;

@end
