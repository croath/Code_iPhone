//
//  AppDelegate.m
//  Code4iPhone
//
//  Created by croath on 13-5-7.
//  Copyright (c) 2013年 Douban Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuItemButton.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
  [self loadHomePage];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)loadHomePage
{
  self.tabBarController = [[DouTabBarController alloc] init];
  self.tabBarController.view.backgroundColor = [UIColor blackColor];
  self.tabBarController.delegate = self;
  MenuItemButton *showingButton =
  [[MenuItemButton alloc] initWithTitle:@"1"];
  MenuItemButton *cinemaButton =
  [[MenuItemButton alloc] initWithTitle:@"2"];
  MenuItemButton *movieListButton =
  [[MenuItemButton alloc] initWithTitle:@"3"];
  [UIGloble drawLineInView:self.tabBarController.tabBar
                     frame:CGRectMake(0, 0, self.tabBarController.tabBar.frame.size.width, 1)
           backgroundColor:[UIColor grayColor]
                imageNamed:nil];
  
  [self.tabBarController.tabBar setItems:[NSArray arrayWithObjects:
                                          showingButton,
                                          cinemaButton,
                                          movieListButton,
                                          nil]];
  UIViewController *c = [[UIViewController alloc] init];
  c.view.backgroundColor = [UIColor redColor];
  YNavigationController *iSeeNav = [[YNavigationController alloc] initWithRootViewController:c];
  [self.tabBarController setViewControllers:[NSArray arrayWithObjects:
                                             iSeeNav,
                                             nil]];
  self.window.backgroundColor = [UIColor blackColor];
  [self.window insertSubview:self.tabBarController.view atIndex:0];
}

@end
