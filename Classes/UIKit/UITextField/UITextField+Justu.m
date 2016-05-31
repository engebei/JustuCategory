//
//  UITextField+Justu.m
//  CategoryDemo
//
//  Created by zhubo on 15/12/18.
//  Copyright © 2015年 zhubo. All rights reserved.
//

#import "UITextField+Justu.h"
#import <objc/runtime.h>


@implementation UITextField (Justu)


static NSString *kLimitTextLengthKey = @"kLimitTextLengthKey";
static NSString *kEditEndBlockKey = @"kEditEndBlockKey";

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
