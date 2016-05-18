//
//  ZXPopViewController.m
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import "ZXPopViewController.h"
#import "ZXTransitionAnimatorDefault.h"
#import "ZXTransitionAnimatorFade.h"
#import "ZXTransitionAnimatorFromBottom.h"

@interface ZXPopViewController ()

@property (nonatomic, strong) ZXPopPresentationController *popPresentationController;

@end

@implementation ZXPopViewController

- (instancetype)initWithAnimationStyle:(ZXTransitionAnimationStyle)style {
    if (self = [self init]) {
        _style = style;
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
        _style = ZXTransitionAnimationStyleDefault;
        _dimming = YES;
        _shouldDismissWhenTap = YES;
    }
    return self;
}

- (void)setDimming:(BOOL)dimming {
    _dimming = dimming;
    [_popPresentationController setDimming:dimming];
}

- (void)setShouldDismissWhenTap:(BOOL)shouldDismissWhenTap {
    _shouldDismissWhenTap = shouldDismissWhenTap;
    [_popPresentationController setShouldDismissWhenTap:shouldDismissWhenTap];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
                                                      presentingViewController:(UIViewController *)presenting
                                                          sourceViewController:(UIViewController *)source {
    if (!_popPresentationController) {
        _popPresentationController = [[ZXPopPresentationController alloc] initWithPresentedViewController:presented
                                                                                 presentingViewController:presenting];
        _popPresentationController.popPresentationDelegate = self;
        _popPresentationController.dimming = _dimming;
        _popPresentationController.shouldDismissWhenTap = _shouldDismissWhenTap;
    }
    return _popPresentationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    return [self animator];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [self animator];
}

- (id<UIViewControllerAnimatedTransitioning>)animator {
    switch (_style) {
        case ZXTransitionAnimationStyleFade:
            return [ZXTransitionAnimatorFade new];
        case ZXTransitionAnimationStyleFromBottom:
            return [ZXTransitionAnimatorFromBottom new];
        default:
            return [ZXTransitionAnimatorDefault new];
    }
}

@end
