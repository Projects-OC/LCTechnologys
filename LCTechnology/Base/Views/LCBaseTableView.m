//
//  LCBaseTableView.m
//  LCTechnology
//
//  Created by mf on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCBaseTableView.h"

@implementation LCBaseTableView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self config];
    }
    return self;
}

-(void)config{
    _emptyTitle = @"暂无数据";
    self.delaysContentTouches = NO;
    self.canCancelContentTouches = YES;
    self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    self.loading = YES;
    self.emptyDataSetSource = self;
    self.emptyDataSetDelegate = self;
    
    
    @weakify(self)
    LCAPPDELEGATE.networkStatusBlock = ^(YYReachabilityStatus networkStatus) {
        @strongify(self)
        if (networkStatus != YYReachabilityStatusNone) {
            self.emptyTitle = LCMessageEmpty;
        }else{
            self.emptyTitle = LCMessageNetworkError;
        }
    };
}

- (void)setLoading:(BOOL)loading{
    if (self.isLoading == loading) {
        return;
    }
    _loading = loading;
    [self reloadEmptyDataSet];
}

-(BOOL)touchesShouldCancelInContentView:(UIView *)view{
    if ([view isKindOfClass:[UIControl class]]) {
        return YES;
    }
    return [super touchesShouldCancelInContentView:view];
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    return [UIImage imageNamed:@"暂无数据"];
}

- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView{
    if (!self.isLoading) {
        return nil;
    }
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityView startAnimating];
    return activityView;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],
                                 NSForegroundColorAttributeName:[UIColor blackColor]};
    
    return [[NSAttributedString alloc] initWithString:_emptyTitle attributes:attributes];
}

//空数据提示纵向偏移量
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView{
    return _verticalOffset;
}

//是否允许交互
- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView{
    return YES;
}

//是否允许滑动,当加载数据时 不允许滑动
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
    if (self.isLoading) {
        return NO;
    }
    return YES;
}

//空页面点击回调
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    if (_tapViewBlock) {
        _tapViewBlock();
    }
}

@end
