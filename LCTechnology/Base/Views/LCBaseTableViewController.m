//
//  LCBaseTableViewController.m
//  LCTechnology
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCBaseTableViewController.h"
#import "MJRefresh.h"
#import "LCBaseRequest.h"
#import "LCBaseRequestModel.h"

@interface LCBaseTableViewController ()

@end

@implementation LCBaseTableViewController

- (NSMutableArray *)datas{
    if (!_datas) {
        _datas = [[NSMutableArray alloc] init];
    }
    return _datas;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)pageModelData:(NSMutableArray *)modelData
            baseModel:(LCBaseRequestModel *)baseModel{
    [self pageLoading];
    if (modelData) {
        if (self.page == 1) {
            [self.datas removeAllObjects];
        }
        [self.datas addObjectsFromArray:modelData];
        [self.plainTableView reloadData];
    }
    if (baseModel.total_page == 0 || baseModel.total_page == self.page) {
        self.plainTableView.mj_footer.state = MJRefreshStateNoMoreData;
    }
    [self tableViewEndRefreshing];
}

- (void)pageLoading{
    if (self.page == 1) {
        self.plainTableView.loading = NO;
    }
}

- (void)pageFailrueWithMessage:(NSString *)message{
    [self pageLoading];
    [self tableViewEndRefreshing];
    LCShowPrompt(message)
}

- (void)tableViewHeaderRefreshBlock:(void (^)(void))headerRefreshBlock{
    if (_plainTableView) {
        @weakify(self)
        _plainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weak_self.page = 1;
            headerRefreshBlock();
        }];
    }
    if (_groupTableView) {
        @weakify(self)
        _groupTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weak_self.page = 1;
            headerRefreshBlock();
        }];
    }
}

- (void)tableViewFooterRefreshBlock:(void (^)(void))footerRefreshBlock{
    if (_plainTableView) {
        @weakify(self)
        _plainTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            weak_self.page ++;
            footerRefreshBlock();
        }];
    }
    if (_groupTableView) {
        @weakify(self)
        _groupTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            weak_self.page ++;
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
