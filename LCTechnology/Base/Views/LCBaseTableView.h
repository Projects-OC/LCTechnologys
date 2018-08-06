//
//  LCBaseTableView.h
//  LCTechnology
//
//  Created by mf on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import <TPKeyboardAvoiding/TPKeyboardAvoidingTableView.h>

@interface LCBaseTableView : TPKeyboardAvoidingTableView<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

/**空数据背景图竖直方向偏移*/
@property(nonatomic,assign)CGFloat verticalOffset;

/**空数据提示信息*/
@property (nonatomic,copy) NSString * _Nullable emptyTitle;

@property (nonatomic, getter=isLoading) BOOL loading;

@property (nonatomic,copy) void (^ _Nullable tapViewBlock)(void);

/**
 注册cell
 */
- (void)registerClassCells:(NSArray <Class>*_Nullable)cells;

/**
 注册header footer
 */
- (void)registerClassHeaderFooters:(NSArray <Class>*_Nullable)headerFooters;

@end
