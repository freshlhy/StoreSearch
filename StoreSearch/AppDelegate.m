//
//  AppDelegate.m
//  StoreSearch
//
//  Created by freshlhy on 3/27/14.
//  Copyright (c) 2014 freshlhy. All rights reserved.
//

#import "AppDelegate.h"
#import "SearchViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window =
        [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.searchViewController =
        [[SearchViewController alloc] initWithNibName:@"SearchViewController"
                                               bundle:nil];
    self.window.rootViewController = self.searchViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
