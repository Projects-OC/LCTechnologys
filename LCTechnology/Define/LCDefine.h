//
//  LCDefine.h
//  LCTechnology
//
//  Created by mf on 2018/3/13.
//  Copyright © 2018年 lc. All rights reserved.
//

#ifndef LCDefine_h
#define LCDefine_h

#define LCFont(size) [UIFont systemFontOfSize:size]
#define LCBoldFont(size) [UIFont boldSystemFontOfSize:size]

#define LCColor(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define LCColorRGB(R, G, B) LCColor(R, G, B, 1.0)

// iPhone X
#define LCIPhoneX                   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define LCStatusBarHeight           (LCIPhoneX ? 44.f : 20.f)
#define LCNavigationBarHeight        44.f
#define LCStatusBarAndNavigationBarHeight  (LCIPhoneX ? 88.f : 64.f)
#define LCTabbarHeight               (LCIPhoneX ? (49.f+34.f) : 49.f)
#define LCTabbarSafeBottomMargin     (LCIPhoneX ? 34.f : 0.f)
#define LCViewSafeAreInsets(view)     ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})

#define LCAPPDELEGATE (((AppDelegate*)([UIApplication sharedApplication].delegate)))

#ifdef DEBUG
#define LCLog(FORMAT, ...) fprintf(stderr,"%s:[Line %d]\t%s\n",[[NSString stringWithUTF8String:__PRETTY_FUNCTION__] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define LCLog(...)
#endif

#define LCShowLoading(msg) [LCLoadingBox showLoadingBoxWithMessage:msg];
#define LCShowPrompt(msg) [LCPromptBox showPromptBoxWithMessage:msg];
#define LCHideLoading [LCLoadingBox hideLoadingBox];

#endif /* LCDefine_h */
