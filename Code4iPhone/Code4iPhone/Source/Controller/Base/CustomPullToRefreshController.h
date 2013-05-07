//
//  CustomPullToRefreshController.h
//  DoubanMovie
//
//  Created by saai on 12-12-20.
//  Copyright (c) 2012年 douban. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomPullToRefreshDelegate.h"
#import "MSPullToRefreshController.h"
@interface CustomPullToRefreshController : NSObject<MSPullToRefreshDelegate>

@property (nonatomic, strong) MSPullToRefreshController *ptrc;
@property (nonatomic, strong) UIImageView *loadViewBottom;
@property (nonatomic, strong) UILabel *loadLabelBottom;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, unsafe_unretained) id <CustomPullToRefreshDelegate> delegate;

- (id)initWithScrollView:(UIScrollView *)scrollView delegate:(id<CustomPullToRefreshDelegate>)delegate;
- (void)endRefresh;
- (void)setBottomPullHidden:(BOOL) hidden;
@end
