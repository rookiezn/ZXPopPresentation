//
//  ZXTransitionAnimatorDefault.m
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import "ZXTransitionAnimatorDefault.h"

@implementation ZXTransitionAnimatorDefault

- (instancetype)init
{
    if (self = [super init])
    {
        self.scale = 0.25;
    }
    return self;
}

- (void)configureInitialStateWithFromView:(UIView *)fromView toView:(UIView *)toView isPresentation:(BOOL)isPresentation
{
    UIView *animatedView = isPresentation ? toView : fromView;
    CGAffineTransform transform = CGAffineTransformMakeScale(self.scale, self.scale);
    if (isPresentation)
    {
        animatedView.alpha = 0;
        animatedView.transform = transform;
    }
}

- (void)configureFinalStateWithFromView:(UIView *)fromView toView:(UIView *)toView isPresentation:(BOOL)isPresentation
{
    UIView *animatedView = isPresentation ? toView : fromView;
    CGAffineTransform transform = CGAffineTransformMakeScale(self.scale, self.scale);
    animatedView.transform = isPresentation ? CGAffineTransformIdentity : transform;
    animatedView.alpha = isPresentation ? 1 : 0;
}

@end
