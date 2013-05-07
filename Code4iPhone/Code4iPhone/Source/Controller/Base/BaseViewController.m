//
//  BaseViewController.m
//  DoubanMovie
//
//  Created by YANG HONGBO on 2012-8-9.
//  Copyright (c) 2012年 douban. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
@implementation BaseViewController
@synthesize titleLabel = _titleLabel;

- (id)init
{
  self = [super init];
  if (self) {
    //self.isOldViewController = NO;
    self.needTabbar = YES;
    self.customBackButton = NO;
  }
  return self;
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  //由于默认似乎view背景是透明的，而在显示图片ViewController时需要window设成黑色，
	// Do any additional setup after loading the view.
  if (NO == self.customBackButton) {
    [self loadNavigationBackButton];
  }
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  _titleLabel = nil;
}

- (void)dealloc
{
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [APP_DELEGATE.tabBarController setTabBarHidden:!self.needTabbar];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  [_networkOperation cancel];
}

- (void)loadNavigationBackButton
{
  if ([self.navigationController.viewControllers objectAtIndex:0] != self) {
    UIButton *leftButton = [UIGloble newActionButtonWithFrame:CGRectMake(0, 0, 45, 44) title:@"➔" tappedImageName:nil unTappedImageName:nil titleColor:[UIColor colorWithWhite:0.9 alpha:1] tappedColor:[UIColor blackColor] font:[UIFont systemFontOfSize:26.0f] target:self action:@selector(backUp:)];
    CGAffineTransform transform = leftButton.transform;
    transform = CGAffineTransformRotate(transform, M_PI);
    leftButton.transform = transform;
    leftButton.accessibilityLabel = @"back";
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = item;
    leftButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5); //为了和原来的button位置对齐
  }
}

- (void)popToParent
{
  [self goBack:nil];
}

- (void)goBack:(id)sender
{
  [_networkOperation cancel];
  _networkOperation = nil;
  [self.navigationController popViewControllerAnimated:YES];
}

- (void)backUp:(id)sender
{
  [_networkOperation cancel];
  _networkOperation = nil;
  [self.navigationController popViewControllerAnimated:YES];
}


- (UILabel *)titleLabel
{
  if (nil == _titleLabel) {
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    _titleLabel.textAlignment = UITextAlignmentCenter;
    _titleLabel.lineBreakMode = UILineBreakModeMiddleTruncation;
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize:16];
  }
  return _titleLabel;
}

- (void)setTitle:(NSString *)title
{
  [super setTitle:title];
  UILabel * titleLabel = (UILabel *)self.navigationItem.titleView;
  if (nil == titleLabel || (![titleLabel isKindOfClass:[UILabel class]])) {
    self.navigationItem.titleView = self.titleLabel;
  }
  
  self.titleLabel.text = title;
  [self.titleLabel sizeToFit];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//nserror 需要改成统一的应用内部的domain和code实现，去掉重复的解析与处理
- (BOOL)checkResponseError:(NSError *)error
{
  /*
  NSString * json = [error.userInfo objectForKey:NSLocalizedRecoverySuggestionErrorKey];
  if (json) {
    id object = AFJSONDecode([json dataUsingEncoding:NSUTF8StringEncoding], nil);
    if (IS_INSTANCE_OF(object, NSDictionary)) {
      return [self checkResponseDictionary:object];
    }
  }
   */
  return FALSE;
}
- (BOOL)checkResponseDictionary:(NSDictionary *)dictionary
{
  /*
  //NSString * noteMessage = nil;
  NSNumber * errorCode = nil;
  if (YIS_INSTANCE_OF(dictionary, NSDictionary)) {
    id value = nil;
    value = [dictionary objectForKey:@"code"];
    if (YIS_INSTANCE_OF(value, NSNumber)) {
      errorCode = value;
    }
    //noteMessage = [dictionary objectForKey:@"note"];
    
    if (MOVIE_TICKET_ERROR_APP_VERSION_IS_NOT_SUPPORTED == [errorCode integerValue] && !self.baseAlertViewIsShown) {
      if (nil == _alertViewDelegate) {
        _alertViewDelegate = [[BaseAlertViewDelegate alloc] init];
        _alertViewDelegate.ownerViewController = self;
      }
      UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:nil
                                                           message:TEXT_ERROR_MESSAGE_UPDATE_NEW_VERSION
                                                          delegate:_alertViewDelegate
                                                 cancelButtonTitle:TEXT_CANCEL_UPDATE
                                                 otherButtonTitles:TEXT_PERFORM_UPDATE, nil];
      [alertView show];
      self.baseAlertViewIsShown = YES;
      RELEASE_AND_NIL(alertView);
      return TRUE;
    }
  }
   */
  return FALSE;
}

@end
