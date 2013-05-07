//
//  YNavigationBar.m
//  DoubanMovie
//
//  Created by YANG HONGBO on 2012-8-8.
//  Copyright (c) 2012年 douban. All rights reserved.
//

#import "YNavigationBar.h"

@implementation YNavigationBar

//@synthesize leftBarButtonItem = _leftBarButtonItem;
//@synthesize rightBarButtonItem = _rightBarButtonItem;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code
    self.backgroundColor = [UIColor blackColor];
    UIImage * image = [UIImage imageNamed:@"navbar"];
    _backgroundImage = [image stretchableImageWithLeftCapWidth:6 topCapHeight:image.size.height];
  }
  return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  // Drawing code
  [_backgroundImage drawInRect:self.bounds];
}

- (void)dealloc
{
  //  self.leftBarButtonItem = nil;
  //  self.rightBarButtonItem = nil;
}

@end
