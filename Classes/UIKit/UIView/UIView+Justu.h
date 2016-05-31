//
//  UIView+Justu.h
//  CategoryDemo
//
//  Created by zhubo on 15/11/30.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^JMWhenTappedBlock)();

@interface UIView (Justu)


#pragma mark - 移除所有子视图

- (void)removeAllSubviews;

#pragma mark - 寻找子(或父)视图

/**
 *  寻找指定类型的Subview对象
 *
 *  @param clazz Subview 类名
 *
 *  @return 返回 View 对象
 */
- (id)findSubViewWithSubViewClass:(Class)clazz;

#pragma mark - 设置圆角(可以指定方向)

/**
 *  设置圆角
 *
 *  @param radius 圆角大小
 */
- (void)setCornerRadius:(CGFloat)radius;

/**
 *  设置圆角
 *
 *  @param corners 圆角的位置
 *  @param radius  圆角大小
 */
- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius;

#pragma mark - 添加手势
- (void)whenTapped:(JMWhenTappedBlock)block;
- (void)whenDoubleTapped:(JMWhenTappedBlock)block;
- (void)whenTwoFingerTapped:(JMWhenTappedBlock)block;
- (void)whenTouchedDown:(JMWhenTappedBlock)block;
- (void)whenTouchedUp:(JMWhenTappedBlock)block;


#pragma mark - 常用属性

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize  size;

@end
