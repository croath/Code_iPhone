//
//  DouTabBarController.m
//
//  Created by hejia on 1/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//



#import "DouTabBarController.h"

@interface DouTabBarController ()
@property (nonatomic, assign, readwrite) BOOL isShowingSearchView;
@property (nonatomic, assign, readwrite) BOOL isShowingSearchContent;
@end

@implementation DouTabBarController

@synthesize tabBar = _tabBar;
@synthesize viewControllers = _viewControllers;
@synthesize isBarHidden = _isBarHidden;

- (id)init {
	if ((self = [super init])) {
		CGSize mainSize = [UIScreen mainScreen].applicationFrame.size;
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    frame.origin = CGPointZero;
		_layoutContainerView = [[UIView alloc] initWithFrame:frame];
    //        _layoutContainerView.backgroundColor = [UIColor blueColor];
		_layoutContainerView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
		
    frame = _layoutContainerView.bounds;
    frame.size.height -= kTabBarHeight ;
		_transitionView = [[UIView alloc] initWithFrame:frame];
    //        _transitionView.backgroundColor = [UIColor redColor];
		_transitionView.clipsToBounds = YES;
		[_transitionView setNeedsLayout];
		_transitionView.autoresizingMask = ~UIViewAutoresizingNone;
    _transitionView.autoresizesSubviews = YES;
		
		_tabBar = [[DouTabBar alloc] initWithFrame:
               CGRectMake(0, mainSize.height-kTabBarHeight, mainSize.width, kTabBarHeight)];
		_tabBar.delegate = self;
		
		[_layoutContainerView addSubview:_transitionView];
		[_layoutContainerView addSubview:_tabBar];
    [self.view addSubview:_layoutContainerView];
		_isBarHidden = NO;
    
    [self buildSearchView];
	}
	return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.


- (void)buildSearchView
{
  if (nil == _searchContentView) {
    CGRect frame = _layoutContainerView.bounds;
    frame.size.height -= 20;
    _searchContentView = [[UIView alloc] initWithFrame:frame];
    _searchContentView.autoresizesSubviews = YES;
    _searchContentView.autoresizingMask = ~UIViewAutoresizingNone;
    [_layoutContainerView addSubview:_searchContentView];
    _searchContentView.backgroundColor = [UIColor clearColor];
    _searchContentView.hidden = YES;
  }
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  if (_selectedViewController) {
    [_selectedViewController view];
  }
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
}

- (void)setViewControllers:(NSArray *)viewControllers
{
	if (_viewControllers) {
		for (UIViewController *vctr in _viewControllers) {
			[vctr.view removeFromSuperview];
      [vctr removeFromParentViewController];
		}
		_viewControllers = nil;
	}
	_viewControllers = [[NSMutableArray alloc] initWithArray:viewControllers];
	//moreviewcontroller
	NSInteger viewControllerCount = [viewControllers count];
	NSInteger tabBarItemCount = [_tabBar.items count];
	if (viewControllerCount > tabBarItemCount)
	{
		NSMutableArray *items = [[NSMutableArray alloc] initWithArray:_tabBar.items];
		for (int i = 0; i < viewControllerCount-tabBarItemCount; i++) {
			UIButton *aButton = [[UIButton alloc] init];
			[items addObject:aButton];
		}
		[_tabBar setItems:items];
	}
	else if(viewControllerCount < tabBarItemCount)
	{
		for (int i = 0; i < tabBarItemCount - viewControllerCount; i++) {
			UIViewController *viewCtr = [[UIViewController alloc] init];
			[_viewControllers addObject:viewCtr];
      [self addChildViewController:viewCtr];
		}
	}
  else
  {
    for (UIViewController *vctr in _viewControllers) {
      [self addChildViewController:vctr];
		}
  }
	
	self.selectedIndex = 0;
}
#pragma mark - iOS6 Rotation
-(BOOL)shouldAutorotate
{
  return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - Rotation
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  // Return YES for supported orientations.
	return [_selectedViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration {
	[_selectedViewController willRotateToInterfaceOrientation:toInterfaceOrientation
                                                   duration:duration];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
                                         duration:(NSTimeInterval)duration {
	[_selectedViewController willAnimateRotationToInterfaceOrientation:interfaceOrientation
                                                            duration:duration];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	[_selectedViewController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
  
  _tabBar = nil;
  _transitionView = nil;
  _layoutContainerView = nil;
  _viewControllers = nil;
  
  self.isShowingSearchContent = NO;
  [_searchNavigationController.view removeFromSuperview];
}


- (void)dealloc {
  
  _tabBar = nil;
  _transitionView = nil;
  _layoutContainerView = nil;
  _viewControllers = nil;
  [_searchNavigationController.view removeFromSuperview];
  self.isShowingSearchContent = NO;
}

- (void)setSelectedIndex:(NSUInteger)value
{
  
  if ([_selectedViewController isKindOfClass:[UINavigationController class]]) {
    [((UINavigationController *)_selectedViewController) popToRootViewControllerAnimated:YES];
  }
  
	if (value == self.selectedIndex) {
    if (_selectedViewController.modalViewController) {
      [_selectedViewController.modalViewController dismissModalViewControllerAnimated:YES];
    }
		return;
	}
  
  if ([_selectedViewController isKindOfClass:[YNavigationController class]]) {
//    [AppEventLogger event:UMENGEVENT_SELECT_LOCATION
//                    label:[NSString stringWithFormat:@"%d",
//                           [[(YNavigationController*)_selectedViewController viewControllers] count]]];
  }
  
  if (_selectedViewController.modalViewController) {
    [_selectedViewController.modalViewController dismissModalViewControllerAnimated:NO];
  }
  
	[_selectedViewController.view removeFromSuperview];
	
	_selectedViewController = [_viewControllers objectAtIndex:value];
  CGRect frame = _transitionView.frame;
  frame.origin = CGPointZero;
	_selectedViewController.view.frame = frame;
  _selectedViewController.view.autoresizingMask = ~UIViewAutoresizingNone;
  
	[_transitionView addSubview:_selectedViewController.view];
	
  [_transitionView setNeedsDisplay];
	UIButton *control = [_tabBar.items objectAtIndex:value];
	if (control != _tabBar.selectedItem) {
		_tabBar.selectedItem = control;
	}
  
  if (_delegate && [_delegate respondsToSelector:@selector(douTabBarController:didSelectViewController:)]) {
    [_delegate performSelector:@selector(douTabBarController:didSelectViewController:)
                    withObject:self
                    withObject:_selectedViewController];
  }
}

- (NSUInteger)selectedIndex
{
	NSUInteger ret = [_viewControllers indexOfObject:_selectedViewController];
	return ret;
}

- (void)setTabBarHidden:(BOOL)hidden
{
  if (hidden == _isBarHidden) {
    return;
  }
  [UIView animateWithDuration:0.3 animations:^{
    _isBarHidden = hidden;
    //	_tabBar.hidden = hidden;
    CGRect rect = _tabBar.frame;
    if (_isBarHidden) {
      rect.origin.y += kTabBarHeight;
    }
    else {
      rect.origin.y -= kTabBarHeight;
    }
    _tabBar.frame = rect;
    
  }completion:^(BOOL finished) {
    
  }];
  //放在动画里实现，会导致在切换变换时会，视图会跳跃
  //但是不放在动画里实现，会导致，切换回来的时候底下留黑
  //同时，这里的设计还会影响到search bar的动画显示
  CGRect frame = _layoutContainerView.bounds;
  if (NO == hidden) {
    frame.size.height -= kTabBarHeight;
  }
  _transitionView.frame = frame;
  if (_isShowingSearchContent) {
    _searchContentView.frame = frame;
  }
}
 
@end
