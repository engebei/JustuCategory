//
//  UITextField+Justu.h
//  CategoryDemo
//
//  Created by zhubo on 15/12/18.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^EditEndBlock)(NSString *text);

@interface UITextField (Justu)

#pragma mark - 限制输入长度

/**
 *  使用时只要调用此方法，加上一个长度(int)，就可以实现了字数限制, block是编辑结束后的厚点
 *
 *  @param length
 *  @param block
 */
- (void)limitTextLength:(int)length block:(EditEndBlock)block;

@end
