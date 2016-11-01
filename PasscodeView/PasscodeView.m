// PasscodeView.m
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
#import "PasscodeView.h"

@implementation PasscodeView {
    NSMutableArray* circleViews;
}

#pragma mark - Superclass
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

#pragma mark - Public
- (void)setSize:(CGFloat)size
{
    _size = size;
    for (CircleView* circleView in self.arrangedSubviews) {
        circleView.size = size;
    }
}

- (void)setTintColor:(UIColor*)tintColor
{
    [super setTintColor:tintColor];
    for (CircleView* circleView in self.arrangedSubviews) {
        circleView.tintColor = tintColor;
    }
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    for (CircleView* circleView in self.arrangedSubviews) {
        circleView.borderWidth = borderWidth;
    }
}

- (void)setAnimationDuration:(CGFloat)animationDuration {
    _animationDuration = animationDuration;
    for (CircleView* circleView in self.arrangedSubviews) {
        circleView.animationDuration = animationDuration;
    }
}

- (void)setLength:(NSUInteger)length
{
    _length = length;
    [circleViews removeAllObjects];
    for (UIView* subview in self.arrangedSubviews) {
        [subview removeFromSuperview];
    }
    for (NSUInteger i = 0; i < length; i++) {
        CircleView* circleView = [[CircleView alloc] initWithFrame:CGRectMake(0, 0, self.size, self.size)];
        circleView.size = self.size;
        circleView.borderWidth = self.borderWidth;
        circleView.tintColor = self.tintColor;
        [self addArrangedSubview:circleView];
        [circleViews addObject:circleView];
    }
}

- (void)setProgress:(NSUInteger)progress
{
    _progress = progress;
    if (progress > self.length) {
        // Gave too large progress so setting to max, which is length
        _progress = self.length;
    }
    for (NSUInteger i = 0; i < _progress; i++) {
        [self.arrangedSubviews[i] setFilled:YES];
    }
    for (NSUInteger i = progress; i < self.length; i++) {
        [self.arrangedSubviews[i] setFilled:NO];
    }
}

#pragma mark - Private
- (void)baseInit
{
    for (NSUInteger i = 0; i < self.length; i++) {
        CircleView* circleView = [[CircleView alloc] init];
        circleView.size = self.size;
        circleView.borderWidth = self.borderWidth;
        circleView.tintColor = self.tintColor;
        circleView.animationDuration = 0;
        [self addArrangedSubview:circleView];
        [circleViews addObject:circleView];
    }
    self.axis = UILayoutConstraintAxisHorizontal;
    self.distribution = UIStackViewDistributionEqualSpacing;
    self.alignment = UIStackViewAlignmentCenter;
}

@end
