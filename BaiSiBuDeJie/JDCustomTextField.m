//
//  JDCustomTextField.m
//  百思不得姐
//
//  Created by JiangDi on 16/6/2.
//  Copyright © 2016年 Google. All rights reserved.
//

#import "JDCustomTextField.h"

// Placeholder原始颜色：
#define kOriginalColor JDColor(51, 41, 48, 1.0f)
// Placeholder编辑状态颜色：
#define kEditingColor JDColor(255, 255, 255, 0.9f)


@implementation JDCustomTextField

-(void)awakeFromNib {
    // 设置光标颜色：
    [self setTintColor:[UIColor whiteColor]];
    // KVC设置Placeholder文本颜色：
    [self setPlaceholderColor:kOriginalColor];
    // 监听文本框状态：
#warning 只要是继承于UIControl的控件都能addTarget。
#warning 此处也可以用代理实现，但不建议使用。
    /**
    [self addTarget:self action:@selector(editingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(editingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
     */
    // 通知的方式实现：
    /*
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editingDidBegin) name:UITextFieldTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editingDidEnd) name:UITextFieldTextDidEndEditingNotification object:self];
     **/
}


/**
 *  文本框进入编辑状态后：
 */
/**
-(void)editingDidBegin {
    JDFunc;
    [self setValue:kEditingColor forKeyPath:TextFieldPlaceholderColorKey];
}
 */

/**
 *  为本框退出编辑状态后：
 */
/**
-(void)editingDidEnd {
    JDFunc;
    [self setValue:kOriginalColor forKeyPath:TextFieldPlaceholderColorKey];
}
*/

/**
 重写textField内部的两个方法，也可以实现：
 */
// 当textField成为第一响应点时调用：
-(BOOL)becomeFirstResponder {
    [self setPlaceholderColor:kEditingColor];
    return [super becomeFirstResponder];
}

// 当textField失去第一响应点时调用：
-(BOOL)resignFirstResponder {
    [self setPlaceholderColor:kOriginalColor];
    return [super resignFirstResponder];
}

@end
