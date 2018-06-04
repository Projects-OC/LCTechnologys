//
//  AppDelegate.m
//  LCTechnology
//
//  Created by wff on 2018/3/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Controller.h"

@interface AppDelegate ()

@property(nonatomic,strong)YYReachability *reachability;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[YTKNetworkConfig sharedConfig] setBaseUrl:LCBaseUrl];
    [AppDelegate rootView];
    [self config];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)config{
    //监听网络状态
    @weakify(self)
    self.reachability.notifyBlock = ^(YYReachability *reachability){
        [weak_self networkChanged:reachability];
    };
}

-(void)networkChanged:(YYReachability*)reachability{
    YYReachabilityStatus status = reachability.status;
    switch (status) {
        case YYReachabilityStatusNone:{
            NSString *errStr = @"请打开设置,允许此应用使用网络";
            LCLog(@"网络服务已断开");
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:errStr
                                                                                     message:@""
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
            [alertController addAction:[UIAlertAction actionWithTitle:@"打开网络" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ( [[UIApplication sharedApplication] canOpenURL: url] ) {
                    NSURL*url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                    [[UIApplication sharedApplication] openURL:url];
                }
            }]];
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
        }
            break;
        case YYReachabilityStatusWiFi:{
            LCLog(@"WiFi");
        }
            break;
        case YYReachabilityStatusWWAN:{
            LCLog(@"移动网络");
            YYReachabilityWWANStatus wwStatus = reachability.wwanStatus;
            switch (wwStatus) {
                case YYReachabilityWWANStatus2G:
                    LCLog(@"2G网络");
                    break;
                case YYReachabilityWWANStatus3G:
                    LCLog(@"3G网络");
                    break;
                case YYReachabilityWWANStatus4G:
                    LCLog(@"4G网络");
                    break;
                case YYReachabilityWWANStatusNone:
                    LCLog(@"无网络");
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
    if (_networkStatusBlock) {
        _networkStatusBlock(status);
    }
}

@end
