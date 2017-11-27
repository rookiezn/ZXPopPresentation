//
//  ZXPopTransitionDelegate.m
//  ZXPopPresentation_Example
//
//  Created by Rookie on 27/11/2017.
//  Copyright © 2017 rookiezn. All rights reserved.
//

#import "ZXPopTransitionDelegate.h"
#import "ZXPopPresentation.h"

@interface ZXPopTransitionDelegate ()

@end

@implementation ZXPopTransitionDelegate

- (instancetype)initWithStyle:(ZXPopPresentationStyle)style
{
    if (self = [super init])
    {
        switch (style)
        {
            case ZXPopPresentationStyleDefault:
            {
                self.animator = [ZXTransitionAnimatorDefault new];
                break;
            }
            case ZXPopPresentationStyleFade:
            {
                self.animator = [ZXTransitionAnimatorFade new];
                break;
            }
            default:
            {
                self.animator = [ZXTransitionAnimatorFromBottom new];
                break;
            }
        }
        self.animator.presentedViewDidAddToContainerView = ^(ZXTransitionAnimator *animator, UIView *presentedView, UIView *containerView) {
            [presentedView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(UIEdgeInsetsMake(50, 10, 50, 10));
            }];
        };
    }
    return self;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[ZXPopPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.animator;
}

@end
