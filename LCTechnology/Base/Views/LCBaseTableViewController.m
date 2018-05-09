//
//  LCBaseTableViewController.m
//  LCTechnology
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCBaseTableViewController.h"
#import "MJRefresh.h"

@interface LCBaseTableViewController ()

@end

@implementation LCBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)tableViewHeaderRefreshBlock:(void (^)(void))headerRefreshBlock{
    if (_plainTableView) {
        _plainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            headerRefreshBlock();
        }];
    }
    if (_groupTableView) {
        _groupTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            headerRefreshBlock();
        }];
    }
}

- (void)tableViewFooterRefreshBlock:(void (^)(void))footerRefreshBlock{
    if (_plainTableView) {
        _plainTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            footerRefreshBlock();
        }];
    }
    if (_groupTableView) {
        _groupTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            footerRefreshBlock();
        }];
    }
}

- (void)tableViewHeaderBeginRefreshing{
    if (_plainTableView) {
        [_plainTableView.mj_header beginRefreshing];
    }
    if (_groupTableView) {
        [_groupTableView.mj_header beginRefreshing];
    }
}

- (void)tableViewEndRefreshing{
    if (_plainTableView) {
        if (_plainTableView.mj_header.refreshing) {
            [_plainTableView.mj_header endRefreshing];
        }
        if (_plainTableView.mj_footer.refreshing) {
            [_plainTableView.mj_footer endRefreshing];
        }
    }
    if (_groupTableView) {
        if (_groupTableView.mj_header.refreshing) {
            [_groupTableView.mj_header endRefreshing];
        }
        if (_groupTableView.mj_footer.refreshing) {
            [_groupTableView.mj_footer endRefreshing];
        }
    }
}

-(LCBaseTableView *)plainTableView{
    if (!_plainTableView) {
        LCBaseTableView *tableView = [[LCBaseTableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectZero];
        tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        tableView.separatorInset = UIEdgeInsetsZero;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        _plainTableView = tableView;
    }
    return _plainTableView;
}

-(LCBaseTableView *)groupTableView{
    if (!_groupTableView) {
        LCBaseTableView *groupView = [[LCBaseTableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        groupView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectZero];
        groupView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        //groupView.contentInset = UIEdgeInsetsMake(-34, 0, 0, 0);
        groupView.separatorInset = UIEdgeInsetsZero;
        groupView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        groupView.delegate = self;
        groupView.dataSource = self;
        [self.view addSubview:groupView];
        _groupTableView = groupView;
    }
    return _groupTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [self.view endEditing:YES];
}

@end
