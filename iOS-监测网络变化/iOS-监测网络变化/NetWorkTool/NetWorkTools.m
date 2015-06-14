//
//  NetWorkTools.m
//  iOS-监测网络变化
//
//  Created by 王德康 on 15/6/14.
//  Copyright (c) 2015年 王德康. All rights reserved.
//

#import "NetWorkTools.h"
#import "Reachability.h"

@implementation NetWorkTools
// 是否WIFI
+ (BOOL)isEnableWIFI {
    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable);
}

// 是否3G
+ (BOOL)isEnable3G {
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable);
}
@end
