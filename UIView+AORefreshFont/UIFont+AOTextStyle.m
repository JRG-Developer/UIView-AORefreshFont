//
//  UIFont+AOTextStyle.m
//  UIView+AORefreshFont
//
//  Created by Joshua Greene on 6/13/14.
//  Copyright (c) 2014 App-Order, LLC. All rights reserved.
//

/**
 *  This is a "dummy" class to workaround a bug that prevents the linker from correctly creating static libraries that only have categories.
 *  @see http://developer.apple.com/library/mac/#qa/qa2006/qa1490.html for more info.
 */
@interface AOFontTextStyle : UIFont @end
@implementation AOFontTextStyle @end

#import "UIFont+AOTextStyle.h"

@implementation UIFont (AOTextStyle)

- (NSString *)AOTextStyle
{
  return self.fontDescriptor.fontAttributes[UIFontDescriptorTextStyleAttribute];
}

@end
