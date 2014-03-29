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

- (void)customizeAppearance {
    UIColor *barTintColor = [UIColor colorWithRed:20 / 255.0f
                                            green:160 / 255.0f
                                             blue:160 / 255.0f
                                            alpha:1.0f];
    [[UISearchBar appearance] setBarTintColor:barTintColor];
    self.window.tintColor = [UIColor colorWithRed:10 / 255.0f
                                            green:80 / 255.0f
                                             blue:80 / 255.0f
                                            alpha:1.0f];
}

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window =
        [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self customizeAppearance];
    
    self.searchViewController =
        [[SearchViewController alloc] initWithNibName:@"SearchViewController"
                                               bundle:nil];
    self.window.rootViewController = self.searchViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
