


#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface UIGloble : NSObject
{
  
}

//-----------CreateUIView------------
+(UIButton *) newActionButtonWithFrame:(CGRect)frame title:(NSString *)title  tappedImageName:(NSString *)tappedImageName unTappedImageName:(NSString *)unTappedImageName  titleColor:(UIColor *)titleColor tappedColor:(UIColor *)tappedColor font:(UIFont *)font target:(id)target  action:(SEL)selector;
+(UIImageView *) newImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName aotuAdaptState:(BOOL) adaptState;
+(UILabel *) newLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;
+(UITextField *) newTextFieldWithFrame:(CGRect)frame tag:(int) tag  borderStyle:(int) borderStyle;
+(UIView *) newWhiteViewWithFrame:(CGRect)frame backgroundColor:(UIColor *) backgroundColor;
+(UIActivityIndicatorView *) newActivityViewWithFrame:(CGRect)frame bigWhiteStyle:(BOOL) style;
+ (void)showProcessIndicatorWithView:(UIView *)view;
+ (void)showProcessIndicatorWithView:(UIView *)view hasMask:(BOOL)hasMask;
+(void) showProcessIndicatorWithView:(UIView *)view atPoint:(CGPoint)point hasMask:(BOOL)hasMask;
+ (void)showProcessIndicatorWithView:(UIView *)view atPoint:(CGPoint)point hasMask:(BOOL)hasMask indicatorStyle:(UIActivityIndicatorViewStyle)style;
+(void) hideProcessIndicatorWithView:(UIView *)view;
+(UIImage *) getImageWithName:(NSString *) imageName width:(CGFloat) width height:(CGFloat) height;
+(void) drawLineInView:(UIView *) view  frame:(CGRect)frame backgroundColor:(UIColor *) backgroundColor imageNamed:(NSString *) lineName;
+(void) showTipMessage:(NSString *) message  inView:(UIView *) view;
+(void) showTipMessage:(NSString *) message  inView:(UIView *) view alpha: (CGFloat) alpha;
+(void) showTipMessage:(NSString *) message  inView:(UIView *) view backgroundAlpha:(CGFloat)backgroundAlpha;
+(void) showTipMessage:(NSString *) message  inView:(UIView *) view backgroundAlpha:(CGFloat)backgroundAlpha indicatorStyle:(UIActivityIndicatorViewStyle)style;
+(void) showTipMessage:(NSString *) message  inView:(UIView *) view alpha:(CGFloat)alpha backgroundAlpha:(CGFloat)backgroundAlpha;
+(void) showTipMessage:(NSString *) message  inView:(UIView *) view alpha:(CGFloat)alpha backgroundAlpha:(CGFloat)backgroundAlpha indicatorStyle:(UIActivityIndicatorViewStyle)style;
+(void) hideTipMessageInView:(UIView *) view;
+(void) showAlertViewWithTitle:(NSString *) title message:(NSString *)message delegate:(id) delegate cancleTitle:(NSString *) cancleTitle  otherTitle:(NSString *) otherTitle;


//------------UIImage---------------

+ (UIImage *)imageWithColor:(UIColor *)color;

//------------setView---------------
+(void)roundCenter:(UIView *)view;


//------------判断分辨率-----------------
+(BOOL) isHDShow;


//-----------Animation--------------
+(void) addAnimationRotation:(UIView *)viewToAddAnimation delegate:(id) delegate startSelector:(SEL) startSelector stopSelector:(SEL) stopSelector duraion:(CFTimeInterval) seconds;
+(void) addAnimationFade:(UIView *)viewToAddAnimation duraion:(CFTimeInterval) seconds;
+(void) addAnimationShow:(UIView *)viewToAddAnimation duraion:(CFTimeInterval) seconds;
+ (void)addAnimationShow:(UIView *)viewToAddAnimation duraion:(CFTimeInterval) seconds alpha:(CGFloat) alpha;
+(void) addAnimationToFade:(UIView *)detailView toPoint:(CGPoint) center duraion:(CFTimeInterval) seconds;
+(void) addAnimationToShow:(UIView *)detailView toPoint:(CGPoint) center delegate:(id) delegate startSelector:(SEL) startSelector stopSelector:(SEL) stopSelector duraion:(CFTimeInterval) seconds;
+(void) addAnimationFade:(UIView *)viewToAddAnimation delegate:(id) delegate startSelector:(SEL) startSelector stopSelector:(SEL) stopSelector duraion:(CFTimeInterval) seconds;
+(void) addAnimationShow:(UIView *)viewToAddAnimation delegate:(id) delegate startSelector:(SEL) startSelector stopSelector:(SEL) stopSelector duraion:(CFTimeInterval) seconds;
+(void) addAnimationScal:(UIView *)tempView toPoint:(CGPoint)center  lightState:(BOOL) getLightState delegate:(id) delegate startSelector:(SEL) startSelector stopSelector:(SEL) stopSelector scaleNumber:(float) number duraion:(CFTimeInterval) seconds;
+(void) addAnimationMove:(UIView *)tempView delegate:(id) delegate startSelector:(SEL) startSelector stopSelector:(SEL) stopSelector toCenter:(CGPoint) center duraion:(CFTimeInterval) seconds;
+(void) addAnimationFrameInView:(UIView *)tempView delegate:(id) delegate startSelector:(SEL) startSelector stopSelector:(SEL) stopSelector toFrame:(CGRect) frame;




#pragma mark --计算空间－－
+(float) getTotalDiskSpaceInBytes;
+(float) freeSpace;


@end
