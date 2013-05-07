//
//  BaseTableViewController.m
//  DoubanMovie
//
//  Created by YANG HONGBO on 2012-8-9.
//  Copyright (c) 2012年 douban. All rights reserved.
//

#import "BaseTableViewController.h"
#import "DouTabBarController.h"

@interface BaseTableViewController ()
@property (nonatomic, assign, readwrite) UITableViewStyle style;
@end

@implementation BaseTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super init];
  if (self) {
    //self.isOldViewController = NO;
    self.needTabbar = YES;
    self.style = style;
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view.
  UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.style];
  tableView.backgroundView = nil;
  self.tableView = tableView;
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.view addSubview:self.tableView];
  
  self.tableView.autoresizingMask = ~UIViewAutoresizingNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return nil;
}


- (void)viewDidUnload
{
  [super viewDidUnload];
  self.tableView = nil;
}

- (void)didReceiveMemoryWarning
{
  self.tableView = nil;
}

@end
