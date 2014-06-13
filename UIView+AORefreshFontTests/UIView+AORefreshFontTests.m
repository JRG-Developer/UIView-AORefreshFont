//
//  UIView+AORefreshFont.m
//  UIView+AORefreshFont
//  
//  Created by Joshua Greene on 6/13/14.
//  Copyright (c) 2014 App-Order, LLC. All rights reserved.
//

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