//
//  NSDictionary+Justu.m
//  CategoryDemo
//
//  Created by zhubo on 15/12/25.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import "NSDictionary+Justu.h"

@implementation NSDictionary (Justu)

- (NSString *)JSONString{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"fail to get JSON from dictionary: %@, error: %@", self, error);
#endif
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


#pragma mark - get/set

- (id)genericValueForKey:(id)key type:(Class)type {
    if(!key)
        return nil;
    id ret = [self objectForKey:key];
    if([ret isKindOfClass:type])
        return ret;
    return nil;
}

- (NSNumber*)numberValueForKey:(id)key {
    return (NSNumber*)[self genericValueForKey:key type:[NSNumber class]];
}

- (NSDictionary*)dictionaryValueForKey:(id)key {
    return (NSDictionary*)[self genericValueForKey:key type:[NSDictionary class]];
}

- (NSArray*)arrayValueForKey:(id)key {
    return (NSArray*)[self genericValueForKey:key type:[NSArray class]];
}

- (NSString*)stringValueForKey:(id)key {
    return (NSString*)[self genericValueForKey:key type:[NSString class]];
}

- (int)intValueForKey:(id)key {
    return [[self numberValueForKey:key] intValue];
}

- (double)doubleValueForKey:(id)key {
    return [[self numberValueForKey:key] doubleValue];
}

- (long long)longlongValueForKey:(id)key {
    return [[self numberValueForKey:key] longLongValue];
}


- (BOOL)safeSetValue:(id)value forKey:(id)key {
    if (!value || !key)
    {
        return NO;
    }
    NSMutableDictionary *mdic = (NSMutableDictionary*)self;
    [mdic setObject:value forKey:key];
    return YES;
}

#pragma mark - URL与字典互转
/**
 *  @brief  将url参数转换成NSDictionary
 *
 *  @param query url参数
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)dictionaryWithURLQuery:(NSString *)query
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSArray *parameters = [query componentsSeparatedByString:@"&"];
    for(NSString *parameter in parameters) {
        NSArray *contents = [parameter componentsSeparatedByString:@"="];
        if([contents count] == 2) {
            NSString *key = [contents objectAtIndex:0];
            NSString *value = [contents objectAtIndex:1];
            value = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            if (key && value) {
                [dict setObject:value forKey:key];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}
/**
 *  @brief  将NSDictionary转换成url 参数字符串
 *
 *  @return url 参数字符串
 */
- (NSString *)URLQueryString
{
    NSMutableString *string = [NSMutableString string];
    for (NSString *key in [self allKeys]) {
        if ([string length]) {
            [string appendString:@"&"];
        }
        CFStringRef escaped = CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)[[self objectForKey:key] description],
                                                                      NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                      kCFStringEncodingUTF8);
        [string appendFormat:@"%@=%@", key, escaped];
        CFRelease(escaped);
    }
    return string;
}




@end
