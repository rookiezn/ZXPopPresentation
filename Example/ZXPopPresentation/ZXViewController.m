//
//  ZXViewController.m
//  ZXPopPresentation
//
//  Created by rookiezn on 05/17/2016.
//  Copyright (c) 2016 rookiezn. All rights reserved.
//

#import "ZXViewController.h"
#import "ZXPresentedViewController.h"
#import "ZXPopPresentation.h"
#import "ZXPopTransitionDelegate.h"

@interface ZXViewController ()

@property (nonatomic, strong) UIButton *presentBtn1;
@property (nonatomic, strong) UIButton *presentBtn2;
@property (nonatomic, strong) UIButton *presentBtn3;

@property (nonatomic, strong) __kindof ZXTransitionAnimator *animator;
@property (nonatomic, strong) ZXPopTransitionDelegate *popTransitionDelegate;

@end

@implementation ZXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Reflection"]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(300);
    }];
    
    [self.view addSubview:self.presentBtn1 = [self btnWithTitle:@"default"]];
    [self.presentBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
    }];
    
    [self.view addSubview:self.presentBtn2 = [self btnWithTitle:@"fade"]];
    [self.presentBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.presentBtn1.mas_bottom).offset(20);
        make.centerX.mas_equalTo(0);
    }];
    
    [self.view addSubview:self.presentBtn3 = [self btnWithTitle:@"from bottom"]];
    [self.presentBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.presentBtn2.mas_bottom).offset(20);
        make.centerX.mas_equalTo(0);
    }];
}

- (void)present:(UIButton *)sender
{
    ZXPopPresentationStyle style = 0;
    if (sender == self.presentBtn1)
    {
        style = ZXPopPresentationStyleDefault;
    }
    else if (sender == self.presentBtn2)
    {
        style = ZXPopPresentationStyleFade;
    }
    else if (sender == self.presentBtn3)
    {
        style = ZXPopPresentationStyleFromBottom;
    }
    ZXPresentedViewController *controller = [[ZXPresentedViewController alloc] init];
    self.popTransitionDelegate = [[ZXPopTransitionDelegate alloc] initWithStyle:style];
    controller.transitioningDelegate = self.popTransitionDelegate;
    controller.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:controller animated:YES completion:nil];
}

- (UIButton *)btnWithTitle:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(present:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    return btn;
}

@end
