//
//  AppDelegate.m
//  baiduMapDemo
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 何万牡. All rights reserved.
//

#import "AppDelegate.h"

#import "HMainViewController.h"
#import "baseNavigationController.h"

#import <BaiduMapAPI_Base/BMKMapManager.h>

@interface AppDelegate ()
{
    BMKMapManager * _manager;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window =[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    HMainViewController * mainVC =[[HMainViewController alloc] init];
    baseNavigationController * baseNC = [[baseNavigationController alloc] initWithRootViewController:mainVC];
    
    _window.rootViewController = baseNC;
    
    _manager = [[BMKMapManager alloc] init];
    BOOL ret = [_manager start:@"fsOgEvTTD6GmYar6pvPEVQT29g0MCycX" generalDelegate:nil];
    if (ret) {
        NSLog(@"百度地图可使用");
    }else
    {
        NSLog(@"百度地图不可以使用");
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
