//
//  ViewController.m
//  iOS-监测网络变化
//
//  Created by 王德康 on 15/6/14.
//  Copyright (c) 2015年 王德康. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"
#import "NetWorkTools.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *LabelView;
@property (nonatomic, strong) Reachability *reachability;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 监听网络状态发生改变的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateChange) name:kReachabilityChangedNotification object:nil];
    
    // 获得Reachability对象
    self.reachability = [Reachability reachabilityForInternetConnection];
    
    // 开始监控网络
    [self.reachability startNotifier];
    
    [self checkNetworkState];
}


- (void)networkStateChange
{
    NSLog(@"网络状态改变了");
    [self checkNetworkState];
}

/**
 *  监测网络状态
 */
- (void)checkNetworkState
{
    if ([NetWorkTools isEnableWIFI]) {
        NSLog(@"WIFI环境");
        self.LabelView.text = @"WIFI环境";
    } else if ([NetWorkTools isEnable3G]) {
        NSLog(@"手机自带网络");
        self.LabelView.text = @"手机自带网络";
    } else {
        NSLog(@"没有网络");
        self.LabelView.text = @"没有网络";
    }
}

- (void)dealloc
{
    // 停止监控
    [self.reachability stopNotifier];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
