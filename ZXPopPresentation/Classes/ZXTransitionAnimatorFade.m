//
//  ZXTransitionAnimatorFade.m
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import "ZXTransitionAnimatorFade.h"

@implementation ZXTransitionAnimatorFade

- (instancetype)init
{
    if (self = [super init])
    {
        self.offsetX = 0;
        self.offsetY = 50;
    }
    return self;
}

- (void)configureInitialStateWithFromView:(UIView *)fromView toView:(UIView *)toView isPresentation:(BOOL)isPresentation
{
    UIView *animatedView = isPresentation ? toView : fromView;
    CGAffineTransform transform = CGAffineTransformMakeTranslation(self.offsetX, self.offsetY);
    if (isPresentation)
    {
        animatedView.alpha = 0;
        animatedView.transform = transform;
    }
}

- (void)configureFinalStateWithFromView:(UIView *)fromView toView:(UIView *)toView isPresentation:(BOOL)isPresentation
{
    UIView *animatedView = isPresentation ? toView : fromView;
    CGAffineTransform transform = CGAffineTransformMakeTranslation(self.offsetX, self.offsetY);
    animatedView.transform = isPresentation ? CGAffineTransformIdentity : transform;
    animatedView.alpha = isPresentation ? 1 : 0;
}

@end
