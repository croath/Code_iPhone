


#import "UIGloble.h"


@implementation UIGloble

#pragma mark --animation--
+(void) addAnimationMove:(UIView *)tempView delegate:(id) delegate startSelector:(SEL) startSelector stopSelector:(SEL) stopSelector toCenter:(CGPoint) center duraion:(CFTimeInterval) seconds
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:delegate];
	[UIView setAnimationWillStartSelector:startSelector];
	[UIView setAnimationDidStopSelector:stopSelector];
	[UIView setAnimationDuration:seconds];
	tempView.center = center;
	[UIView commitAnimations];
}


+(void) addAnimationScal:(UIView *)tempView  toPoint:(CGPoint)center  lightState:(BOOL) getLightState  delegate:(id) delegate startSelector:(SEL) startSelector stopSelector:(SEL) stopSelector scaleNumber:(float) number duraion:(CFTimeInterval) seconds
{
	tempView.alpha = getLightState? 0 : 1;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:delegate];
	[UIView setAnimationWillStartSelector:startSelector];
	[UIView setAnimationDidStopSelector:stopSelector];
	[UIView setAnimationDuration:seconds];
	tempView.transform = CGAffineTransformMakeScale(number, number);
	tempView.center = center;
	tempView.alpha = getLightState ? 1 : 0;
	[UIView commitAnimations];
}


//从下弹出
+ (void)addAnimationToShow:(UIView *)detailView toPoint:(CGPoint)center delegate:(id) delegate startSelector:(SEL) startSelector stopSelector:(SEL) stopSelector duraion:(CFTimeInterval) seconds
{
	detailView.alpha = 0;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:delegate];
	[UIView setAnimationWillStartSelector:startSelector];
	[UIView setAnimationDidStopSelector:stopSelector];
	[UIView setAnimationDuration:seconds];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	detailView.center = center;
	detailView.alpha = 1;
	[UIView commitAnimations];
}




//退出到下面隐藏
+ (void)addAnimationToFade:(UIView *)detailView toPoint:(CGPoint) center duraion:(CFTimeInterval) seconds
{
	detailView.alpha = 1;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:seconds];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	detailView.center = center;
	detailView.alpha = 0;
	[UIView commitAnimations];
}



+ (void)addAnimationShow:(UIView *)viewToAddAnimation duraion:(CFTimeInterval) seconds
{
  [self addAnimationShow:viewToAddAnimation duraion:seconds alpha:1];
}

+ (void)addAnimationShow:(UIView *)viewToAddAnimation
                 duraion:(CFTimeInterval) seconds
                   alpha:(CGFloat) alpha
{
	viewToAddAnimation.alpha = 0;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:seconds];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	viewToAddAnimation.alpha = alpha;
	[UIView commitAnimations];
}


//浏览模式
+ (void)addAnimationFade:(UIView *)viewToAddAnimation delegate:(id) delegate startSelector:(SEL) startSelector stopSelector:(SEL) stopSelector duraion:(CFTimeInterval) seconds
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:delegate];
	[UIView setAnimationWillStartSelector:startSelector];
	[UIView setAnimationDidStopSelector:stopSelector];
	[UIView setAnimationDuration:seconds];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	viewToAddAnimation.alpha = 0;
	[UIView commitAnimations];
}


//浏览模式
+ (void)addAnimationRotation:(UIView *)viewToAddAnimation delegate:(id) delegate startSelector:(SEL) startSelector stopSelector:(SEL) stopSelector duraion:(CFTimeInterval) seconds
{
	[UIView beginAnimations:@"Rotation" context:nil];
	[UIView setAnimationDelegate:delegate];
	[UIView setAnimationWillStartSelector:startSelector];
	[UIView setAnimationDidStopSelector:stopSelector];
	[UIView setAnimationDuration:seconds];
  CGAffineTransform newTransform = CGAffineTransformMakeRotation(M_PI);
	[viewToAddAnimation setTransform:newTransform];
	[UIView commitAnimations];
}


+ (void)addAnimationShow:(UIView *)viewToAddAnimation delegate:(id) delegate startSelector:(SEL) startSelector stopSelector:(SEL) stopSelector duraion:(CFTimeInterval) seconds;
{
  [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelegate:delegate];
	[UIView setAnimationWillStartSelector:startSelector];
	[UIView setAnimationDidStopSelector:stopSelector];
	[UIView setAnimationDuration:seconds];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	viewToAddAnimation.alpha = 1;
	[UIView commitAnimations];
}



