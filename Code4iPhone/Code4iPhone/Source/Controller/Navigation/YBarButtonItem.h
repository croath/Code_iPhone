//
//  YBarButtonItem.h
//  DoubanMovie
//
//  Created by YANG HONGBO on 2012-8-8.
//  Copyright (c) 2012年 douban. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YBarButtonItem : NSObject
{
  id _target;
  SEL _action;
}

- (id)initWithImage:(UIImage *)image target:(id<NSObject>)target action:(SEL)action;

@property (nonatomic, strong, readwrite) UIImage * image;

@end
