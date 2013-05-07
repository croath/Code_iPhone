//
//  CustomPullToRefreshController.m
//  DoubanMovie
//
//  Created by saai on 12-12-20.
//  Copyright (c) 2012年 douban. All rights reserved.
//

#import "CustomPullToRefreshController.h"
#define LOAD_MORE_HEIGHT 30.0f
@interface CustomPullToRefreshController()
@property (nonatomic, assign) BOOL allowButtomPull;
@end

@implementation CustomPullToRefreshController

- (id)initWithScrollView:(UIScrollView *)scrollView delegate:(id<CustomPullToRefreshDelegate>)delegate
{
  self = [super init];
  if (self) {
    _delegate = delegate;
    self.scrollView = scrollView;
    _allowButtomPull = YES;
    [_scrollView addObserver:self forKeyPath:@"contentSize" options:0 context:NULL];
    
    _ptrc = [[MSPullToRefreshController alloc]initWithScrollView:_scrollView delegate:self];
    UIImageView *loadView= [[UIImageView alloc]
                            initWithFrame:CGRectMake(0.0f,
                                                     _scrollView.frame.size.height,
                                                     _scrollView.frame.size.width,
                                                     LOAD_MORE_HEIGHT)];
    NSArray *images = [[NSArray alloc] initWithObjects:
                       [UIImage imageNamed:@"loadingMore1.png"],
                       [UIImage imageNamed:@"loadingMore2.png"],
                       [UIImage imageNamed:@"loadingMore3.png"],nil];
    loadView.animationImages = images;
    loadView.contentMode = UIViewContentModeCenter;
    loadView.animationDuration = 1;
    self.loadViewBottom = loadView;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f,
                                                               0.0f,
                                                               _scrollView.frame.size.width,
                                                               LOAD_MORE_HEIGHT)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"loading more...";
    label.backgroundColor = [UIColor clearColor];
    self.loadLabelBottom = label;
    
    [_loadViewBottom addSubview:_loadLabelBottom];
    [_scrollView addSubview:_loadViewBottom];
  }
  return self;
}

- (void) observeValueForKeyPath:(NSString *)keyPath
                       ofObject:(id)object
                         change:(NSDictionary *)change
                        context:(void *)context
{
  NSLog(@"%@",NSStringFromCGSize(_scrollView.contentSize));
  CGFloat contentSizeArea = _scrollView.contentSize.width*_scrollView.contentSize.height;
  CGFloat frameArea = _scrollView.frame.size.width*_scrollView.frame.size.height;
  CGSize adjustedContentSize = contentSizeArea < frameArea ? _scrollView.frame.size : _scrollView.contentSize;
  _loadViewBottom.frame = CGRectMake(0, adjustedContentSize.height, _scrollView.frame.size.width, LOAD_MORE_HEIGHT);
}
- (void)dealloc
{
  [_scrollView removeObserver:self forKeyPath:@"contentSize"];
}
- (void)endRefresh
{
  [_ptrc finishRefreshingDirection:MSRefreshDirectionBottom animated:YES];
  [_loadViewBottom stopAnimating];
  _loadLabelBottom.hidden = NO;
}
- (void)setBottomPullHidden:(BOOL) hidden
{
  self.allowButtomPull = !hidden;
  if (self.allowButtomPull) {
    _loadLabelBottom.text = @"loading more...";
  }
  else{
    _loadLabelBottom.text = @"no more...";
  }
}
#pragma mark - MSPullToRefreshController

- (BOOL)pullToRefreshController:(MSPullToRefreshController *)controller
          canRefreshInDirection:(MSRefreshDirection)direction
{
  return (direction == MSRefreshDirectionBottom )&& (self.allowButtomPull);
}
- (CGFloat)pullToRefreshController:(MSPullToRefreshController *)controller
      refreshableInsetForDirection:(MSRefreshDirection)direction
{
  return LOAD_MORE_HEIGHT;
}

- (CGFloat)pullToRefreshController:(MSPullToRefreshController *)controller
       refreshingInsetForDirection:(MSRefreshDirection)direction
{
  return LOAD_MORE_HEIGHT;
}

- (void)pullToRefreshController:(MSPullToRefreshController *)controller
      canEngageRefreshDirection:(MSRefreshDirection)direction
{
  //_loadLabelBottom.text = @"放开加载更多";
}

- (void)pullToRefreshController:(MSPullToRefreshController *)controller
   didDisengageRefreshDirection:(MSRefreshDirection)direction
{
  //_loadLabelBottom.text = TEXT_LOADING_MORE;
}

- (void)pullToRefreshController:(MSPullToRefreshController *)controller
      didEngageRefreshDirection:(MSRefreshDirection)direction
{
  // _loadLabelBottom.text = TEXT_LOADING_MORE;
  _loadLabelBottom.hidden = YES;
  [_loadViewBottom startAnimating];
  [_delegate customPullToRefreshShouldLoadMore:self];
}


@end
