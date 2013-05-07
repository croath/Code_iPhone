//
//  CustomPullToRefreshDelegate.h
//  DoubanMovie
//
//  Created by saai on 12-12-20.
//  Copyright (c) 2012年 douban. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CustomPullToRefreshController;
@protocol CustomPullToRefreshDelegate <NSObject>
- (void)customPullToRefreshShouldLoadMore : (CustomPullToRefreshController *) customPtr;
@end
