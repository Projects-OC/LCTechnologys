//
//  AppDelegate+Controller.m
//  LCTechnology
//
//  Created by Mac on 2018/5/9.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "AppDelegate+Controller.h"
#import "LCViewController.h"

@implementation AppDelegate (Controller)

+ (void)rootViewControllerForWindow:(UIWindow *)window{
    LCViewController *vc = [[LCViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    window.rootViewController = nav;
    window.backgroundColor = [UIColor whiteColor];
    [window makeKeyAndVisible];
}

@end

