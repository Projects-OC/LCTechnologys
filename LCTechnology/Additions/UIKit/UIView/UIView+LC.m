//
//  UIView+LC.m
//  LCTechnology
//
//  Created by mf on 2018/6/29.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "UIView+LC.h"

@implementation UIView (LC)

+ (void)usingSpringAnimationView:(UIView *)animationView {
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:12
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         animationView.transform = CGAffineTransformMakeScale(2, 2);
                     }
                     completion:^(BOOL finished) {
                         animationView.transform = CGAffineTransformIdentity;
                     }];
}

@end
