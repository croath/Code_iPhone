

#import "MenuItemButton.h"

#define ACTIVATED_BUTTON_IMAGE [UIImage imageNamed:@"activated_btn"]
#define STRETCHABLE_ACTIVATED_BUTTON_IMAGE [ACTIVATED_BUTTON_IMAGE stretchableImageWithLeftCapWidth:4 topCapHeight:44];

#define DEACTIVATED_BUTTON_IMAGE [UIImage imageNamed:@"deactivated_btn"]
#define STRETCHABLE_DEACTIVATED_BUTTON_IMAGE [DEACTIVATED_BUTTON_IMAGE stretchableImageWithLeftCapWidth:4 topCapHeight:44];

#define SELECTED_TITLE_COLOR [UIColor colorWithRed:0 green:(1.0f * 0xbf) / 255.0f blue:(1.0f*0xf0)/255.0f alpha:.8]

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
    //    [self setTitleColor:SELECTED_TITLE_COLOR forState:UIControlStateHighlighted];
    
    UIImage * stretchableImage = STRETCHABLE_DEACTIVATED_BUTTON_IMAGE;
    [self setBackgroundImage:stretchableImage forState:UIControlStateNormal];
    
    stretchableImage = STRETCHABLE_ACTIVATED_BUTTON_IMAGE;
    [self setBackgroundImage:stretchableImage forState:UIControlStateSelected];
    self.adjustsImageWhenDisabled = YES;
    self.adjustsImageWhenHighlighted = NO;
  }
  return self;
}

- (void)setSelected:(BOOL)selected
{
  
  
  UIColor * color = nil;
  UIImage * stretchableImage = nil;
  if (YES == selected) {
    color = SELECTED_TITLE_COLOR;
    stretchableImage = STRETCHABLE_ACTIVATED_BUTTON_IMAGE;
    [self setBackgroundImage:stretchableImage forState:UIControlStateNormal];
  }
  else {
    color = [UIColor whiteColor];
    stretchableImage = STRETCHABLE_DEACTIVATED_BUTTON_IMAGE;
    
  }
  [self setTitleColor:color forState:UIControlStateNormal];
  [self setBackgroundImage:stretchableImage forState:UIControlStateNormal];
  
  [super setSelected:selected];
}

- (void)dealloc
{
}

@end
