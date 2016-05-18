//
//  ZXPopPresentationController.m
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import "ZXPopPresentationController.h"

@interface ZXPopPresentationController ()

@property (nonatomic, strong) UIView *dimmingView;

@end

@implementation ZXPopPresentationController

- (CGRect)frameOfPresentedViewInContainerView {
    if (self.popPresentationDelegate && [self.popPresentationDelegate respondsToSelector:@selector(frameOfPresentedViewForPresentationController:)]) {
        return [self.popPresentationDelegate frameOfPresentedViewForPresentationController:self];
    }
    return CGRectInset(self.containerView.bounds, 20, 80);
}

- (void)presentationTransitionWillBegin {
    if (_dimming || _shouldDismissWhenTap) {
        _dimmingView = [UIView new];
        _dimmingView.frame = self.containerView.bounds;
        [self.containerView insertSubview:_dimmingView atIndex:0];
    }
    
    if (_shouldDismissWhenTap) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [_dimmingView addGestureRecognizer:tapGesture];
    }
    
    if (_dimming) {
        _dimmingView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        _dimmingView.alpha = 0;
        id<UIViewControllerTransitionCoordinator> coordinator = self.presentedViewController.transitionCoordinator;
        if (coordinator) {
            [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
                _dimmingView.alpha = 1;
            } completion:nil];
        } else {
            _dimmingView.alpha = 1;
        }
    }
}

- (void)presentationTransitionDidEnd:(BOOL)completed {
    if (!completed) {
        [_dimmingView removeFromSuperview];
    }
}

- (void)dismissalTransitionWillBegin {
    id<UIViewControllerTransitionCoordinator> coordinator = self.presentedViewController.transitionCoordinator;
    if (coordinator) {
        [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            _dimmingView.alpha = 0;
        } completion:nil];
    } else {
        _dimmingView.alpha = 0;
    }
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
    if (completed) {
        [_dimmingView removeFromSuperview];
    }
}

#pragma mark - Utils

/**
 *  dismiss when tapping dimming background.
 */
- (void)dismiss {
    if (self.popPresentationDelegate && [self.popPresentationDelegate respondsToSelector:@selector(presentationWillDismiss:)]) {
        [self.popPresentationDelegate presentationWillDismiss:self];
    }
    [self.presentedViewController dismissViewControllerAnimated:YES completion:^{
        if (self.popPresentationDelegate && [self.popPresentationDelegate respondsToSelector:@selector(presentationDidDismissed:)]) {
            [self.popPresentationDelegate presentationDidDismissed:self];
        }
    }];
}


@end
