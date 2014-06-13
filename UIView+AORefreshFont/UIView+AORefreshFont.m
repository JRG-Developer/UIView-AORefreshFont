//
//  UIView+AORefreshFont.m
//  UIView+AORefreshFont
//
//  Created by Joshua Greene on 6/13/14.
//  Copyright (c) 2014 App-Order, LLC. All rights reserved.
//

#import "UIView+AORefreshFont.h"
#import "UIFont+AOTextStyle.h"

/**
 *  This is a "dummy" class to workaround a bug that prevents the linker from correctly creating static libraries that only have categories.
 *  @see http://developer.apple.com/library/mac/#qa/qa2006/qa1490.html for more info.
 */
@interface AORefreshFont : UIView @end
@implementation AORefreshFont @end

@implementation UIView (AORefreshFont)

- (void)AORefreshFont
{
  if (![self respondsToSelector:@selector(font)]) {
    return;
  }
  
  NSString *textStyle = [[(id)self font] AOTextStyle];
  
  if (textStyle.length == 0) {
    return;
  }
  
  UIFont *font = [UIFont preferredFontForTextStyle:textStyle];    
  [((id)self) setFont:font];
}

@end
