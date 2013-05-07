//
//  DouTabBarController.h
//
//  Created by hejia on 1/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DouTabBar.h"
#import "YNavigationController.h"

@class SearchViewController;
@class DouTabBarController;
@protocol DouTabBarControllerDelegate <NSObject>
@optional

- (void)douTabBarController:(DouTabBarController *)tabBarController
    didSelectViewController:(UIViewController *)viewController;

@end


@interface DouTabBarController : UIViewController <DouTabBarDelegate> {
	DouTabBar *_tabBar;
	
	UIView *_layoutContainerView;
	UIView *_transitionView;
  UIView * _searchContentView;
	
	NSMutableArray	*_viewControllers;
	
	BOOL _isBarHidden;

  YNavigationController * _searchNavigationController;
  SearchViewController * _searchViewController;
}

- (void)setTabBarHidden:(BOOL)hidden;

@property (nonatomic, strong)DouTabBar *tabBar;
@property (nonatomic, copy)NSArray *viewControllers;

@property (nonatomic, unsafe_unretained) UIViewController *selectedViewController;
@property (nonatomic) NSUInteger selectedIndex;
@property (nonatomic, unsafe_unretained) id<DouTabBarControllerDelegate> delegate;
@property (nonatomic, unsafe_unretained) BOOL isBarHidden;

@end
