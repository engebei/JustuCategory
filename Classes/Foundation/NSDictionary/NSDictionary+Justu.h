//
//  NSDictionary+Justu.h
//  CategoryDemo
//
//  Created by zhubo on 15/12/25.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Justu)

/**
 *  @brief NSDictionary转换成JSON字符串
 *
 *  @return  JSON字符串
 */
-(NSString *)JSONString;

/**
 *  JSON字符串转字典
 *
 *  @param jsonString 字符串
 *
 *  @return 字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;


#pragma mark - GetVaues(类型检查)

- (id)genericValueForKey:(id)key type:(Class)type;
- (NSNumber*)numberValueForKey:(id)key;
- (NSDictionary*)dictionaryValueForKey:(id)key;
- (NSArray*)arrayValueForKey:(id)key;
- (NSString*)stringValueForKey:(id)key;
- (int)intValueForKey:(id)key;
- (double)doubleValueForKey:(id)key;
- (long long)longlongValueForKey:(id)key;


#pragma mark - SetValues(类型检查)

- (BOOL)safeSetValue:(id)value forKey:(id)key;


#pragma mark - URL与字典互转
/**
 *  @brief  将url参数转换成NSDictionary
 *
 *  @param query url参数
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)dictionaryWithURLQuery:(NSString *)query;
/**
 *  @brief  将NSDictionary转换成url 参数字符串
 *
 *  @return url 参数字符串
 */
- (NSString *)URLQueryString;

@end
