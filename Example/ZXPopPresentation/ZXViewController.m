//
//  ZXViewController.m
//  ZXPopPresentation
//
//  Created by rookiezn on 05/17/2016.
//  Copyright (c) 2016 rookiezn. All rights reserved.
//

#import "ZXViewController.h"
#import "ZXPresentedViewController.h"

@interface ZXViewController ()

@property (nonatomic, strong) UIButton *presentBtn1;
@property (nonatomic, strong) UIButton *presentBtn2;
@property (nonatomic, strong) UIButton *presentBtn3;
@property (nonatomic, strong) UIButton *presentBtn4;
@property (nonatomic, strong) UIButton *presentBtn5;

@end

@implementation ZXViewController

- (void)viewDidLoad {
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
    
    _presentBtn1 = [self btnWithTitle:@"default"];
    [_presentBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(10);
        make.centerX.mas_equalTo(0);
    }];
    
    _presentBtn2 = [self btnWithTitle:@"fade"];
    [_presentBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_presentBtn1.mas_bottom).offset(20);
        make.centerX.mas_equalTo(0);
    }];
    
    _presentBtn3 = [self btnWithTitle:@"from bottom"];
    [_presentBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_presentBtn2.mas_bottom).offset(20);
        make.centerX.mas_equalTo(0);
    }];
    
    _presentBtn4 = [self btnWithTitle:@"no dim"];
    [_presentBtn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_presentBtn3.mas_bottom).offset(20);
        make.centerX.mas_equalTo(0);
    }];
    
    _presentBtn5 = [self btnWithTitle:@"no tap dismiss"];
    [_presentBtn5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_presentBtn4.mas_bottom).offset(20);
        make.centerX.mas_equalTo(0);
    }];
}

- (void)present:(UIButton *)sender {
    ZXTransitionAnimationStyle style;
    BOOL dimming = YES;
    BOOL shouldDismissWhenTap = YES;
    if (sender == _presentBtn1) {
        style = ZXTransitionAnimationStyleDefault;
    } else if (sender == _presentBtn2) {
        style = ZXTransitionAnimationStyleFade;
    } else if (sender == _presentBtn3) {
        style = ZXTransitionAnimationStyleFromBottom;
    } else if (sender == _presentBtn4) {
        style = ZXTransitionAnimationStyleDefault;
        dimming = NO;
    } else if (sender == _presentBtn5) {
        style = ZXTransitionAnimationStyleDefault;
        shouldDismissWhenTap = NO;
    }
    ZXPresentedViewController *controller = [[ZXPresentedViewController alloc] initWithAnimationStyle:style];
    controller.dimming = dimming;
    controller.shouldDismissWhenTap = shouldDismissWhenTap;
    [self presentViewController:controller animated:YES completion:nil];
}

- (UIButton *)btnWithTitle:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(present:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    return btn;
}

@end
