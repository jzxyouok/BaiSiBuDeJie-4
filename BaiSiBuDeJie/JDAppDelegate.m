//
//  JDAppDelegate.m
//  BaiSiBuDeJie
//
//  Created by Jiang on 16/7/18.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import "JDAppDelegate.h"
#import "JDTabBarController.h"
#import "JDADPageController.h"

@implementation JDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:JDScreenBounds];
//    JDTabBarController *tabBarVc = [[JDTabBarController alloc] init];
    JDADPageController *adVc = [[JDADPageController alloc] init];
    window.rootViewController = adVc;
    [window makeKeyAndVisible];
    self.window = window;
    return YES;
}

@end
