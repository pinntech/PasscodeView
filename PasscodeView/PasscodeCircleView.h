// CircleView.h
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

#import <UIKit/UIKit.h>

IB_DESIGNABLE
/**
 *  A UI element which simply draws a circle, it can either be filled which is
 *  a solid circle, or unfilled which is a circle with a border.
 */
@interface CircleView : UIView

/**
 *  The size of the circle, which is also its intrinsic content size
 */
@property (nonatomic, assign) IBInspectable CGFloat size;

/**
 *  The border width of the circle view
 */
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

/**
 *  The fill on the circle view, if true the circle will be filled with the tint
 *  color if not it will be simply bordered with the tint color
 */
@property (nonatomic, assign) IBInspectable BOOL filled;

/**
 *  Duration that the fill/unfill animation is done for, 0 by default
 */
@property (nonatomic, assign) IBInspectable CGFloat animationDuration;

@end