+ (void)addAnimationFade:(UIView *)viewToAddAnimation duraion:(CFTimeInterval) seconds
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:seconds];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	viewToAddAnimation.alpha = 0;
	[UIView commitAnimations];
}


#pragma mark --animation--
+(void) addAnimationFrameInView:(UIView *)tempView delegate:(id) delegate startSelector:(SEL) startSelector stopSelector:(SEL) stopSelector toFrame:(CGRect) frame
{
	[UIView beginAnimations:@"ChangeFrame" context:nil];
	[UIView setAnimationDelegate:delegate];
	[UIView setAnimationWillStartSelector:startSelector];
	[UIView setAnimationDidStopSelector:stopSelector];
	[UIView setAnimationDuration:0.3];
	tempView.frame = frame;
	[UIView commitAnimations];
}

#pragma mark UIImage

+ (UIImage *)imageWithColor:(UIColor *)color {
  CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
  UIGraphicsBeginImageContext(rect.size);
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGContextSetFillColorWithColor(context, [color CGColor]);
  CGContextFillRect(context, rect);
  
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return image;
}





#pragma mark --view--
+(UIButton *)newActionButtonWithFrame:(CGRect)frame title:(NSString *)title  tappedImageName:(NSString *)tappedImageName unTappedImageName:(NSString *)unTappedImageName  titleColor:(UIColor *)titleColor tappedColor:(UIColor *)tappedColor font:(UIFont *)font target:(id)target  action:(SEL)selector
{
	UIButton *button = [[UIButton alloc] initWithFrame:frame];
	button.backgroundColor = [UIColor clearColor];
	if (font)
  {
    button.titleLabel.font = font;
  }
	[button setTitle:title forState:UIControlStateNormal];
	[button setTitleColor:titleColor forState:UIControlStateNormal];
	[button setTitleColor:tappedColor forState:UIControlStateHighlighted];
	//button.titleLabel.shadowColor = [UIColor colorWithRed:0.682 green:0.691 blue:0.749 alpha:0.8];
	//[button.titleLabel setShadowOffset:CGSizeMake(1, 1)];
  
  
	[button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	[button setBackgroundImage:[[UIImage imageNamed:unTappedImageName] stretchableImageWithLeftCapWidth:0 topCapHeight:0] forState:UIControlStateNormal];
	[button setBackgroundImage:[[UIImage imageNamed:tappedImageName] stretchableImageWithLeftCapWidth:0 topCapHeight:0] forState:UIControlStateHighlighted];
	
	return button;
}



+(UIImageView *) newImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName aotuAdaptState:(BOOL) adaptState
{
	UIImageView *imageView = nil;
	UIImage *tempImage = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageName stringByReplacingOccurrencesOfString:@".png" withString:@""] ofType:@"png"]];
  
	if (adaptState == YES)
	{
		imageView = [[UIImageView alloc] initWithFrame:frame];
		imageView.backgroundColor = [UIColor clearColor];
		imageView.contentMode = UIViewContentModeCenter;
		[imageView setImage:tempImage];
	}
	else
	{
		imageView = [[UIImageView alloc] initWithFrame:frame];
		imageView.backgroundColor = [UIColor clearColor];
    //    imageView.contentMode = UIViewContentModeScaleToFill;
		imageView.image = tempImage;
	}
	imageView.userInteractionEnabled = YES;
	
	return imageView;
}


+ (UILabel *)newLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font
{
  UILabel *label = [[UILabel alloc] initWithFrame:frame];
	label.text = text;
	label.textColor = textColor;
	label.backgroundColor = [UIColor clearColor];
	label.textAlignment = UITextAlignmentLeft;
	label.font = font;
  return label;
}


+(UITextField *) newTextFieldWithFrame:(CGRect)frame tag:(int) tag  borderStyle:(int) borderStyle
{
  UITextField *textField = [[UITextField alloc] initWithFrame:frame];
  textField.borderStyle = UITextBorderStyleNone;            //[UIGloble newTextFieldWithFrame:CGRectMake(27, 3, sharedInst.searchImageView.frame.size.width-54, 26) tag:0 borderStyle:0];
  textField.textAlignment = UITextAlignmentLeft;
  textField.font = [UIFont systemFontOfSize:14.0f];
  textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  textField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
  textField.clearButtonMode = UITextFieldViewModeNever;
	
	return textField;
}




