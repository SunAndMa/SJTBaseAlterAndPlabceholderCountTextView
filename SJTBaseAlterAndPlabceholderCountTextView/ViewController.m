//
//  ViewController.m
//  SJTBaseAlterAndPlabceholderCountTextView
//
//  Created by 孙继桐 on 2017/12/25.
//  Copyright © 2017年 Sun. All rights reserved.
//

#import "ViewController.h"

#import "SJTBaseAlertView.h"
#import "SJTPlaceholderCountTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    bgView.backgroundColor = [UIColor whiteColor];
    
    SJTPlaceholderCountTextView *textView = [SJTPlaceholderCountTextView placeholderCountTextView] ;
    textView.frame = CGRectMake(10, 10, 180, 150);
    textView.maxCount = 100;
    textView.placeholder = @"请输入50字以内";
    textView.overConutColor = [UIColor blueColor];
    [bgView addSubview:textView];
    
    SJTBaseAlertView *alertView = [[SJTBaseAlertView alloc] initAlertViewContentView:bgView];
    [alertView show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
