//
//  UIImageView+LC.m
//  LCTechnology
//
//  Created by mf on 2018/4/24.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "UIImageView+LC.h"

@implementation UIImageView (LC)

-(void)basicAnimation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(-M_PI/2 , 0, 0, 1.0)];
    animation.duration = 0.2;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    [self.layer addAnimation:animation forKey:@"animation"];
}
-(void)removeAnimation{
    [self.layer removeAnimationForKey:@"animation"];
}


@end
