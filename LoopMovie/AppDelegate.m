//
//  AppDelegate.m
//  LoopMovie
//
//  Created by 小林 博久 on 2013/12/11.
//  Copyright (c) 2013年 Hirohisa Kobayasi. All rights reserved.
//

#import "AppDelegate.h"
#import "PlayerViewController.h"


@interface AppDelegate ()

@property (strong, nonatomic) PlayerViewController *playerViewController;

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
 didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[UIApplication sharedApplication].idleTimerDisabled = YES;

    self.playerViewController = [[PlayerViewController alloc] init];
	self.window.rootViewController = self.playerViewController;

	[self.window makeKeyAndVisible];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    //    [self.coverViewController pausePlayer];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    //    [self.coverViewController restartPlayer];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
