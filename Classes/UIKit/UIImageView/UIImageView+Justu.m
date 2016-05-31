//
//  UIImageView+Justu.m
//  CategoryDemo
//
//  Created by zhubo on 15/12/2.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import "UIImageView+Justu.h"

@implementation UIImageView (Justu)

#pragma mark - 画水印

- (void)setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect
{
    if ([UIDevice currentDevice].systemVersion.floatValue >= 4.0) {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    }
    [image drawInRect:self.bounds];
    [mark drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = newImage;
}

- (void)setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font
{
    if ([UIDevice currentDevice].systemVersion.floatValue < 4.0) {
        return;
    }
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    [image drawInRect:self.bounds];
    [color set];
    [markString drawAtPoint:point withAttributes:@{NSFontAttributeName:font}];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = newImage;
}

@end
