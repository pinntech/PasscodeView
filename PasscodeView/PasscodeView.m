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

@implementation PasscodeView

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
    for (PasscodeCircleView* circleView in self.arrangedSubviews) {
        circleView.size = size;
    }
}

- (void)setTintColor:(UIColor*)tintColor
{
    [super setTintColor:tintColor];
    for (PasscodeCircleView* circleView in self.arrangedSubviews) {
        circleView.tintColor = tintColor;
    }
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    for (PasscodeCircleView* circleView in self.arrangedSubviews) {
        circleView.borderWidth = borderWidth;
    }
}

- (void)setLength:(NSUInteger)length
{
    _length = length;
    for (UIView* subview in self.arrangedSubviews) {
        [subview removeFromSuperview];
    }
    for (NSUInteger i = 0; i < length; i++) {
        PasscodeCircleView* circleView = [[PasscodeCircleView alloc] initWithFrame:CGRectMake(0, 0, self.size, self.size)];
        circleView.size = self.size;
        circleView.borderWidth = self.borderWidth;
        circleView.tintColor = self.tintColor;
        [self addArrangedSubview:circleView];
    }
}

#pragma mark - Private
- (void)baseInit
{
    for (NSUInteger i = 0; i < self.length; i++) {
        PasscodeCircleView* circleView = [[PasscodeCircleView alloc] init];
        circleView.size = self.size;
        circleView.borderWidth = self.borderWidth;
        circleView.tintColor = self.tintColor;
        [self addArrangedSubview:circleView];
    }
    [self setTintColor:[UIColor blackColor]];
    self.axis = UILayoutConstraintAxisHorizontal;
    self.distribution = UIStackViewDistributionEqualSpacing;
    self.alignment = UIStackViewAlignmentCenter;
}

@end
