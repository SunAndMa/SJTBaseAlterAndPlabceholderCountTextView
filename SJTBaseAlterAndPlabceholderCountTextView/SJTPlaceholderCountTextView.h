//
//  SJTPlaceholderCountTextView.h
//  SJTBaseAlterAndPlabceholderCountTextView
//
//  Created by sun on 2017/11/12.
//  Copyright © 2017年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJTPlaceholderCountTextView : UITextView

+ (instancetype)placeholderCountTextView;
/**
 *输入占位文字
 */
@property (nonatomic,copy) NSString *placeholder;

/**
 *输入应该输入的最大值，如果没有设置，将会展示输入的文字数量
 */
@property (nonatomic,assign) NSInteger maxCount;

/**
 *  输入文字数超过maxCount时候显示字数的颜色
 */
@property (nonatomic,strong) UIColor *overConutColor;

@end
