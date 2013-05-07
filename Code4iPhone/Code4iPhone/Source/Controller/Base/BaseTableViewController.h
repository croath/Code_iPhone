//
//  BaseTableViewController.h
//  DoubanMovie
//
//  Created by YANG HONGBO on 2012-8-9.
//  Copyright (c) 2012年 douban. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController < UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView * tableView;

- (id)initWithStyle:(UITableViewStyle)style;

@end
