//
//  UILabel+Justu.m
//  CategoryDemo
//
//  Created by zhubo on 15/12/14.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import "UILabel+Justu.h"
#import <objc/runtime.h>

@interface UILabel ()

@property (nonatomic) UILongPressGestureRecognizer *longPressGestureRecognizer;

@end

@implementation UILabel (Justu)

- (UITextVerticalAlignment)textVerticalAlignment
{
    NSNumber *alignment = objc_getAssociatedObject(self, "UITextVerticalAlignment");
    
    if (alignment)
    {
        return [alignment intValue];
    }
    
    NSNumber *newAlignment = [NSNumber numberWithInt:1];
    objc_setAssociatedObject(self, "UITextVerticalAlignment", newAlignment, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return UITextVerticalAlignmentMiddle;
}

- (void)setTextVerticalAlignment:(UITextVerticalAlignment)textVerticalAlignment
{
    NSNumber *newAlignment = [NSNumber numberWithInt:textVerticalAlignment];
    objc_setAssociatedObject(self, "UITextVerticalAlignment", newAlignment, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setNeedsDisplay];
}

- (CGRect)verticalAlignTextRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [self verticalAlignTextRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    
    switch ([self textVerticalAlignment])
    {
        case UITextVerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
            
        case UITextVerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
            
        case UITextVerticalAlignmentMiddle:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
            break;
    }
    
    return textRect;
}

- (void)verticalAlignDrawTextInRect:(CGRect)rect
{
    CGRect actualRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [self verticalAlignDrawTextInRect:actualRect];
}

+ (void)load
{
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(textRectForBounds:limitedToNumberOfLines:)), class_getInstanceMethod(self, @selector(verticalAlignTextRectForBounds:limitedToNumberOfLines:)));
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(drawTextInRect:)), class_getInstanceMethod(self, @selector(verticalAlignDrawTextInRect:)));
}

#pragma mark - 长按复制

- (BOOL)canBecomeFirstResponder
{
    return self.copyingEnabled;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    // Only return YES for the copy: action AND the copyingEnabled property is YES.
    return (action == @selector(copy:) && self.copyingEnabled);
}

- (void)copy:(id)sender
{
    if(self.copyingEnabled)
    {
        // Copy the label text
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        [pasteboard setString:self.text];
    }
}


- (void) longPressGestureRecognized:(UIGestureRecognizer *) gestureRecognizer
{
    if (gestureRecognizer == self.longPressGestureRecognizer)
    {
        if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
        {
            [self becomeFirstResponder];
            
            UIMenuController *copyMenu = [UIMenuController sharedMenuController];
            [copyMenu setTargetRect:self.bounds inView:self];
            copyMenu.arrowDirection = UIMenuControllerArrowDefault;
            [copyMenu setMenuVisible:YES animated:YES];
        }
    }
}


- (BOOL)copyingEnabled
{
    return [objc_getAssociatedObject(self, @selector(copyingEnabled)) boolValue];
}

- (void)setCopyingEnabled:(BOOL)copyingEnabled
{
    if(self.copyingEnabled != copyingEnabled)
    {
        objc_setAssociatedObject(self, @selector(copyingEnabled), @(copyingEnabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [self setupGestureRecognizers];
    }
}

- (UILongPressGestureRecognizer *)longPressGestureRecognizer
{
    return objc_getAssociatedObject(self, @selector(longPressGestureRecognizer));
}

- (void)setLongPressGestureRecognizer:(UILongPressGestureRecognizer *)longPressGestureRecognizer
{
    objc_setAssociatedObject(self, @selector(longPressGestureRecognizer), longPressGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)shouldUseLongPressGestureRecognizer
{
    NSNumber *value = objc_getAssociatedObject(self, @selector(shouldUseLongPressGestureRecognizer));
    if(value == nil) {
        // Set the default value
        value = @YES;
        objc_setAssociatedObject(self, @selector(shouldUseLongPressGestureRecognizer), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return [value boolValue];
}

- (void)setShouldUseLongPressGestureRecognizer:(BOOL)useGestureRecognizer
{
    if(self.shouldUseLongPressGestureRecognizer != useGestureRecognizer)
    {
        objc_setAssociatedObject(self, @selector(shouldUseLongPressGestureRecognizer), @(useGestureRecognizer), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [self setupGestureRecognizers];
    }
}


- (void) setupGestureRecognizers
{
    // Remove gesture recognizer
    if(self.longPressGestureRecognizer) {
        [self removeGestureRecognizer:self.longPressGestureRecognizer];
        self.longPressGestureRecognizer = nil;
    }
    
    if(self.shouldUseLongPressGestureRecognizer && self.copyingEnabled) {
        self.userInteractionEnabled = YES;
        // Enable gesture recognizer
        self.longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureRecognized:)];
        [self addGestureRecognizer:self.longPressGestureRecognizer];
    }
}

@end
