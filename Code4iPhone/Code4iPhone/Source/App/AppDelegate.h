//
//  AppDelegate.h
//  Code4iPhone
//
//  Created by croath on 13-5-7.
//  Copyright (c) 2013年 Douban Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DouTabBarController.h"
#define APP_DELEGATE  ((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate, DouTabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) DouTabBarController *tabBarController;

@end
