//
//  AppDelegate.h
//  LCTechnology
//
//  Created by wff on 2018/3/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/*网络状态实时监控*/
@property(nonatomic,copy) void (^networkStatusBlock) (YYReachabilityStatus networkStatus);

@end

