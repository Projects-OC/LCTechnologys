//
//  LCBaseNavigationController.m
//  LCTechnology
//
//  Created by mf on 2018/4/11.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCBaseNavigationController.h"

@interface LCBaseNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation LCBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationBar.translucent = YES;
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor blueColor];
    bar.tintColor = [UIColor whiteColor];
    bar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                NSFontAttributeName:LCFont(18)};
    
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                   NSFontAttributeName:LCFont(15)}
                        forState:UIControlStateNormal];
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        self.interactivePopGestureRecognizer.delegate = self;
//        self.delegate = self;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [viewController.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"icon_return"]];
    [viewController.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"icon_return"]];
    [viewController.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated{
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

// 允许同时响应多个手势
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    return YES;
//}


@end
