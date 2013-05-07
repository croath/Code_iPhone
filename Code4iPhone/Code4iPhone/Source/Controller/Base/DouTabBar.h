//
//  DouTabBar.h
//  
//
//  Created by hejia on 1/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DouTabBar;

typedef enum _DouTabBarStyle {
  DouTabBarStyleWithAnimate = 0,
  DouTabBarStyleCustom,
  DouTabBarStyleWithPadding
}DouTabBarStyle;

@protocol DouTabBarDelegate<NSObject>

@optional

-(void)douTabBar:(DouTabBar *)tabBar didSelectItem:(UIButton *)item;

@end


@interface DouTabBar : UIView {
	NSArray *_items;
	NSArray *_buttonItems;
	NSArray *_hiddenItems;
	
	UIImageView *_animateView;
  DouTabBarStyle  _tabStyle;
  CGFloat   _separteWidth;
  
  NSString * _dividerImageName;
}

@property (nonatomic,copy) NSArray *items;
@property (nonatomic,unsafe_unretained) id<DouTabBarDelegate> delegate;
@property (nonatomic,unsafe_unretained) UIButton *selectedItem;
@property (nonatomic,unsafe_unretained) DouTabBarStyle tabStyle;
@property (nonatomic,unsafe_unretained) CGFloat separteWidth;
@property (nonatomic,strong) UIImageView *animateView;

- (void)setItems:(NSArray *)items;
- (id)initWithFrame:(CGRect)frame tabStyle:(DouTabBarStyle)tabStyle;
- (id)initWithFrame:(CGRect)frame tabStyle:(DouTabBarStyle)tabStyle dividerImageName:(NSString *)name;

@end
