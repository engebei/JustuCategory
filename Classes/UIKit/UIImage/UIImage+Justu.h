//
//  UIImage+Justu.h
//  CategoryDemo
//
//  Created by zhubo on 15/11/30.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Justu)

#pragma mark - 加载图片(无缓存)
/**
 *  根据main bundel中的文件名读取图片
 *
 *  @param name 图片名称
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)imageWithFileName:(NSString *)name;

#pragma mark - 裁剪图片

/**
 *  裁剪图片
 *
 *  @param image   需要裁剪的图片
 *  @param newSize 裁剪后的尺寸
 *
 *  @return 裁剪后的图片
 */
+ (UIImage *)imageWithCutCurrentImage:(UIImage *)image newSize:(CGSize)newSize;
- (UIImage *)imageWithCutNewSize:(CGSize)newSize;

#pragma mark - 保存图片至沙盒、从沙盒读取图片

/**
 *  保存图片至沙盒
 *
 *  @param saveImage 需要保存的图片
 *  @param name      需要保存的图片名称
 *
 *  @return 是否保存成功
 */
+ (BOOL)imageSaveWithImage:(UIImage *)saveImage name:(NSString *)name;
- (BOOL)imageSaveWithImageName:(NSString *)name;

/**
 *  从沙盒读取图片
 *
 *  @param name 需要读取的图片名称
 *
 *  @return 读取到的图片
 */
+ (NSData *)imageReadWithDataName:(NSString *)name;
+ (UIImage *)imageReadWithImageName:(NSString *)name;

#pragma mark - Color
/**
 *  根据颜色生产图片
 *
 *  @param color 颜色
 *
 *  @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  获取灰度图
 *
 *  @param image 原图片
 *
 *  @return 灰度图
 */
+ (UIImage *)imageGetGrayImageWithIamge:(UIImage *)image;

#pragma mark - 获取网络图片尺寸
/**
 *  获取网络图片尺寸
 *
 *  @param imageURL url
 *
 *  @return 图片尺寸
 */
+ (CGSize)getImageSizeWithURL:(id)imageURL;









































@end
