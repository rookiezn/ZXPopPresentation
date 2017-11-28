//
//  ZXTransitionAnimatorScale.m
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import "ZXTransitionAnimatorScale.h"

@implementation ZXTransitionAnimatorScale

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
    if (isPresentation)
    {
        animatedView.alpha = 0;
        animatedView.transform = CGAffineTransformMakeScale(self.scale, self.scale);;
    }
}

- (void)configureFinalStateWithFromView:(UIView *)fromView toView:(UIView *)toView isPresentation:(BOOL)isPresentation
{
    UIView *animatedView = isPresentation ? toView : fromView;
    animatedView.transform = isPresentation ? CGAffineTransformIdentity : CGAffineTransformMakeScale(self.scale, self.scale);;
    animatedView.alpha = isPresentation ? 1 : 0;
}

@end
