//
//  CTLoadingHUD.m
//  app
//
//  Created by gnself.macMiniself.liao on 16/5/31.
//  Copyright © 2016年 KZ. All rights reserved.
//

#import "LCLoadingBox.h"
#import "UIImageView+LC.h"

@interface LCLoadingBox   ()

@end
@implementation LCLoadingBox

+ (LCLoadingBox *)shared {
    static dispatch_once_t once = 0;
    static LCLoadingBox *progressHUD;
    dispatch_once(&once, ^{ progressHUD = [[LCLoadingBox alloc] init]; });
    return progressHUD;
}

- (id)init {
    self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
    id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate respondsToSelector:@selector(window)])
        self.window = [delegate performSelector:@selector(window)];
    else
        self.window = [[UIApplication sharedApplication] keyWindow];
    
    self.background = nil; self.hud = nil; self.arrowImage = nil; self.statusLabel = nil;self.textLabel = nil;
    self.alpha = 0;
    return self;
}

+(void)showLoadingBoxWithMessage:(NSString *)message{
    [self shared].interaction = NO;
    [[self shared] loadingHudMake:message];
}

-(void)loadingHudMake:(NSString*)status{
    [self hudDestroy];
    
    if (self.arrowImage == nil){
        self.arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, IMAGEVIEW_W_H, IMAGEVIEW_W_H)];
        self.arrowImage.image = [UIImage imageNamed:@"dropdown_refresh_ios"];
        [self.arrowImage basicAnimation];
    }
    
    if (self.statusLabel == nil) {
        self.statusLabel = [self createLabel];
        self.statusLabel.text = status;
        self.statusLabel.textAlignment = NSTextAlignmentLeft;
        self.statusLabel.numberOfLines = 2;
    }
    
    CGSize textSize = [self.statusLabel.text widthWithFont:self.statusLabel.font constrainedToSize:CGSizeMake(200, 300)];
    textSize.width += 10;

    CGFloat hudWidth = self.arrowImage.frame.origin.x  + self.arrowImage.frame.size.width + 10 + textSize.width + 20;
    CGFloat hudHeight = self.statusLabel.frame.size.height + 20;
    
    if (hudWidth < TEXT_LOADING_HUD_DEFAULT_SIZE.width) {
        hudWidth = TEXT_LOADING_HUD_DEFAULT_SIZE.width;
    }
    
    if (hudHeight < TEXT_LOADING_HUD_DEFAULT_SIZE.height) {
        hudHeight = TEXT_LOADING_HUD_DEFAULT_SIZE.height;
    }
    
    [self hudCreate:CGSizeMake(hudWidth, hudHeight)];
    if (self.arrowImage.superview == nil) [self.hud addSubview:self.arrowImage];
    if (self.statusLabel.superview == nil) [self.hud addSubview:self.statusLabel];
    
    self.statusLabel.frame = CGRectMake(self.arrowImage.frame.size.width + self.arrowImage.frame.origin.x + 10, 0, textSize.width + 10, textSize.height);
    
    CGPoint center = self.statusLabel.center;
    center.y = self.hud.frame.size.height / 2;
    self.statusLabel.center = center;
    
    center = self.arrowImage.center;
    center.y = self.statusLabel.center.y;
    self.arrowImage.center = center;
    
    [self hudShow];
    
}
+ (void)hideLoadingBox{
    [self shared].interaction = YES;
    //dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[self shared] hudHide];
    //});
}


@end
