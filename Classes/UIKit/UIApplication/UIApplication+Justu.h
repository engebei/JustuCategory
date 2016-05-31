//
//  UIApplication+Justu.h
//  CategoryDemo
//
//  Created by zhubo on 15/12/2.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Justu)

/// "Documents" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *documentsURL;
@property (nonatomic, readonly) NSString *documentsPath;

/// "Caches" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *cachesURL;
@property (nonatomic, readonly) NSString *cachesPath;

/// "Library" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *libraryURL;
@property (nonatomic, readonly) NSString *libraryPath;

/// Application's Bundle Name (show in SpringBoard).
@property (nonatomic, readonly) NSString *appBundleName;

/// Application's Bundle ID.  e.g. "com.ibireme.MyApp"
@property (nonatomic, readonly) NSString *appBundleID;

/// Application's Version.  e.g. "1.2.0"
@property (nonatomic, readonly) NSString *appVersion;

/// Application's Build number. e.g. "123"
@property (nonatomic, readonly) NSString *appBuildVersion;

/// Whether this app is being debugged (debugger attached).
@property (nonatomic, readonly) BOOL isBeingDebugged;

/// Current thread real memory used in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t memoryUsage;

/// Current thread CPU usage, 1.0 means 100%. (-1 when error occurs)
@property (nonatomic, readonly) float cpuUsage;

//以上来自YYCategories  https://github.com/ibireme/YYCategories

#pragma mark - 状态栏HUD

/**
 *  显示状态栏HUD
 */
- (void)beganNetworkActivity;

/**
 *  隐藏状态栏HUD
 */
- (void)endedNetworkActivity;

@end
