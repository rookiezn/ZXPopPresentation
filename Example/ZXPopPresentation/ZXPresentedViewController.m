//
//  ZXPresentedViewController.m
//  ZXPopPresentation
//
//  Created by Zinc on 5/17/16.
//  Copyright © 2016 rookiezn. All rights reserved.
//

#import "ZXPresentedViewController.h"

@interface ZXPresentedViewController ()

@end

@implementation ZXPresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.cornerRadius = 10;
    self.view.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.view.layer.borderWidth = 1;
    self.view.clipsToBounds = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"dismiss" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    btn.layer.borderColor = [UIColor darkGrayColor].CGColor;
    btn.layer.borderWidth = 1;
    btn.layer.cornerRadius = 5;
    btn.clipsToBounds = YES;
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(100);
    }];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)presentationWillDismiss:(ZXPopPresentationController *)presentationController {
    NSLog(@"will dismiss");
}

- (void)presentationDidDismissed:(ZXPopPresentationController *)presentationController {
    NSLog(@"did dismiss");
}

- (CGRect)frameOfPresentedViewForPresentationController:(ZXPopPresentationController *)controller {
    CGFloat width = controller.containerView.bounds.size.width - 60;
    CGFloat height = controller.containerView.bounds.size.height - 200;
    return CGRectMake(30, 150, width, height);
}

@end
