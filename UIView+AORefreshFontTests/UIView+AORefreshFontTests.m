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

// Test Class
#import "UIView+AORefreshFont.h"

// Collaborators
#import "UIFont+AOTextStyle.h"

// Test Support
#import <AOTestCase/AOTestCase.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

const char AOSetFontKey;

@interface UIView (Protected_Methods)
- (void)test_setFont:(UIFont *)font;
@end

@implementation UIView (Protected_Methods)

- (void)test_setFont:(UIFont *)font
{
  [self setAssociatedValue:font key:&AOSetFontKey];
}

@end

@interface UIView_AORefreshFontTests : AOTestCase
@end

@implementation UIView_AORefreshFontTests

#pragma mark - Utilties

- (void)swapSetFontMethodForClass:(Class)theClass
{
  [self swapInstanceMethodsForClass:theClass selector:@selector(setFont:) andSelector:@selector(test_setFont:)];
}

- (void)verifyRefreshesFontOnClass:(Class)theClass
{
  // given
  id inputView = [[theClass alloc] init];

  UIFont *expectedFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [inputView setFont:expectedFont];
  
  [self swapSetFontMethodForClass:theClass];
  
  // when
  [inputView AORefreshFont];
  
  // then
  UIFont *actualFont = [inputView associatedValueForKey:&AOSetFontKey];
  
  assertThat(actualFont, equalTo(expectedFont));
  
  // clean up
  [self swapSetFontMethodForClass:theClass];
}

#pragma mark - Tests

- (void)test_doesNotAttemptToSetFontOnAViewThatDoesntRecognizeFontSelector
{
  UIView *view = [[UIView alloc] init];
  XCTAssertNoThrow([view AORefreshFont]);
}

- (void)test_refreshesFontOn_UILabel
{
  [self verifyRefreshesFontOnClass:[UILabel class]];
}

- (void)test_refreshesFontOn_UITextField
{
  [self verifyRefreshesFontOnClass:[UITextField class]];
}

- (void)test_refreshesFontOn_UITextView
{
  [self verifyRefreshesFontOnClass:[UITextView class]];
}

- (void)test_ifNotCreatedWithADynamicTypeTextStyle_doesNOTRefreshFont
{
  // given
  UILabel *label = [[UILabel alloc] init];
  label.font = [UIFont systemFontOfSize:17.0f];
  [self swapSetFontMethodForClass:[UILabel class]];
  
  // then
  XCTAssertNoThrow([label AORefreshFont]);
  assertThat([label associatedValueForKey:&AOSetFontKey], nilValue());
}

@end