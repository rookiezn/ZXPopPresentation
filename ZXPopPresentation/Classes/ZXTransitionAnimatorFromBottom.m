//
//  ZXTransitionAnimatorFromBottom.m
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import "ZXTransitionAnimatorFromBottom.h"

@implementation ZXTransitionAnimatorFromBottom

- (void)configureInitialStateWithFromView:(UIView *)fromView toView:(UIView *)toView isPresentation:(BOOL)isPresentation
{
    UIView *animatedView = isPresentation ? toView : fromView;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.height;
    CGFloat offset = screenWidth - CGRectGetMinY(animatedView.frame);
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, offset);
    if (isPresentation)
    {
        animatedView.transform = transform;
    }
}

- (void)configureFinalStateWithFromView:(UIView *)fromView toView:(UIView *)toView isPresentation:(BOOL)isPresentation
{
    UIView *animatedView = isPresentation ? toView : fromView;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.height;
    CGFloat offset = screenWidth - CGRectGetMinY(animatedView.frame);
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, offset);
    animatedView.transform = isPresentation ? CGAffineTransformIdentity : transform;
}

@end
