//
//  YBarButtonItem.m
//  DoubanMovie
//
//  Created by YANG HONGBO on 2012-8-8.
//  Copyright (c) 2012年 douban. All rights reserved.
//

#import "YBarButtonItem.h"

@implementation YBarButtonItem
@synthesize image = _image;

- (id)initWithImage:(UIImage *)image target:(id<NSObject>)target action:(SEL)action
{
  self = [self init];
  if (self) {
    self.image = image;
    _target = target;
    _action = action;
  }
  return self;
}

- (void)dealloc
{
  self.image = nil;
}
@end
