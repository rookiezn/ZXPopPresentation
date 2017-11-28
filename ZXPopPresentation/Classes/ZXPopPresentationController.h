//
//  ZXPopPresentationController.h
//  Pods
//
//  Created by Zinc on 5/17/16.
//
//

#import <UIKit/UIKit.h>

@class ZXPopPresentationController;

@protocol ZXPopPresentationDelegate <NSObject>

@optional

/**
 Tells the delegate that the presentation animations are about to start

 @param presentationController the presentation controller
 */
- (void)zx_presentationTransitionWillBegin:(ZXPopPresentationController *)presentationController;

/**
 Tells the delegate that the presentation animations finished

 @param presentationController the presentation controller
 */
- (void)zx_presentationTransitionDidEnd:(ZXPopPresentationController *)presentationController;

/**
 Tells the delegate that the dismissal animations are about to start

 @param presentationController the presentation controller
 */
- (void)zx_dismissalTransitionWillBegin:(ZXPopPresentationController *)presentationController;

/**
 Tells the delegate that the dismissal animations finished

 @param presentationController the presentation controller
 */
- (void)zx_dismissalTransitionDidEnd:(ZXPopPresentationController *)presentationController;

/**
 Ask the delegate for the frame of the presented view in container view

 @param presentationController the presentation controller
 @return frame of the prsented view in container view
 */
- (CGRect)zx_frameOfPresentedViewInContainerView:(ZXPopPresentationController *)presentationController;

/**
 Called when the user taps outside the presented view

 @param presentationController the presentation controller
 @param point the touch point in the container view coordinate
 @discussion If you don't implement this method, the default behaviour is dismissing the presented view controller
 */
- (void)zx_presentationController:(ZXPopPresentationController *)presentationController didTapOutsideAtPoint:(CGPoint)point;

@end

@interface ZXPopPresentationController : UIPresentationController

@property (nonatomic, weak) id<ZXPopPresentationDelegate> popPresentationDelegate;

/**
 Alpha of the background view.
 */
@property (nonatomic, assign) CGFloat backgroundAlpha;

@end
