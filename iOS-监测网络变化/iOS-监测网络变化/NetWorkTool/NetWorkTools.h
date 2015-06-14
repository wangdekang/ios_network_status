//
//  NetWorkTools.h
//  iOS-监测网络变化
//
//  Created by 王德康 on 15/6/14.
//  Copyright (c) 2015年 王德康. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkTools : NSObject
/**
 *  是否WIFI
 */
+ (BOOL)isEnableWIFI;

/**
 *  是否3G
 */
+ (BOOL)isEnable3G;
@end
