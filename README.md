# UIView+AORefresh

[![Build Status](https://travis-ci.org/JRG-Developer/UIView-AORefreshFont.svg?branch=master)](https://travis-ci.org/JRG-Developer/UIView-AORefreshFont)

`UIView+AORefreshFont` is a category on `UIView` that provides a convenience method for resetting the dynamic type font of a text-input view.
 
This is useful, for example, in "refreshing" the font of a view after receiving the `UIContentSizeCategoryDidChangeNotification` notification.

## Installation with CocoaPods

The easiest way to add `UIView+AORefresh` to your project is using <a href="http://cocoapods.org">CocoaPods</a>.

Add the following to your `podfile` to include `UIView+AORefreshFont` in your workspace:

    pod 'UIView+AORefresh', '~> 1.0'
    
Then simply run pod install as you normally would.

## Manual Installation

Alternatively, you can manually include `UIView+AORefresh` in your project by doing the following:

1) Drag and drop `UIView+AORefresh.h` and `UIView+AORefresh.m` into your project, making sure `copy items into destination group's folder (if needed)` is checked.

2) Drag and drop the `UIView+AORefreshFont.h` and `UIView+AORefreshFont` into your project, making sure `copy items into destination group's folder (if needed)` is checked. 

These files are depended upon by `UIView+AORefreshFont.m`.

# How To Use

1) Import `UIView+AORefreshView.h` wherever you need to "refresh" the font of your text-input views (i.e. `UILabel`, `UITextField`, `UITextView`, etc views) that use dynamic type font.

2) Whenever you receive the `UIContentSizeCategoryDidChangeNotification` notification, simply call `AORefreshFont` your text-input views. For example,

    - (void)contentSizeCategoryDidChange:(NSNotification *)notification
    {
      [self.titleLabel AORefreshFont];
      [self.subtitleLabel AORefreshFont];
    }

Note: `UIView+AORefreshFont` gets the dynamic type "text style" from the view's `font` property and resets the font using this "text style".

If you attempt to call `AORefreshFont` on a view whose `font` doesn't have a dynamic type "text style", this method will do nothing.

If you attempt to call `AORefreshFont` on a view that doesn't have a `font` property, this method will do nothing.

## License

`UIView+AORefreshFont.h` is available under the MIT license (see the `LICENSE` file for more details).