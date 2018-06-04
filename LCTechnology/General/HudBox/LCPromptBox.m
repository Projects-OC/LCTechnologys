
#import "LCPromptBox.h"

@implementation LCPromptBox

+ (LCPromptBox *)shared {
	static dispatch_once_t once = 0;
	static LCPromptBox *progressHUD;
    dispatch_once(&once, ^{ progressHUD = [[LCPromptBox alloc] init]; });
    return progressHUD;
}

- (id)init {
    self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
    id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate respondsToSelector:@selector(window)])
        self.window = [delegate performSelector:@selector(window)];
    else
        self.window = [[UIApplication sharedApplication] keyWindow];
    
    self.background = nil; self.hud = nil;  self.image = nil; self.statusLabel = nil;self.arrowImage = nil;
    self.alpha = 0;
    
    return self;
}

+ (void)showPromptBoxWithMessage:(NSString *)message {
    if (!message) {
        message = @"网络错误";
    }
    LCHideLoading
	[self shared].interaction = YES;
	[[self shared] textHudMake:message];
}

- (void)textHudMake:(NSString *)status{
    [self hudDestroy];
    
    if (self.statusLabel == nil) {
        self.statusLabel = [self createLabel];
        self.statusLabel.text = status;
    }
    
    CGSize textSize = [self.statusLabel.text widthWithFont:self.statusLabel.font constrainedToSize:CGSizeMake(200, 300)];
    textSize.width += 10;
    CGSize hudSize = [self hudSize:TEXT_LOADING_HUD_DEFAULT_SIZE textSize:textSize];
    
    [self hudCreate:hudSize];
    
    self.statusLabel.frame = CGRectMake(0, 0, textSize.width , textSize.height);
    self.statusLabel.center = CGPointMake(self.hud.frame.size.width / 2, self.hud.frame.size.height / 2);
    
    if (self.statusLabel.superview == nil)
        [self.hud addSubview:self.statusLabel];
    
    [self hudShow];
    
    [NSThread detachNewThreadSelector:@selector(timedHide) toTarget:self withObject:nil];
}

/**
 *  计算hud的宽高
 *
 *  @param hudDefaultSize 默认大小，当文本宽度太短时 默认长度
 *  @param textSize       文本size
 */
-(CGSize)hudSize:(CGSize)hudDefaultSize
      textSize:(CGSize)textSize{
    
    //如果文本宽度小于默认的hud宽度 等于hud的默认宽度
    if (textSize.width >= hudDefaultSize.width) {
        
        hudDefaultSize.width = textSize.width + 20;
    }
    

    CGSize hudSize = CGSizeMake(hudDefaultSize.width, textSize.height + 20);
    
    return hudSize;
}

#pragma marrk - 3秒后隐藏
- (void)timedHide {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(HUD_TIMED_DELAY * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hudHide];
    });
}


@end
