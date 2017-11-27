//
//  ZXTransitionAnimator.h
//  Expecta
//
//  Created by Rookie on 27/11/2017.
//

#import <Foundation/Foundation.h>

@interface ZXTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter=isSpringEnabled) BOOL springEnabled;
@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, assign) CGFloat dampingRatio;
@property (nonatomic, assign) CGFloat velocity;

@property (nonatomic, copy) void (^presentedViewDidAddToContainerView)(ZXTransitionAnimator *animator, UIView *presentedView, UIView *containerView);


/**
 Override this method for configuring initial state of involved views

 @param fromView the 'from view' of the animation
 @param toView the 'to view' of the animation
 @param isPresentation YES if the animation happens in presentation process, otherwise NO
 */
- (void)configureInitialStateWithFromView:(UIView *)fromView toView:(UIView *)toView isPresentation:(BOOL)isPresentation;

/**
 Override this method for configuring Final state of involved views
 
 @param fromView the 'from view' of the animation
 @param toView the 'to view' of the animation
 @param isPresentation YES if the animation happens in presentation process, otherwise NO
 */
- (void)configureFinalStateWithFromView:(UIView *)fromView toView:(UIView *)toView isPresentation:(BOOL)isPresentation;

@end
