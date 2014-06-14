//
//  UIView+AORefreshFont.m
//  UIView+AORefreshFont
//
//  Created by Joshua Greene on 6/13/14.
//  Copyright (c) 2014 App-Order, LLC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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
  [self performSelector:@selector(setFont:) withObject:font];
}

@end
