//
//  UIFont+AOTextStyleTests.m
//  UIView+AORefreshFont
//
//  Created by Joshua Greene on 6/13/14.
//  Copyright (c) 2014 App-Order, LLC. All rights reserved.
//

// Test Class
#import "UIFont+AOTextStyle.h"

// Collaborators

// Test Support
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

@interface UIFont_AOTextStyleTests : XCTestCase
@end

@implementation UIFont_AOTextStyleTests

#pragma mark - Utilities

- (void)verifyReturnsCorrectFontForTextStyle:(NSString *)textStyle
{
  // given
  NSString *expected = textStyle;
  UIFont *font = [UIFont preferredFontForTextStyle:expected];
  
  // when
  NSString *actual = [font AOTextStyle];
  
  // then
  assertThat(actual, equalTo(expected));
}

#pragma mark - Tests

- (void)test_returns_UIFontTextStyleBody_correctly
{
  [self verifyReturnsCorrectFontForTextStyle:UIFontTextStyleBody];
}

- (void)test_returns_UIFontTextStyleHeadline_correctly
{
  [self verifyReturnsCorrectFontForTextStyle:UIFontTextStyleHeadline];
}

@end