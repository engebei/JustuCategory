//
//  UIBarButtonItem+Justu.h
//  CategoryDemo
//
//  Created by zhubo on 15/12/24.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^UIBarButtonItemActionHandler)();
@interface UIBarButtonItem (Justu)

#pragma mark - 添加Block支持
- (id)initWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style actionHandler:(UIBarButtonItemActionHandler)actionHandler;
- (id)initWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style actionHandler:(UIBarButtonItemActionHandler)actionHandler NS_AVAILABLE_IOS(5_0);
- (id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style actionHandler:(UIBarButtonItemActionHandler)actionHandler;
- (id)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem actionHandler:(UIBarButtonItemActionHandler)actionHandler;

- (void)setActionHandler:(UIBarButtonItemActionHandler)actionHandler;

@end


#pragma mark - Badge
@interface UIBarButtonItem (Badge)

@property (strong, atomic) UILabel *badge;

/**
 *  badge 数量
 */
@property (nonatomic) NSString *badgeValue;
/**
 *  badge 背景颜色
 */
@property (nonatomic) UIColor *badgeBGColor;
/**
 *  badge 文字颜色
 */
@property (nonatomic) UIColor *badgeTextColor;
/**
 *  badge 字体大小
 */
@property (nonatomic) UIFont *badgeFont;
/**
 *  badge 间距
 */
@property (nonatomic) CGFloat badgePadding;
/**
 *  badge 最小尺寸
 */
@property (nonatomic) CGFloat badgeMinSize;
/**
 *  badgeOriginX
 */
@property (nonatomic) CGFloat badgeOriginX;
/**
 *  badgeOriginY
 */
@property (nonatomic) CGFloat badgeOriginY;
/**
 *  移除 badge
 */
@property BOOL shouldHideBadgeAtZero;
/**
 *  是否显示动画
 */
@property BOOL shouldAnimateBadge;

@end

#pragma mark - 副标题
@interface UIBarButtonItem (Subtitle)
- (UIBarButtonItem *)initWithImage:(UIImage *)image subtitle:(NSString *)subtitle textColor:(UIColor *)textColor target:(id)target action:(SEL)action;
@end


#pragma mark - 透明度Alpha
@interface UIBarButtonItem (Alpha)

@property (nonatomic,assign) CGFloat alpha;

@end