//
//  ZXPopPresentationController.m
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import "ZXPopPresentationController.h"

@interface ZXPopPresentationController ()

@property (nonatomic, strong) UIView *backgroundView;

@end

@implementation ZXPopPresentationController

- (CGRect)frameOfPresentedViewInContainerView
{
    if ([self.popPresentationDelegate respondsToSelector:@selector(zx_frameOfPresentedViewInContainerView:)])
    {
        return [self.popPresentationDelegate zx_frameOfPresentedViewInContainerView:self];
    }
    return CGRectInset(self.containerView.bounds, 20, 80);
}

- (void)presentationTransitionWillBegin
{
    if ([self.popPresentationDelegate respondsToSelector:@selector(zx_presentationTransitionWillBegin:)])
    {
        [self.popPresentationDelegate zx_presentationTransitionWillBegin:self];
    }
    
    [self.containerView insertSubview:self.backgroundView atIndex:0];
    
    self.backgroundView.alpha = 0;
    id<UIViewControllerTransitionCoordinator> coordinator = self.presentedViewController.transitionCoordinator;
    if (coordinator)
    {
        [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            self.backgroundView.alpha = 1;
        } completion:nil];
    }
    else
    {
        self.backgroundView.alpha = 1;
    }
}

- (void)presentationTransitionDidEnd:(BOOL)completed {
    if ([self.popPresentationDelegate respondsToSelector:@selector(zx_presentationTransitionDidEnd:)])
    {
        [self.popPresentationDelegate zx_presentationTransitionDidEnd:self];
    }
    
    if (!completed) {
        [self.backgroundView removeFromSuperview];
    }
}

- (void)dismissalTransitionWillBegin {
    if ([self.popPresentationDelegate respondsToSelector:@selector(zx_dismissalTransitionWillBegin:)])
    {
        [self.popPresentationDelegate zx_dismissalTransitionWillBegin:self];
    }
    
    id<UIViewControllerTransitionCoordinator> coordinator = self.presentedViewController.transitionCoordinator;
    if (coordinator)
    {
        [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            self.backgroundView.alpha = 0;
        } completion:nil];
    }
    else
    {
        self.backgroundView.alpha = 0;
    }
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
    if ([self.popPresentationDelegate respondsToSelector:@selector(zx_dismissalTransitionDidEnd:)])
    {
        [self.popPresentationDelegate zx_dismissalTransitionDidEnd:self];
    }
    
    if (completed)
    {
        [self.backgroundView removeFromSuperview];
    }
}

#pragma mark - Property

- (UIView *)backgroundView
{
    if (!_backgroundView)
    {
        _backgroundView = [[UIView alloc] initWithFrame:self.containerView.bounds];
        _backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapBackgroundView:)];
        [_backgroundView addGestureRecognizer:tapGesture];
    }
    return _backgroundView;
}

#pragma mark - Action

- (void)handleTapBackgroundView:(UITapGestureRecognizer *)tapGesture
{
    if ([self.popPresentationDelegate respondsToSelector:@selector(zx_presentationController:didTapOutsideAtPoint:)])
    {
        [self.popPresentationDelegate zx_presentationController:self didTapOutsideAtPoint:[tapGesture locationInView:self.containerView]];
    }
    else
    {
        [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
