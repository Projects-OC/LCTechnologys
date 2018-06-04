

#import <UIKit/UIKit.h>
#import "LCHudBox.h"

@interface LCPromptBox : LCHudBox

/**
 提醒框

 @param message 提示信息
 */
+ (void)showPromptBoxWithMessage:(NSString *)message;

@end
