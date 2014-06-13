//
//  UIView+AORefreshFont.h
//  UIView+AORefreshFont
//
//  Created by Joshua Greene on 6/13/14.
//  Copyright (c) 2014 App-Order, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  `UIView+AORefreshFont` provides a convenience method for resetting the dynamic text font of a `UIView` that responds to `@selector(font)`.
 *
 *  @discussion This category is useful, for example, in "refreshing" the font of a view after receiving a `UIContentSizeCategoryDidChangeNotification` notification.
 */
@interface UIView (AORefreshFont)

/**
 *  This method checks if the view responds to `@selector(font)`; checks if its `fontDescriptor` has a `UIFontDescriptorTextStyleAttribute`; and sets the font using this text style.
 */
- (void)AORefreshFont;
@end
