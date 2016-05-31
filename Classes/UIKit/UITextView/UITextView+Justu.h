//
//  UITextView+Justu.h
//  CategoryDemo
//
//  Created by zhubo on 15/12/18.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Justu)

#pragma mark - placeholder

@property (nonatomic, readonly) UILabel *placeholderLabel;
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;

#pragma mark - 添加事件 （UIControl Target Action）

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

- (void)removeTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

- (NSSet *)allTargets;
- (UIControlEvents)allControlEvents;
- (NSArray *)actionsForTarget:(id)target forControlEvent:(UIControlEvents)controlEvent;

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event;
- (void)sendActionsForControlEvents:(UIControlEvents)controlEvents;

#pragma mark - 选中文字

/**
 *  @brief  当前选中的字符串范围
 *
 *  @return NSRange
 */
- (NSRange)selectedRange;
/**
 *  @brief  选中所有文字
 */
- (void)selectAllText;
/**
 *  @brief  选中指定范围的文字
 *
 *  @param range NSRange范围
 */
- (void)setSelectedRange:(NSRange)range;


#pragma mark - 限制字符长度
//https://github.com/pclion/TextViewCalculateLength

/**
 *  用于计算textview输入情况下的字符数，解决实现限制字符数时，计算不准的问题
 *
 *  @param text 字符串
 *
 *  @return return 字符串长度
 */
- (NSInteger)getInputLengthWithText:(NSString *)text;

@end
