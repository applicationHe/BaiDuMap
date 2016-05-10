//
//  baseNavigationController.m
//  baiduMapDemo
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 何万牡. All rights reserved.
//

#import "baseNavigationController.h"

@interface baseNavigationController ()

@end

@implementation baseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary * attributes = @{
                                  NSFontAttributeName:[UIFont boldSystemFontOfSize:18],
                                  NSForegroundColorAttributeName:[UIColor whiteColor],
                                  };
    self.navigationBar.titleTextAttributes = attributes;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
