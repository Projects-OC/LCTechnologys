//
//  LCDefine.h
//  LCTechnology
//
//  Created by mf on 2018/3/13.
//  Copyright © 2018年 lc. All rights reserved.
//

#ifndef LCDefine_h
#define LCDefine_h

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
