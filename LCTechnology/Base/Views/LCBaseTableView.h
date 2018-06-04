//
//  LCBaseTableView.h
//  LCTechnology
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@interface LCBaseTableView : UITableView<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

/** 空数据背景图竖直方向偏移 */
@property(nonatomic,assign)CGFloat verticalOffset;

/** 空数据提示信息 */
@property (nonatomic,copy) NSString *emptyTitle;

@property (nonatomic, getter=isLoading) BOOL loading;

@property (nonatomic,copy) void (^tapViewBlock)(void);

@end
