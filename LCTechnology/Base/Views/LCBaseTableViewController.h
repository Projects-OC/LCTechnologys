//
//  LCBaseTableViewController.h
//  LCTechnology
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCBaseViewController.h"
#import "LCBaseTableView.h"

@interface LCBaseTableViewController : LCBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)LCBaseTableView *plainTableView;
@property(nonatomic,weak)LCBaseTableView *groupTableView;

/**
 下拉刷新
 */
- (void)tableViewHeaderRefreshBlock:(void (^)(void))headerRefreshBlock;

/**
 上拉加载
 */
- (void)tableViewFooterRefreshBlock:(void (^)(void))footerRefreshBlock;

/**
 开始下拉刷新
 */
- (void)tableViewHeaderBeginRefreshing;

/**
 停止刷新
 */
- (void)tableViewEndRefreshing;

@end
