//
//  NSUserDefaults+Justu.h
//  CategoryDemo
//
//  Created by zhubo on 15/12/25.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Justu)

+ (NSString *)stringForKey:(NSString *)defaultName;

+ (NSArray *)arrayForKey:(NSString *)defaultName;

+ (NSDictionary *)dictionaryForKey:(NSString *)defaultName;

+ (NSData *)dataForKey:(NSString *)defaultName;

+ (NSArray *)stringArrayForKey:(NSString *)defaultName;

+ (NSInteger)integerForKey:(NSString *)defaultName;

+ (float)floatForKey:(NSString *)defaultName;

+ (double)doubleForKey:(NSString *)defaultName;

+ (BOOL)boolForKey:(NSString *)defaultName;

+ (NSURL *)URLForKey:(NSString *)defaultName;

#pragma mark - 保存

+ (void)setObject:(id)value forKey:(NSString *)defaultName;

#pragma mark - 读取归档(NSKeyedUnarchiver)格式的数据

+ (id)arcObjectForKey:(NSString *)defaultName;

#pragma mark - 保存归档(NSKeyedUnarchiver)格式的数据

+ (void)setArcObject:(id)value forKey:(NSString *)defaultName;

@end
