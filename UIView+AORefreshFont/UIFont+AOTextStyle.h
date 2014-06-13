//
//  UIFont+AOTextStyle.h
//  UIView+AORefreshFont
//
//  Created by Joshua Greene on 6/13/14.
//  Copyright (c) 2014 App-Order, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  `UIFont+AOTextStyle` provides a convenience method for getting the dynamic type "text style" of a font.
 */
@interface UIFont (AOTextStyle)

/**
 *  This is a convenience method for getting the dynamic type "text style" of a font.
 *
 *  @warning This method may return `nil` if the font wasn't created using a dynamic type "text style".
 *
 *  @return The dynamic type "text style" for the font.
 */
- (NSString *)AOTextStyle;

@end
