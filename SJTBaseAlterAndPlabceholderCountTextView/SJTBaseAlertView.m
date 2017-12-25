//
//  SJTBaseAlertView.m
//  SJTBaseAlterAndPlabceholderCountTextView
//
//  Created by sun on 2017/8/29.
//  Copyright © 2017年 sun. All rights reserved.
//

#import "SJTBaseAlertView.h"
#define SJTHEIGHT [UIScreen mainScreen].bounds.size.height
#define SJTWIDTH [UIScreen mainScreen].bounds.size.width

@interface SJTBaseAlertView ()
{
    UIView *_bgView;
}
@property (nonatomic,strong)UIView *contentView;

@end

@implementation SJTBaseAlertView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    if (self=[super initWithFrame:frame]) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SJTWIDTH, SJTHEIGHT)];
        _bgView.backgroundColor = [UIColor colorWithWhite:0.6 alpha:0.6];
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [_bgView addGestureRecognizer:tap];
        [self addSubview:_bgView];
    }
    return self;
}

-(instancetype)initAlertViewContentView:(UIView *)contentView
{
    SJTBaseAlertView *alertView=[[SJTBaseAlertView alloc] initWithFrame:CGRectMake(0, 0, SJTWIDTH, SJTHEIGHT)];
    alertView.contentView=contentView;
    alertView.contentView.center=[UIApplication sharedApplication].keyWindow.center;
    [alertView addSubview:alertView.contentView];
    
    return alertView;
}

-(void)tap
{
    if (_bgView){
        [self dismiss];
    }
}

- (void)show
{
    
    _contentView.alpha=0.7;

    [UIView animateWithDuration:0.25f animations:^{

        self->_contentView.alpha=1.0;
    } completion:^(BOOL finished) {
  
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShow:) name:UIKeyboardWillShowNotification object:nil];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHide:) name:UIKeyboardWillHideNotification object:nil];

    }];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

- (void)willShow:(NSNotification *)noti{
    NSValue* aValue = [noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    //键盘的大小
    CGSize keyboardRect = [aValue CGRectValue].size;
    
    if (SJTHEIGHT-keyboardRect.height<self->_contentView.frame.origin.y+self->_contentView.frame.size.height) {
        [UIView animateWithDuration:0.3 animations:^{
           
            CGFloat y = self->_contentView.frame.origin.y-((self->_contentView.frame.origin.y+self->_contentView.frame.size.height)-(SJTHEIGHT-keyboardRect.height)+20);
            self->_contentView.frame = CGRectMake(self->_contentView.frame.origin.x, y, self->_contentView.frame.size.width, self->_contentView.frame.size.height);
        }];
    }

}

- (void)willHide:(NSNotification *)noti{
    self.contentView.center=[UIApplication sharedApplication].keyWindow.center;
}

- (void)dismiss
{

    [UIView animateWithDuration:0.25f animations:^{
   
        self->_contentView.alpha=0.7;
    } completion:^(BOOL finished) {
      
        [self removeFromSuperview];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
        
    }];
}

@end
