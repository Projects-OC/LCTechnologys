//
//  LCViewController.m
//  LCTechnology
//
//  Created by Mac on 2018/5/9.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCViewController.h"
#import "LCLoginRequest.h"

@interface LCViewController ()

@end

@implementation LCViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)loginRequeset{
    LCLoginRequest *request = [LCLoginRequest loginWithUserName:@"userName" passWord:@"passWord"];
    [request requestWithSuccess:^(LCBaseRequestModel *baseModel, id responseJSONObject) {
        
    } failure:^(LCBaseRequestModel *baseModel) {
        
    }];
}


@end
