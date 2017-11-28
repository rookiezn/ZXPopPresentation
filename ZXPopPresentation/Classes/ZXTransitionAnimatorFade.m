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
    if (isPresentation)
    {
        animatedView.alpha = 0;
        animatedView.transform = CGAffineTransformMakeTranslation(self.offsetX, self.offsetY);
    }
}

- (void)configureFinalStateWithFromView:(UIView *)fromView toView:(UIView *)toView isPresentation:(BOOL)isPresentation
{
    UIView *animatedView = isPresentation ? toView : fromView;
    animatedView.transform = isPresentation ? CGAffineTransformIdentity : CGAffineTransformMakeTranslation(self.offsetX, self.offsetY);;
    animatedView.alpha = isPresentation ? 1 : 0;
}

@end