+(UIView *) newWhiteViewWithFrame:(CGRect)frame backgroundColor:(UIColor *) backgroundColor
{
	UIView *whiteView = [[UIView alloc] initWithFrame:frame];
	whiteView.backgroundColor = backgroundColor;
	return whiteView;
}



+(UIActivityIndicatorView *) newActivityViewWithFrame:(CGRect)frame bigWhiteStyle:(BOOL) style
{
	UIActivityIndicatorView *tempView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style? UIActivityIndicatorViewStyleWhiteLarge : UIActivityIndicatorViewStyleWhite];
	tempView.frame = frame;
  
	return tempView;
}

+ (void)showProcessIndicatorWithView:(UIView *)view{
  [self showProcessIndicatorWithView:view hasMask:NO];
}

+ (void)showProcessIndicatorWithView:(UIView *)view hasMask:(BOOL)hasMask{
  [self showProcessIndicatorWithView:view
                             atPoint:CGPointMake(view.bounds.size.width / 2.f, view.bounds.size.height / 2.f)
                             hasMask:hasMask];
}

+ (void)showProcessIndicatorWithView:(UIView *)view atPoint:(CGPoint)point hasMask:(BOOL)hasMask
{
  [self showProcessIndicatorWithView:view atPoint:point hasMask:hasMask indicatorStyle:UIActivityIndicatorViewStyleGray];
}
+ (void)showProcessIndicatorWithView:(UIView *)view atPoint:(CGPoint)point hasMask:(BOOL)hasMask indicatorStyle:(UIActivityIndicatorViewStyle)style
{
	if ([view viewWithTag:2045])//已经有了，不需要重复添加
	{
		return;
	}
	
	
	if( hasMask )
	{
    UIImageView *maskView = [UIGloble newImageViewWithFrame:view.bounds imageName:@"testBookMessage" aotuAdaptState:NO];
    maskView.tag = 2046;
    [view addSubview:maskView];
	}
  
	UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 35)];
	backView.backgroundColor = [UIColor clearColor];//colorWithWhite:0.2 alpha:0.7
	backView.center = point;
	backView.layer.cornerRadius = 4;
	backView.tag = 2045;
	
	UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
	indicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
	indicator.frame = CGRectMake(0, 0, 20, 20);
  indicator.center = CGPointMake(25, 35/2);
	[backView addSubview:indicator];
	[view addSubview:backView];
	[indicator startAnimating];
}


+ (void)hideProcessIndicatorWithView:(UIView *)view
{
	UIView *maskView = [view viewWithTag:2046];
	if( maskView != nil && view != nil)
	{
		[maskView removeFromSuperview];
	}
	UIView *indicator = [view viewWithTag:2045];
	if( indicator != nil && view != nil)
	{
		[indicator removeFromSuperview];
	}
}

+(void) showTipMessage:(NSString *) message  inView:(UIView *) view{
  [self showTipMessage:message inView:view alpha:0.75];
}

+(void) showTipMessage:(NSString *) message  inView:(UIView *) view backgroundAlpha:(CGFloat)backgroundAlpha{
  [self showTipMessage:message inView:view alpha:0.75 backgroundAlpha:backgroundAlpha];
}

+(void) showTipMessage:(NSString *) message  inView:(UIView *) view backgroundAlpha:(CGFloat)backgroundAlpha indicatorStyle:(UIActivityIndicatorViewStyle)style
{
  [self showTipMessage:message inView:view alpha:0.75 backgroundAlpha:backgroundAlpha indicatorStyle:style];
}

+(void) showTipMessage:(NSString *) message  inView:(UIView *) view alpha:(CGFloat)alpha
{
  [self showTipMessage:message inView:view alpha:alpha backgroundAlpha:1.0f];
}

