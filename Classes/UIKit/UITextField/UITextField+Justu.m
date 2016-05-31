//
//  UITextField+Justu.m
//  CategoryDemo
//
//  Created by zhubo on 15/12/18.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import "UITextField+Justu.h"
#import <objc/runtime.h>

typedef BOOL (^UITextFieldReturnBlock) (UITextField *textField);
typedef void (^UITextFieldVoidBlock) (UITextField *textField);
typedef BOOL (^UITextFieldCharacterChangeBlock) (UITextField *textField, NSRange range, NSString *replacementString);
@implementation UITextField (Justu)


static const void *UITextFieldDelegateKey = &UITextFieldDelegateKey;
static const void *UITextFieldShouldBeginEditingKey = &UITextFieldShouldBeginEditingKey;
static const void *UITextFieldShouldEndEditingKey = &UITextFieldShouldEndEditingKey;
static const void *UITextFieldDidBeginEditingKey = &UITextFieldDidBeginEditingKey;
static const void *UITextFieldDidEndEditingKey = &UITextFieldDidEndEditingKey;
static const void *UITextFieldShouldChangeCharactersInRangeKey = &UITextFieldShouldChangeCharactersInRangeKey;
static const void *UITextFieldShouldClearKey = &UITextFieldShouldClearKey;
static const void *UITextFieldShouldReturnKey = &UITextFieldShouldReturnKey;


static NSString *kLimitTextLengthKey = @"kLimitTextLengthKey";
static NSString *kEditEndBlockKey = @"kEditEndBlockKey";

#pragma mark - Blocks

//UITextField Delegate methods
+ (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    UITextFieldReturnBlock block = textField.shouldBegindEditingBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, UITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [delegate textFieldShouldBeginEditing:textField];
    }
    // return default value just in case
    return YES;
}
+ (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    UITextFieldReturnBlock block = textField.shouldEndEditingBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, UITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [delegate textFieldShouldEndEditing:textField];
    }
    // return default value just in case
    return YES;
}
+ (void)textFieldDidBeginEditing:(UITextField *)textField
{
    UITextFieldVoidBlock block = textField.didBeginEditingBlock;
    if (block) {
        block(textField);
    }
    id delegate = objc_getAssociatedObject(self, UITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}
+ (void)textFieldDidEndEditing:(UITextField *)textField
{
    UITextFieldVoidBlock block = textField.didEndEditingBlock;
    if (block) {
        block(textField);
    }
    id delegate = objc_getAssociatedObject(self, UITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}
+ (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    UITextFieldCharacterChangeBlock block = textField.shouldChangeCharactersInRangeBlock;
    if (block) {
        return block(textField,range,string);
    }
    id delegate = objc_getAssociatedObject(self, UITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}
+ (BOOL)textFieldShouldClear:(UITextField *)textField
{
    UITextFieldReturnBlock block = textField.shouldClearBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, UITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [delegate textFieldShouldClear:textField];
    }
    return YES;
}
+ (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    UITextFieldReturnBlock block = textField.shouldReturnBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, UITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [delegate textFieldShouldReturn:textField];
    }
    return YES;
}
//#pragma mark Block setting/getting methods
- (BOOL (^)(UITextField *))shouldBegindEditingBlock
{
    return objc_getAssociatedObject(self, UITextFieldShouldBeginEditingKey);
}
- (void)setShouldBegindEditingBlock:(BOOL (^)(UITextField *))shouldBegindEditingBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UITextFieldShouldBeginEditingKey, shouldBegindEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))shouldEndEditingBlock
{
    return objc_getAssociatedObject(self, UITextFieldShouldEndEditingKey);
}
- (void)setShouldEndEditingBlock:(BOOL (^)(UITextField *))shouldEndEditingBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UITextFieldShouldEndEditingKey, shouldEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UITextField *))didBeginEditingBlock
{
    return objc_getAssociatedObject(self, UITextFieldDidBeginEditingKey);
}
- (void)setDidBeginEditingBlock:(void (^)(UITextField *))didBeginEditingBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UITextFieldDidBeginEditingKey, didBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UITextField *))didEndEditingBlock
{
    return objc_getAssociatedObject(self, UITextFieldDidEndEditingKey);
}
- (void)setDidEndEditingBlock:(void (^)(UITextField *))didEndEditingBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UITextFieldDidEndEditingKey, didEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *, NSRange, NSString *))shouldChangeCharactersInRangeBlock
{
    return objc_getAssociatedObject(self, UITextFieldShouldChangeCharactersInRangeKey);
}
- (void)setShouldChangeCharactersInRangeBlock:(BOOL (^)(UITextField *, NSRange, NSString *))shouldChangeCharactersInRangeBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UITextFieldShouldChangeCharactersInRangeKey, shouldChangeCharactersInRangeBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))shouldReturnBlock
{
    return objc_getAssociatedObject(self, UITextFieldShouldReturnKey);
}
- (void)setShouldReturnBlock:(BOOL (^)(UITextField *))shouldReturnBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UITextFieldShouldReturnKey, shouldReturnBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))shouldClearBlock
{
    return objc_getAssociatedObject(self, UITextFieldShouldClearKey);
}
- (void)setShouldClearBlock:(BOOL (^)(UITextField *textField))shouldClearBlock
{
    [self setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, UITextFieldShouldClearKey, shouldClearBlock, OBJC_ASSOCIATION_COPY);
}
//#pragma mark control method

- (void)setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UITextFieldDelegate>)[self class]) {
        objc_setAssociatedObject(self, UITextFieldDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UITextFieldDelegate>)[self class];
    }
}



#pragma mark - 限制输入长度
- (void)limitTextLength:(int)length block:(EditEndBlock)block {
    objc_setAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey), [NSNumber numberWithInt:length], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (block) {
        objc_setAssociatedObject(self, (__bridge const void *)(kEditEndBlockKey), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    
    [self addTarget:self action:@selector(textFieldTextLengthLimit:) forControlEvents:UIControlEventEditingChanged];
    [self addTarget:self action:@selector(textFieldDidEndEdit:) forControlEvents:UIControlEventEditingDidEnd];
}

- (void)textFieldDidEndEdit:(UITextField *)textField {
    EditEndBlock block = objc_getAssociatedObject(self, (__bridge const void *)(kEditEndBlockKey));
    if (block) {
        block(textField.text);
    }
}

- (void)textFieldTextLengthLimit:(id)sender
{
    NSNumber *lengthNumber = objc_getAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey));
    int length = [lengthNumber intValue];
    //下面是修改部分
    bool isChinese;//判断当前输入法是否是中文
    NSArray *currentar = [UITextInputMode activeInputModes];
    UITextInputMode *current = [currentar firstObject];
    //[[UITextInputMode currentInputMode] primaryLanguage]，废弃的方法
    if ([current.primaryLanguage isEqualToString: @"zh-Hans"]) {
        isChinese = true;
    }
    else
    {
        isChinese = false;
    }
    if(sender == self) {
        // length是自己设置的位数
        NSString *str = [[self text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
        if (isChinese) { //中文输入法下
            UITextRange *selectedRange = [self markedTextRange];
            //获取高亮部分
            UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position) {
                if ( str.length>=length) {
                    NSString *strNew = [NSString stringWithString:str];
                    [self setText:[strNew substringToIndex:length]];
                }
            }
            else
            {
                // NSLog(@"输入的");
                
            }
        }else{
            if ([str length]>=length) {
                NSString *strNew = [NSString stringWithString:str];
                [self setText:[strNew substringToIndex:length]];
            }
        }
    }
}


@end
