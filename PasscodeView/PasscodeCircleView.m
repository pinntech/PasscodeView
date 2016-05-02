// PasscodeCircleView.m
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

@implementation PasscodeCircleView

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

- (void)prepareForInterfaceBuilder
{
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.layer.borderWidth = self.borderWidth;
    self.layer.borderColor = [[self tintColor] CGColor];
    [self setFilled:self.filled];
}

#pragma mark - Public
- (void)setFilled:(BOOL)filled
{
    _filled = filled;
    if (filled) {
        self.backgroundColor = self.tintColor;
    }
    else {
        self.backgroundColor = [UIColor clearColor];
    }
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

- (void)setTintColor:(UIColor*)tintColor
{
    [super setTintColor:tintColor];
    self.layer.borderColor = [[self tintColor] CGColor];
    if (self.filled) {
        self.backgroundColor = self.tintColor;
    }
}

#pragma mark - Private
- (void)baseInit
{
    self.filled = NO;
    self.layer.backgroundColor = [[self tintColor] CGColor];
    self.layer.cornerRadius = self.frame.size.width / 2;
    self.layer.borderWidth = self.borderWidth;
    self.layer.borderColor = [[self tintColor] CGColor];
}

@end
