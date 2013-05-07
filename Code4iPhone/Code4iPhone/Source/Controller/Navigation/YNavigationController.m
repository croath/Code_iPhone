//
//  YNavigationController.m
//  DoubanMovie
//
//  Created by YANG HONGBO on 2012-8-9.
//  Copyright (c) 2012年 douban. All rights reserved.
//

#import "YNavigationController.h"

@interface YNavigationController ()

@end

@implementation YNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view.
  if (nil == _ynavigationBar) {
    _ynavigationBar = [[YNavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [self setValue:_ynavigationBar forKey:@"navigationBar"];
  }
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

-(BOOL)shouldAutorotate
{
  return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)dealloc
{
}

@end
