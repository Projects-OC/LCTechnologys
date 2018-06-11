//
//  LCHudBox.h
//  UCZProgressView
//
//  Created by Mac on 2018/4/24.
//  Copyright © 2018年 kishikawa katsumi. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HUD_STATUS_FONT            [UIFont systemFontOfSize:16]
#define HUD_STATUS_COLOR        [UIColor blackColor]
#define HUD_TEXT_COLOR          [UIColor blackColor]
#define TEXT_LOADING_HUD_DEFAULT_SIZE        CGSizeMake([[UIScreen mainScreen]bounds].size.width / 2.6, 50)
#define HUD_BACKGROUND_COLOR    [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8]
#define HUD_WINDOW_COLOR        [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0]
#define HUD_IMAGE_SUCCESS        [UIImage imageNamed:@"APProgressHUD.bundle/progresshud-success.png"]
#define HUD_IMAGE_ERROR            [UIImage imageNamed:@"APProgressHUD.bundle/progresshud-error.png"]
#define HUD_TIMED_DELAY 3.0f

#define IMAGEVIEW_W_H   25

@interface LCHudBox : UIView

/** 是否交互 */
@property (nonatomic, assign) BOOL interaction;

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UIView *background;

@property (nonatomic, retain) UIView *hud;
/**
 *  网络请求时或者提示文本的label
 */
@property (nonatomic, retain) UILabel *statusLabel;

/**
 *  转圈圈的imageView
 */
@property (nonatomic, strong) UIImageView *arrowImage;

/**
 *  显示成功与否的imageView
 */
@property (nonatomic, retain) UIImageView *image;

/**
 *  显示成功与否时的提示文本
 */
@property (nonatomic, retain) UILabel *textLabel;

/**
 *  置空hud
 */
- (void)hudDestroy;

/**
 *  创建label
 *
 *  @return label
 */
-(UILabel*)createLabel;

/**
 *  计算文本的宽高
 *
 *  @param textLB 传需要显示的label
 *
 *  @return textSize
 */
-(CGSize)textSize:(UILabel*)textLB;

/**
 *  创建hud
 *
 *  @param hudSize hudsize
 */
- (void)hudCreate:(CGSize)hudSize;

/**
 *  hud显示
 */
- (void)hudShow;

/**
 *  隐藏hud
 */
- (void)hudHide;


@end
