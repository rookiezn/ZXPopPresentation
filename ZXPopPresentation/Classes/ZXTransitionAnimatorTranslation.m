//
//  ZXTransitionAnimatorTranslation.m
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import "ZXTransitionAnimatorTranslation.h"

@implementation ZXTransitionAnimatorTranslation

- (void)configureInitialStateWithFromView:(UIView *)fromView toView:(UIView *)toView isPresentation:(BOOL)isPresentation
{
    UIView *animatedView = isPresentation ? toView : fromView;
    if (isPresentation)
    {
        animatedView.transform = [self transformWithAnimatedView:animatedView];
    }
}

- (void)configureFinalStateWithFromView:(UIView *)fromView toView:(UIView *)toView isPresentation:(BOOL)isPresentation
{
    UIView *animatedView = isPresentation ? toView : fromView;
    animatedView.transform = isPresentation ? CGAffineTransformIdentity : [self transformWithAnimatedView:animatedView];;
}

- (CGAffineTransform )transformWithAnimatedView:(UIView *)animatedView
{
    CGAffineTransform transform;
    switch (self.direction)
    {
        case ZXTransitionDirectionFromBottom:
        {
            CGFloat superviewHeight = animatedView.superview.bounds.size.height;
            transform = CGAffineTransformMakeTranslation(0, superviewHeight - CGRectGetMinY(animatedView.frame));
            break;
        }
        case ZXTransitionDirectionFromTop:
        {
            transform = CGAffineTransformMakeTranslation(0, -CGRectGetMaxY(animatedView.frame));
            break;
        }
        case ZXTransitionDirectionFromLeft:
        {
            transform = CGAffineTransformMakeTranslation(-CGRectGetMaxX(animatedView.frame), 0);
            break;
        }
        default:
        {
            CGFloat superviewWidth = animatedView.superview.bounds.size.width;
            transform = CGAffineTransformMakeTranslation(superviewWidth - CGRectGetMinX(animatedView.frame), 0);
            break;
        }
    }
    return transform;
}

@end