+(void) showTipMessage:(NSString *) message  inView:(UIView *) view alpha:(CGFloat)alpha backgroundAlpha:(CGFloat)backgroundAlpha
{
  [self showTipMessage:message inView:view alpha:alpha backgroundAlpha:backgroundAlpha indicatorStyle:UIActivityIndicatorViewStyleWhite];
}
+(void) showTipMessage:(NSString *) message  inView:(UIView *) view alpha:(CGFloat)alpha backgroundAlpha:(CGFloat)backgroundAlpha indicatorStyle:(UIActivityIndicatorViewStyle)style
{
  if ([view viewWithTag:9009])
    return;
  
  view.userInteractionEnabled = NO;
  UIView *tempView = [UIGloble newWhiteViewWithFrame:CGRectMake(0, 0, 140, 80) backgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:backgroundAlpha]];
  tempView.tag = 9009;
  tempView.layer.cornerRadius = 8;
  CGPoint center;
  center.x = view.bounds.size.width * 0.5;
  center.y = view.bounds.size.height * 0.5 - 20; //没办法，现在只能这么强制使用了
  tempView.center = center;
  
  UIActivityIndicatorView *imageView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
	imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
  CGRect frame;
  frame.size = CGSizeMake(20, 20);
  frame.origin.x = (tempView.bounds.size.width - frame.size.width) * 0.5;
  frame.origin.y = 45;
  imageView.frame = frame;
	[tempView addSubview:imageView];
	[imageView startAnimating];
  
  UIButton *button = [UIGloble newActionButtonWithFrame:CGRectMake(0, 5, tempView.frame.size.width, tempView.frame.size.height-imageView.frame.size.height-10) title:message tappedImageName:nil unTappedImageName:nil titleColor:[UIColor whiteColor] tappedColor:[UIColor colorWithWhite:0.8 alpha:1] font:[UIFont systemFontOfSize:16.0f] target:nil action:nil];
  button.titleLabel.shadowColor = [UIColor grayColor];
	[button.titleLabel setShadowOffset:CGSizeMake(1, 1)];
  [tempView addSubview:button];
  [view addSubview:tempView];
  [UIGloble addAnimationShow:tempView duraion:0.5 alpha:alpha];
}

+(void) hideTipMessageInView:(UIView *) view
{
  view.userInteractionEnabled = YES;
  if ([view viewWithTag:9009])
  {
    [UIGloble addAnimationFade:[view viewWithTag:9009] delegate:[view viewWithTag:9009] startSelector:nil stopSelector:@selector(removeFromSuperview) duraion:0.5];
  }
}



//画线
+(void) drawLineInView:(UIView *) view  frame:(CGRect)frame backgroundColor:(UIColor *) backgroundColor imageNamed:(NSString *) lineName
{
  UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:lineName]];
  imageView.frame = frame;
  if (!lineName)
  {
    imageView.backgroundColor = backgroundColor;
  }
  [view addSubview:imageView];
}



+(void) showAlertViewWithTitle:(NSString *) title message:(NSString *)message delegate:(id) delegate cancleTitle:(NSString *) cancleTitle  otherTitle:(NSString *) otherTitle
{
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:delegate cancelButtonTitle:cancleTitle otherButtonTitles:otherTitle,nil];
  [alert show];
}


#pragma --像素问题－－
+ (void)roundCenter:(UIView *)view
{
  view.center = CGPointMake(round(view.center.x), round(view.center.y));
}


+(UIImage *) getImageWithName:(NSString *) imageName width:(CGFloat) width height:(CGFloat) height
{
	//====================设置image的大小=========
	CGSize size = CGSizeMake(width, height);
	UIGraphicsBeginImageContext(size);
	UIImage *tempImage = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageName stringByReplacingOccurrencesOfString:@".png" withString:@""] ofType:@"png"]];
	[tempImage drawInRect:CGRectMake(0,0, size.width, size.height)];
	tempImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return tempImage;
}



//------------判断分辨率-----------------
+(BOOL) isHDShow
{
  BOOL isHD = NO;
  UIDevice *device = [UIDevice currentDevice];
  NSInteger mainVersion = [[device.systemVersion substringToIndex:1] integerValue];
  if( mainVersion>=4 )
  { //iOS4
    UIScreen *mainScreen = [UIScreen mainScreen];
    if( mainScreen.scale>1 )
    { //iPhone4
      isHD = YES;
    }
  }
  return isHD;
}



#pragma mark --计算剩余空间－－
#include <sys/param.h>
#include <sys/mount.h>
+(float)  freeSpace
{
  struct statfs buf;
  float freespace = -1;
  if(statfs("/", &buf) >= 0){
    freespace = (float)buf.f_bsize * buf.f_bfree;
  }
	
  return freespace;
}

+(float)getTotalDiskSpaceInBytes
{
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  struct statfs tStats;
  statfs([[paths lastObject] cString], &tStats);
  float totalSpace = (float)(tStats.f_blocks * tStats.f_bsize);
  
  return totalSpace;
}



@end
