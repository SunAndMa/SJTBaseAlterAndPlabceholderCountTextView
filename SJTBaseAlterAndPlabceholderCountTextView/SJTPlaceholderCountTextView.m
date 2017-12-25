//
//  SJTPlaceholderCountTextView.m
//  SJTBaseAlterAndPlabceholderCountTextView
//
//  Created by sun on 2017/11/12.
//  Copyright © 2017年 sun. All rights reserved.
//

#import "SJTPlaceholderCountTextView.h"

@interface SJTPlaceholderCountTextView ()<UITextViewDelegate>
{
    UILabel *_placeholderLabel;
    UILabel *_countLabel;
}
@end

@implementation SJTPlaceholderCountTextView

+ (instancetype)placeholderCountTextView
{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0);
        [self makeSubviews];
        self.delegate = self;
        
    }
    return self;
    
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self setFrameForSubviews];
}

- (void)makeSubviews
{
    _placeholderLabel = [[UILabel alloc] init];
    _placeholderLabel.numberOfLines = 0;
    _placeholderLabel.font = [UIFont systemFontOfSize:14];
    _placeholderLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:_placeholderLabel];
    
    _countLabel = [[UILabel alloc] init];
    _countLabel.font = [UIFont systemFontOfSize:14];
    _countLabel.textColor = [UIColor lightGrayColor];
    _countLabel.textAlignment = NSTextAlignmentRight;
    _countLabel.text = @"0";
    [self addSubview:_countLabel];
 
}

- (void)setFrameForSubviews
{
    _placeholderLabel.frame =CGRectMake(5, 7, self.bounds.size.width - 10, 10);
    _countLabel.frame = CGRectMake(self.bounds.size.width - 100 -5, self.bounds.size.height - 25, 100, 25);
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (self.text.length > _maxCount && _maxCount) {
        self.text = [self.text substringToIndex:_maxCount];
    }
    _placeholderLabel.hidden = textView.text.length > 0;
    if (!_maxCount) {
        NSLog(@"%ld",textView.text.length);
        _countLabel.text = [NSString stringWithFormat:@"%ld",textView.text.length];
    }else{
        _countLabel.text = textView.text.length > self.maxCount ? [NSString stringWithFormat:@"-%ld/%ld",textView.text.length - self.maxCount ,_maxCount] : [NSString stringWithFormat:@"%ld/%ld",(long)textView.text.length,_maxCount];
    }
    _countLabel.textColor = (textView.text.length > self.maxCount && self.overConutColor != nil) ? self.overConutColor : [UIColor redColor];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        textView.text = [NSString stringWithFormat:@"%@%@",textView.text,text];
    }
    return YES;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholderLabel.text = placeholder;
    [_placeholderLabel sizeToFit];
}

- (void)setMaxCount:(NSInteger)maxCount{
    _maxCount = maxCount;
    _countLabel.text = [NSString stringWithFormat:@"0/%ld",maxCount];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y > 0) {
        _countLabel.frame = CGRectMake(self.bounds.size.width - 100 -5, self.bounds.size.height - 25 + scrollView.contentOffset.y, 100, 25);
    }
}

@end
