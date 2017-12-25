//
//  SJTBaseAlertView.h
//  SJTBaseAlterAndPlabceholderCountTextView
//
//  Created by Sun on 2017/8/29.
//  Copyright © 2017年 sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJTBaseAlertView : UIView

/**
 *  外部创建 alert api，内容视图自动居中
 *
 *  @param contentView 内容视图(即展示在用户眼前的内容视图)
 *     只需要 指定 contentView 的 width height
 *
 *  @return 实例
 */
-(instancetype)initAlertViewContentView:(UIView *)contentView;

/**
 *  显示
 */
-(void)show;

/**
 *   消失
 */
-(void)dismiss;

@end
