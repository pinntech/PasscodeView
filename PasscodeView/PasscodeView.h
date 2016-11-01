// PasscodeView.h
// Copyright (c) 2016 Pinn Technologies, Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>

IB_DESIGNABLE
/**
 *  A view that displays passcode placeholder circles, which can then be either
 *  filled or unfilled based on a data source. The view can be customized based
 *  on length, tint color, or border width
 */
@interface PasscodeView : UIStackView

/**
 *  The border width of the passcode circles
 */
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

/**
 *  The length of the passcode entry, tells the view how many circles to draw
 */
@property (nonatomic, assign) IBInspectable NSUInteger length;

/**
 *  The amount of characters that have been entered, the value can be 0-[length]
 *  where 0 is an empty passcode view and length will fill the passcode view
 */
@property (nonatomic, assign) IBInspectable NSUInteger progress;

/**
 *  The size of the circles in the view
 */
@property (nonatomic, assign) IBInspectable CGFloat size;

/**
 *  Duration that the fill/unfill animation is done for, 0 by default
 */
@property (nonatomic, assign) IBInspectable CGFloat animationDuration;

@end
