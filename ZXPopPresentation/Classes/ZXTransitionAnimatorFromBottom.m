//
//  ZXTransitionAnimatorFromBottom.m
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import "ZXTransitionAnimatorFromBottom.h"

@implementation ZXTransitionAnimatorFromBottom

- (instancetype)init {
    if (self = [super init]) {
        _duration = 0.5;
        _dampingRatio = 0.7;
        _velocity = 0.7;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return _duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    
    BOOL isPresentation = !(toView == nil);
    
    UIViewController *animatedController = isPresentation ? toVC : fromVC;
    UIView *animatedView = isPresentation ? toView : fromView;
    animatedView.frame = [transitionContext finalFrameForViewController:animatedController];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.height;
    CGFloat offset = screenWidth - CGRectGetMinY(animatedView.frame);
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, offset);
    if (isPresentation) {
        [containerView addSubview:animatedView];
        animatedView.transform = transform;
    }
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:isPresentation ? _dampingRatio : 1
          initialSpringVelocity:_velocity
                        options:0
                     animations:^{
                         animatedView.transform = isPresentation ? CGAffineTransformIdentity : transform;
                     }
                     completion:^(BOOL finished) {
                         if (!isPresentation) {
                             [animatedView removeFromSuperview];
                         }
                         [transitionContext completeTransition:finished];
                     }];
};

@end
