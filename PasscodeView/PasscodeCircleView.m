// CircleView.m
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

#import "PasscodeCircleView.h"

@implementation CircleView {
    UIView* circleView;
}

#pragma mark - Superclass
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)prepareForInterfaceBuilder
{
    circleView.layer.cornerRadius = self.size / 2;
    circleView.layer.borderWidth = self.borderWidth;
    circleView.layer.borderColor = [[self tintColor] CGColor];
    [self setFilled:self.filled];
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(self.size, self.size);
}

#pragma mark - Public
- (void)setFilled:(BOOL)filled
{
    _filled = filled;
    if (filled) {
        [UIView animateWithDuration:self.animationDuration animations:^{
            circleView.layer.backgroundColor = self.tintColor.CGColor;
        }];
    }
    else {
        [UIView animateWithDuration:self.animationDuration animations:^{
            circleView.layer.backgroundColor = [UIColor clearColor].CGColor;
        }];
    }
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    circleView.layer.borderWidth = borderWidth;
}

- (void)setTintColor:(UIColor*)tintColor
{
    [super setTintColor:tintColor];
    circleView.layer.borderColor = [[self tintColor] CGColor];
    if (self.filled) {
        circleView.backgroundColor = self.tintColor;
    }
}

- (void)setSize:(CGFloat)size
{
    _size = size;
    [circleView setFrame:CGRectMake(0, 0, self.size, self.size)];
    circleView.center = [self convertPoint:self.center fromView:self.superview];
    circleView.layer.cornerRadius = self.size / 2;
    [self invalidateIntrinsicContentSize];
}

#pragma mark - Private
- (void)baseInit
{
    self.filled = NO;
    self.animationDuration = 0.0f;

    circleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.size, self.size)];
    [circleView setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin)];
    circleView.center = [self convertPoint:self.center fromView:self.superview];
    circleView.layer.backgroundColor = [[UIColor clearColor] CGColor];
    circleView.layer.cornerRadius = self.size / 2;
    circleView.layer.borderWidth = self.borderWidth;
    circleView.layer.borderColor = [[self tintColor] CGColor];
    [self addSubview:circleView];
}

@end
