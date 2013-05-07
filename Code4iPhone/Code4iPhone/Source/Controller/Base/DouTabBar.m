//
//  DouTabBar.m
//
//  Created by hejia on 1/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DouTabBar.h"

const CGFloat kAnimateImageWidth   = 58.0f;
const CGFloat kAnimateImageHeight  = 32.0f;
const float   kAniamteDuration     = 0.2f;

@interface DouTabBar(Private)

- (void)buttonAction:(id)sender;

@end


@implementation DouTabBar

@synthesize items = _items;
@synthesize tabStyle = _tabStyle;
@synthesize separteWidth = _separteWidth;
@synthesize animateView = _animateView;

- (id)initWithFrame:(CGRect)frame {
  
  self = [self initWithFrame:frame tabStyle:DouTabBarStyleWithAnimate dividerImageName:nil];
  return self;
}

- (id)initWithFrame:(CGRect)frame tabStyle:(DouTabBarStyle)tabStyle {
  self = [self initWithFrame:frame tabStyle:tabStyle dividerImageName:nil];
  if (self) {
  }
  return self;
}

- (id)initWithFrame:(CGRect)frame tabStyle:(DouTabBarStyle)tabStyle dividerImageName:(NSString *)name{
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor clearColor];//[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar"]];
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    if (nil == name) {
      name = @"tabbar_divline";
    }
    _dividerImageName = [name copy];
  }
  return self;
}


- (void)setItems:(NSArray *)items {
	if (_buttonItems) {
		for(UIButton *v in _buttonItems) {
			[v removeFromSuperview];
		}
		_buttonItems = nil;
	}
	if (_hiddenItems) {
		_hiddenItems = nil;
	}
  
	if (_items) {
		_items = nil;
	}
	_items = [[NSArray alloc] initWithArray:items];
	
	NSInteger count = [items count];
	CGSize tabSize = self.bounds.size;
	CGFloat itemWidth = tabSize.width;
	if (count > 5) {
		_buttonItems = [[NSArray alloc] initWithArray:[items subarrayWithRange:NSMakeRange(0, 5)]];
		_hiddenItems = [[NSArray alloc] initWithArray:[items subarrayWithRange:NSMakeRange(5, count-5)]];
    itemWidth -= (4*_separteWidth);
		itemWidth /= 5;
	}
	else {
		_buttonItems = [[NSArray alloc] initWithArray:items];
    itemWidth -= ((count - 1)*_separteWidth);
		itemWidth /= count;
	}
	
  UIImage * image = [UIImage imageNamed:_dividerImageName];
  UIImage * stretchableImage = [image stretchableImageWithLeftCapWidth:0 topCapHeight:image.size.height];
	for (int i = 0; i < [_buttonItems count]; i++) {
		UIButton *control = [_buttonItems objectAtIndex:i]; 
    CGRect divLineFrame;
    CGRect controleFrame;
    if (_tabStyle == DouTabBarStyleWithAnimate || _tabStyle == DouTabBarStyleWithPadding) {
      controleFrame = CGRectMake(i * (itemWidth+1), 0, itemWidth, tabSize.height);
      if (i < [_buttonItems count] - 1) {
        divLineFrame.origin.x = controleFrame.origin.x + controleFrame.size.width;
        divLineFrame.origin.y = controleFrame.origin.y;
        divLineFrame.size.width = 1;
        divLineFrame.size.height = controleFrame.size.height;
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:divLineFrame];
        imageView.image = stretchableImage;
        [self addSubview:imageView];
      }
    }
    else {
      controleFrame = CGRectMake(i * (itemWidth + _separteWidth),
                                 0,
                                 itemWidth,
                                 tabSize.height);
    }
   
    control.frame = controleFrame;
		control.backgroundColor  =[UIColor clearColor];
		control.autoresizingMask = UIViewAutoresizingFlexibleWidth|
                                   UIViewAutoresizingFlexibleHeight |
                                   UIViewAutoresizingFlexibleLeftMargin |
                                   UIViewAutoresizingFlexibleRightMargin;
		[control addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
		[self addSubview:control];
	}
//	UIButton *firstControl = [_buttonItems objectAtIndex:0];
//	CGFloat originX = firstControl.frame.origin.x+(firstControl.frame.size.width-kAnimateImageWidth)/2;
//	CGFloat originY = tabSize.height - 24;
	
/*  if (_tabStyle == DouTabBarStyleWithAnimate) {
    _animateView = [[UIImageView alloc] initWithFrame:
                    CGRectMake(originX, 0, kAnimateImageWidth, kAnimateImageHeight)];
    _animateView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    _animateView.image = [UIImage imageNamed:@"selected_background.png"];
    [self insertSubview:_animateView atIndex:0];

  }
 */
}

- (void)setSelectedItem:(UIButton *)control {
	[self buttonAction:control];
}

/*
-(void) drawBackGroundColor
{
	CGContextRef ctx=UIGraphicsGetCurrentContext();
	
	size_t num_locations = 3;
	CGFloat locations[3] = { 0.0, 0.5, 1.0};
	CGFloat components[12] = 
	{ 
		0, 0, 0, 1.0,
		0, 0, 0, 1.0,
		0, 0, 0, 1.0 
	};
	CGGradientRef myGradient;
	CGColorSpaceRef myColorspace = CGColorSpaceCreateDeviceRGB();
	myGradient = CGGradientCreateWithColorComponents (myColorspace, components, locations, num_locations);
	CGPoint myStartPoint, myEndPoint;
	myStartPoint.x = kTabBarHeight;
	myStartPoint.y = 0.0;
	myEndPoint.x = kTabBarHeight;
	myEndPoint.y = kTabBarHeight;
	CGContextDrawLinearGradient(ctx,myGradient,myStartPoint, myEndPoint, 0);
	CGGradientRelease(myGradient);
	CGColorSpaceRelease(myColorspace);	
}

- (void)drawRect:(CGRect)rect
{
  if (_tabStyle == DouTabBarStyleWithAnimate) {
    [self drawBackGroundColor];
  }
}
 */

- (void)dealloc {
}

#pragma mark -

- (void)buttonAction:(id)sender {
	UIButton *control = (UIButton *)sender;
	if(_selectedItem != control) {
		_selectedItem.selected = NO;
		control.selected = YES;
		_selectedItem = control;
    /*if (_tabStyle == DouTabBarStyleWithAnimate) {
      [UIView beginAnimations:@"animateSelection" context:_animateView];
      [UIView setAnimationDuration:kAniamteDuration];
      CGRect animateRect = _animateView.frame;
      animateRect.origin.x = control.frame.origin.x+(control.frame.size.width-kAnimateImageWidth)/2;
      _animateView.frame = animateRect;
      
      [UIView commitAnimations];
    }*/
	}
	
	if (_delegate && [_delegate respondsToSelector:@selector(douTabBar:didSelectItem:)]) {
    [_delegate performSelector:@selector(douTabBar:didSelectItem:) 
                    withObject:self
                    withObject:control];
	}
}

#pragma mark -

@end
