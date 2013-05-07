

#import "MenuItemButton.h"

#define SELECTED_TITLE_COLOR [UIColor colorWithRed:0 green:(1.0f * 0xbf) / 255.0f blue:(1.0f*0xf0)/255.0f alpha:.8]

@interface MenuItemButton(){
  UIView *_upLine;
}

@end

@implementation MenuItemButton

- (id)initWithTitle:(NSString *)title {
  self = [super init];
  if (self) {
    self.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:SELECTED_TITLE_COLOR forState:UIControlStateSelected];
    
    self.adjustsImageWhenDisabled = YES;
    self.adjustsImageWhenHighlighted = NO;
  }
  return self;
}

- (void)setSelected:(BOOL)selected
{
  [super setSelected:selected];
  if (!_upLine) {
    CGRect frame = CGRectZero;
//    frame.origin.x = self.bounds.size.width / 3.f;
    frame.origin.x = 0.f;
    frame.origin.y = 0.f;
//    frame.size.width = frame.origin.x;
    frame.size.width = self.bounds.size.width;
    frame.size.height = self.bounds.size.height / 20.f;
    _upLine = [[UIView alloc] initWithFrame:frame];
    [_upLine setBackgroundColor:[UIColor colorWithRed:96.f/255.f
                                                green:182.f/255.f
                                                 blue:174.f
                                                alpha:1.f]];
    [_upLine setHidden:YES];
    [self addSubview:_upLine];
  }
  
  UIColor * color = nil;
  if (YES == selected) {
    color = SELECTED_TITLE_COLOR;
    [_upLine setHidden:NO];
  }
  else {
    color = [UIColor whiteColor];
    [_upLine setHidden:YES];
  }
  [self setTitleColor:color forState:UIControlStateNormal];
  
  [super setSelected:selected];
}

- (void)dealloc
{
}

@end
