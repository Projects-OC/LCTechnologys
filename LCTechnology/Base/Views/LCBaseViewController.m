//
//  LCBaseViewController.m
//  LCTechnology
//
//  Created by mf on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCBaseViewController.h"

@interface LCBaseViewController ()

@end

@implementation LCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.page = 1;
}

- (void)setEdgesForExtendedLayout{
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}

- (void)dealloc{
    LCLog(@"dealloc %s",__func__);
}

@end
