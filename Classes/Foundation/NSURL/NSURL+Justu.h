//
//  NSURL+Justu.h
//  CategoryDemo
//
//  Created by zhubo on 15/12/28.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Justu)

/**
 *  @brief  url参数转字典
 *
 *  @return 参数转字典结果
 */
- (NSDictionary *)parameters;
/**
 *  @brief  根据参数名 取参数值
 *
 *  @param parameterKey 参数名的key
 *
 *  @return 参数值
 */
- (NSString *)valueForParameter:(NSString *)parameterKey;

@end
