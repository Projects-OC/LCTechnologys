//
//  LCHudBox.m
//  UCZProgressView
//
//  Created by mf on 2018/4/24.
//  Copyright © 2018年 kishikawa katsumi. All rights reserved.
//

#import "LCHudBox.h"
#import "UIImageView+LC.h"

@implementation LCHudBox

- (void)hudDestroy {
    if (self.arrowImage) {
        [self.arrowImage removeAnimation];
        [self.arrowImage removeFromSuperview];
        self.arrowImage = nil;
    }
    [self.statusLabel removeFromSuperview];    self.statusLabel = nil;
    [self.textLabel removeFromSuperview];    self.textLabel = nil;
    [self.image removeFromSuperview];        self.image = nil;
    [self.hud removeFromSuperview];            self.hud = nil;
    [self.background removeFromSuperview];    self.background = nil;
}

- (void)hudCreate:(CGSize)hudSize{
    CGRect screen = [UIScreen mainScreen].bounds;
    if (self.hud == nil){
        CGFloat hudY = self.interaction == YES ? (screen.size.height - hudSize.height) / 2 :(screen.size.height - hudSize.height) / 2 - 64;
        self.hud = [[UIView alloc] initWithFrame:CGRectMake((screen.size.width - hudSize.width) / 2, hudY, hudSize.width, hudSize.height)];
        self.hud.backgroundColor = HUD_BACKGROUND_COLOR;
        //        self.hud.layer.cornerRadius = 3;
        //        self.hud.layer.masksToBounds = YES;
    }
    
    if (self.hud.superview == nil){
        if (self.interaction == NO){
            CGRect frame = CGRectMake(self.window.frame.origin.x, 64, self.window.frame.size.width, self.window.frame.size.height);
            self.background = [[UIView alloc] initWithFrame:frame];
            self.background.backgroundColor = HUD_WINDOW_COLOR;
            [self.window addSubview:self.background];
            [self.background addSubview:self.hud];
        }
        else [self.window addSubview:self.hud];
    }
}

-(UILabel*)createLabel{
    UILabel *label = [[UILabel alloc] init];
    label.font = HUD_STATUS_FONT;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    label.numberOfLines = 0;
    return label;
}

#pragma marrk - 显示hud
- (void)hudShow {
    if (self.alpha == 0) {
        self.alpha = 1;
        
        self.hud.alpha = 0;
        self.hud.transform = CGAffineTransformScale(self.hud.transform, 1.4, 1.4);
        
        NSUInteger options = UIViewAnimationOptionAllowUserInteraction | UIViewAnimationCurveEaseOut;
        [UIView animateWithDuration:0.15 delay:0 options:options animations:^{
            self.hud.transform = CGAffineTransformScale(self.hud.transform, 1/1.4, 1/1.4);
            self.hud.alpha = 1;
        } completion:nil];
    }
}

- (void)hudHide {
    if (self.alpha == 1) {
        NSUInteger options = UIViewAnimationOptionAllowUserInteraction | UIViewAnimationCurveEaseIn;
        [UIView animateWithDuration:0.0 delay:0 options:options animations:^{
            self.hud.transform = CGAffineTransformScale(self.hud.transform, 0.7, 0.7);
            self.hud.alpha = 0;
        }
                         completion:^(BOOL finished) {
                             [self hudDestroy];
                             self.alpha = 0;
                         }];
    }
}

@end
