//
//  ZXTransitionAnimator.m
//  Expecta
//
//  Created by Rookie on 27/11/2017.
//

#import "ZXTransitionAnimator.h"

@implementation ZXTransitionAnimator

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.duration = 0.4;
        self.springEnabled = YES;
        self.dampingRatio = 0.7;
        self.velocity = 0;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    
    BOOL isPresentation = !(toView == nil);
    
    UIViewController *animatedController = isPresentation ? toVC : fromVC;
    UIView *animatedView = isPresentation ? toView : fromView;
    animatedView.frame = [transitionContext finalFrameForViewController:animatedController];
    
    if (isPresentation)
    {
        [containerView addSubview:animatedView];
        if (self.presentedViewDidAddToContainerView)
        {
            self.presentedViewDidAddToContainerView(self, animatedView, containerView);
            [containerView layoutIfNeeded];
        }
    }
    
    [self configureInitialStateWithFromView:fromView toView:toView isPresentation:isPresentation];
    if (self.springEnabled)
    {
        [UIView animateWithDuration:self.duration delay:0 usingSpringWithDamping:self.dampingRatio initialSpringVelocity:self.velocity options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self configureFinalStateWithFromView:fromView toView:toView isPresentation:isPresentation];
        } completion:^(BOOL finished) {
            if (!isPresentation)
            {
                [animatedView removeFromSuperview];
            }
            [transitionContext completeTransition:finished];
        }];
    }
    else
    {
        [UIView animateWithDuration:self.duration animations:^{
            [self configureFinalStateWithFromView:fromView toView:toView isPresentation:isPresentation];
        } completion:^(BOOL finished) {
            if (!isPresentation)
            {
                [animatedView removeFromSuperview];
            }
            [transitionContext completeTransition:finished];
        }];
    }
}

- (void)configureInitialStateWithFromView:(UIView *)fromView toView:(UIView *)toView isPresentation:(BOOL)isPresentation
{

}

- (void)configureFinalStateWithFromView:(UIView *)fromView toView:(UIView *)toView isPresentation:(BOOL)isPresentation
{

}

@end
